// import 'package:UNNKONET/screen/test.dart';
import 'package:flutter/material.dart';
import 'package:UNNKONET/screen/webview.dart';
import 'package:UNNKONET/style.dart';
import 'datum.ent.dart';
import 'package:flutter/cupertino.dart';
import 'screen/image_banner.dart';
import 'screen/testmain.dart';

class Details extends StatefulWidget {
  final List list;
  final int index;
  final String tablename;
  Details(this.list, this.index, this.tablename);

  @override
  _DetailsState createState() => _DetailsState(tablename);
}

class _DetailsState extends State<Details> {
  final String tablename;
  _DetailsState(this.tablename);
  @override
  Widget build(BuildContext context) {
    Datum data = widget.list[widget.index];

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: data.header,
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: true,
            middle: Text(data.header),
          ),
          child: Scaffold(
            body: Container(
              child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: <Widget>[
                    ImageBanner(
                        data.image,
                        0, //Border Top Radius of the Image
                        0 //Border Bottom Radius of the Image
                        ),
                    TextSection(Colors.transparent, data.header, data.body),
                  ]),
            ),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyWebView(
                            selectedUrl: (tablename == "advert")
                                ? "https://unnkonet.com.ng/views/" +
                                    tablename +
                                    "s/view.php?id=" +
                                    data.id +
                                    "&getadvertinfo=read+more"
                                : "https://unnkonet.com.ng/views/" +
                                    tablename +
                                    "s/view.php?id=" +
                                    data.id +
                                    "&getentertainmentinfo=read+more")));
                  },
                )),
          )),
    );
  }
}
