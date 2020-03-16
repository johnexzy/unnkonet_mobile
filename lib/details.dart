// import 'package:UNNKONET/screen/test.dart';
import 'dart:ui';

import 'package:UNNKONET/logic/dateString.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:UNNKONET/screen/webview.dart';
import 'package:UNNKONET/style.dart';
import 'datumcom.dart';
import 'package:flutter/cupertino.dart';
import 'screen/image_banner.dart';
import 'screen/testmain.dart';
import 'style.dart';

class Details extends StatefulWidget {
  final List list;
  final int index;

  Details(this.list, this.index);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    Datum data = widget.list[widget.index];
    List<Comment> comm = data.comments;
    int len = comm.length;
    bool isLiked = true;
    //print(comm[0].comments);
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: data.headline,
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: true,
            automaticallyImplyLeading: true,
            previousPageTitle: 'back',
            middle: Text(data.headline, style: TextStyle(fontSize: 16.0)),
          ),
          child: Scaffold(
            body: Container(
              child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: <Widget>[
                    ImageBanner(
                        data.uploads,
                        0, //Border Top Radius of the Image
                        0 //Border Bottom Radius of the Image
                        ),
                    // Row(
                    //   children: <Widget>[
                    //     IconButton(
                    //         icon: Icon(isLiked
                    //             ? Icons.favorite_border
                    //             : Icons.favorite),
                    //         onPressed: () => setState(() {
                    //               isLiked ? isLiked = false : isLiked = true;
                    //             })),
                    //     IconButton(
                    //         color: Colors.red,
                    //         icon: Icon(isLiked
                    //             ? FontAwesomeIcons.thumbsUp
                    //             : Icons.favorite),
                    //         onPressed: () => setState(() {
                    //               isLiked ? isLiked = false : isLiked = true;
                    //             })),
                    //   ],
                    // ),
                    TextSection(Colors.transparent, data.headline, data.body),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(),
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
                    ListView.builder(
                      itemCount: comm.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        Comment com = comm[index];
                        if (comm.length > 0) {
                          print(com.comments);
                          DateTime timeof = com.timeat;
                          CheckDate datestr = new CheckDate(timeof);
                          // int dayss = timeof.day.toInt();
                          // String after = DateTime.now()
                          //     .subtract(Duration(days: dayss))
                          //     .toString();
                          // String johh = DateTime(timeof.year, timeof.month,
                          //         timeof.day, timeof.hour, timeof.minute)
                          //     .toLocal()
                          //     .toString();
                          return Container(
                              padding: EdgeInsets.fromLTRB(10, 1, 10, 12),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    // Text(com.comments),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        81, 110, 162, 0.75),
                                                    borderRadius: BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20))),
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 1, 0, 12),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    children: [
                                                      Text(com.names,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15)),
                                                      Container(
                                                        child: Text(
                                                          com.comments,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16),
                                                        ),
                                                        width: 222,
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                14, 5, 0, 4),
                                                        //color: Colors.transparent,
                                                      ),
                                                      Row(children: [
                                                        Icon(
                                                          Icons.access_time,
                                                          size: 12.0,
                                                          color: Colors.black,
                                                        ),
                                                        Text(
                                                          "'" +
                                                              datestr
                                                                  .computeDateString(),
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(0,
                                                                      0, 0, 1),
                                                              fontSize: 12),
                                                        )
                                                      ]),
                                                    ])),
                                          ],
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 6),
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(230, 98, 98, 1),
                                            borderRadius:
                                                BorderRadius.circular(30),
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
                                  ]));
                        } else {
                          return Container(
                            child: Text("NO COMMENTS"),
                          );
                          // return Container(child: Text(comm[0].comments),);
                        }
                      },
                    )
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
}
