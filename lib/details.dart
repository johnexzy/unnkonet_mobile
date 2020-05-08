import 'package:UNNKONET/logic/dateString.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:UNNKONET/screen/webview.dart';
import 'package:UNNKONET/style.dart';
import 'comment.model.dart';
import 'datumcom.dart';
import 'datum.api.dart';
import 'package:flutter/cupertino.dart';
import 'screen/image_banner.dart';
import 'screen/testmain.dart';
import 'style.dart';

class Details extends StatefulWidget {
  final List list;
  final int index;

  Details(this.list, this.index);

  @override
  _DetailsState createState() => _DetailsState(list, index);
}

class _DetailsState extends State<Details> {
  final List list;
  final int index;
  _DetailsState(this.list, this.index);
  String err;

  final TextEditingController _names = new TextEditingController();
  final TextEditingController _comments = new TextEditingController();
  Future<List<Comment>> _futureCom;
  bool isLiked = true;
  Datum data;
  List<Comment> comm;
  List<Widget> commen;
  int len;
  @override
  void initState() {
    super.initState();
    err = "";
    data = list[index];
    _futureCom = getCom(data.tag);
    commen = [];
    comm = data.comments;
    len = comm.length;
  }

  Widget build(BuildContext context) {
    //print(comm[0].comments);
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: data.headline,
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: true,
            automaticallyImplyLeading: true,
            previousPageTitle: 'back',
            leading: GestureDetector(child: Icon(Icons.arrow_back), onTap: (){
              print(Navigator.of(context).pop());
            },),
            middle: Text(data.headline, style: TextStyle(fontSize: 16.0)),
          ),
          child: Scaffold(
            body: ListView(children: <Widget>[
              ImageBanner(
                  data.uploads,
                  0, //Border Top Radius of the Image
                  0 //Border Bottom Radius of the Image
                  ),
              TextSection(Colors.transparent, data.headline, data.body),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.create,
                        size: CTS + 4.0,
                      ),
                      Text(
                        ": " + data.writer,
                        style: CaptionTextStyle,
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                elevation: 5,
                color: Color.fromRGBO(212, 211, 214, 1),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  controller: null,
                  child: Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //
                            Text(
                              " DROP YOUR COMMENT",
                              style: TextStyle(
                                  color: Color.fromARGB(
                                    204,
                                    49,
                                    85,
                                    101,
                                  ),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 19),
                            ),
                            Icon(
                              Icons.message,
                              color: Color.fromARGB(
                                204,
                                49,
                                85,
                                101,
                              ),
                            ),
                          ]),
                      Text(
                        err,
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 12),
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Name",
                                  style: Theme.of(context).textTheme.caption,
                                  textAlign: TextAlign.left,
                                ),
                                TextField(
                                  decoration: InputDecoration(hintText: "Name"),
                                  controller: _names,
                                  enableSuggestions: true,
                                  autocorrect: true,
                                )
                              ])),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 12),
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Comment",
                                  style: Theme.of(context).textTheme.caption,
                                  textAlign: TextAlign.left,
                                ),
                                TextField(
                                  decoration:
                                      InputDecoration(hintText: "Write Here"),
                                  controller: _comments,
                                  enableSuggestions: true,
                                  autocorrect: true,
                                )
                              ])),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 65),
                        child: RaisedButton(
                          color: konetblue,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          elevation: 6.0,
                          child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.send,
                                  color: Colors.white,
                                )
                              ]),
                          onPressed: () {
                            if (_comments.text != "") {
                              print("not empty");
                              setState(() {
                                len++;
                                commen = [];
                                err = "";
                                _futureCom = postCom(
                                    data.tag, _names.text, _comments.text);
                                _comments.text = "";
                              });
                            } else {
                              print("Fields cannot be empty");
                              setState(() {
                                err = "Fields cannot be empty";
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.comments),
                    Text(
                      " COMMENTS ($len)",
                      style: CaptionTextStyle,
                    )
                  ]),
              Divider(),
              Container(
                child: FutureBuilder(
                  future: _futureCom,
                  builder: (context, ss) {
                    if (ss.hasData) {
                      commen = [];
                      comm = ss.data;
                      return Column(
                        children: _commentDispatcher(comm), //Comments goes here
                      );
                    }
                    commen = [];
                    return Column(
                      children: _commentDispatcher(comm), //Comments goes here
                    );
                  },
                ),
              ),
            ]),
            bottomNavigationBar: Container(
                constraints: BoxConstraints.tightFor(width: 200),
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: RaisedButton(
                  child: Text(
                    "VIEW IN WEBSITE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        fontFamily: FontName),
                  ),
                  color: Colors.red,
                  onPressed: () {
                    _lauchURL(
                        "https://unnkonet.com.ng/views/news/view.php?id=" +
                            data.id);
                  },
                )),
          )),
    );
  }

  _lauchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Open $url';
    }
  }

  List<Widget> _commentDispatcher(List<Comment> comm) {
    if (len > 0) {
      for (Comment m in comm) {
        print(m.comments);
        DateTime timeof = m.timeat;
        CheckDate datestr = new CheckDate(timeof);
        commen.add(Container(
            padding: EdgeInsets.fromLTRB(10, 1, 10, 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Text(com.comments),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(81, 110, 162, 0.75),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              padding: EdgeInsets.fromLTRB(10, 1, 0, 12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  textDirection: TextDirection.ltr,
                                  children: [
                                    Text(m.names,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            fontSize: 15)),
                                    Container(
                                      child: Text(
                                        m.comments,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      width: 222,
                                      padding: EdgeInsets.fromLTRB(14, 5, 0, 4),
                                      //color: Colors.transparent,
                                    ),
                                    Row(children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 12.0,
                                        color: Color.fromRGBO(0, 0, 10, 0.6),
                                      ),
                                      Text(
                                        "'" + datestr.computeDateString(),
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 10, 0.6),
                                            fontSize: 12),
                                      )
                                    ]),
                                  ])),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 6),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 98, 98, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          FontAwesomeIcons.user,
                          size: 33.0,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                  SizedBox(
                    height: 0,
                  ),
                ])));
      }
    } else {
      commen.add(Container(
        child: Text("NO COMMENTS YET"),
      ));
      // return Container(child: Text(comm[0].comments),);
    }
    return commen;
  }
}
