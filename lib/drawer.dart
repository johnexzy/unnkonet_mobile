import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:UNNKONET/screen/webview.dart';
import 'package:UNNKONET/style.dart';

import 'body.ent.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Image.asset(
              'assets/images/logo2.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            ),
            Divider(
              color: black(),
            ),
            Center(
                child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //Padding(
                  //padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ListTile(
                          leading: Icon(Icons.home),
                          title: Text("HOME"),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MyWebView(
                                  selectedUrl: "https://unnkonet.com.ng",
                                )));
                      },
                    ),
                  ),
                  
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ListTile(
                          leading: Icon(Icons.tv),
                          title: Text("SPONSORED POSTS"),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Entertainment("advert")));
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ListTile(
                          leading: Icon(Icons.tv),
                          title: Text("MY QUIZ"),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MyWebView(
                                  selectedUrl: "https://unnkonet.com.ng/myquiz",
                                )));
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ListTile(
                          leading: Icon(Icons.shopping_cart),
                          title: Text("ADVERT PACKAGES"),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MyWebView(
                                  selectedUrl:
                                      "https://unnkonet.com.ng/pricing.php",
                                )));
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: ListTile(
                            leading: Icon(Icons.info_outline),
                            title: Text("ABOUT UNKONET"),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => MyWebView(
                                    selectedUrl:
                                        "https://unnkonet.com.ng/about.html",
                                  )));
                        }),
                    color: Colors.white70,
                    //height: 80.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ListTile(
                          leading: Icon(Icons.group),
                          title: Text("UNNKONET TEAM"),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MyWebView(
                                  selectedUrl:
                                      "https://unnkonet.com.ng/team.php",
                                )));
                      },
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      child: RaisedButton(
                        child: Text(
                          "CONTACT UNNKONET",
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
                                    selectedUrl:
                                        "https://unnkonet.com.ng/contact.html",
                                  )));
                        },
                      )),
                ],
              ),
            ))
          ],
        ));
  }
}
