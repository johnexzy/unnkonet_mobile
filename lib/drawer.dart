import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:UNNKONET/style.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Container(
                color: konetred,
                child: GestureDetector(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        focusColor: konetblue,
                        // highlightColor: konetblue,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.home,
                                color: konetblue,
                              ),
                              title: Text("HOME"),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_lauchURL(
                            "https://unnkonet.com.ng",
                          ));
                        },
                      ),
                      //Padding(
                      //padding: EdgeInsets.fromLTRB(0, 20, 0, 20),

                      Divider(
                        height: 15.0,
                      ),
                      FlatButton(
                        focusColor: konetblue,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.tv,
                                color: konetblue,
                              ),
                              title: Text("SPONSORED POSTS"),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Entertainment("advert")));
                        },
                      ),

                      Divider(
                        height: 15.0,
                      ),
                      // Hero(child: ,),
                      FlatButton(
                        focusColor: konetblue,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.shopping_cart,
                                color: konetblue,
                              ),
                              title: Text("ADVERT PACKAGES"),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_lauchURL(
                            "https://unnkonet.com.ng/pricing.php",
                          ));
                        },
                      ),
                      Divider(
                        height: 15.0,
                      ),
                      FlatButton(
                        focusColor: konetblue,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.info_outline,
                                color: konetblue,
                              ),
                              title: Text("ABOUT UNKONET"),
                            ),
                          ),
                          //color: Colors.white70,
                          //height: 80.0,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_lauchURL(
                            "https://unnkonet.com.ng/about.html",
                          ));
                        },
                      ),

                      Divider(
                        height: 15.0,
                      ),
                      FlatButton(
                        focusColor: konetblue,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListTile(
                              leading: Icon(
                                Icons.group,
                                color: konetblue,
                              ),
                              title: Text("UNNKONET TEAM"),
                            ),
                          ),
                          //color: Colors.white70,
                          //height: 80.0,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(_lauchURL(
                            "https://unnkonet.com.ng/team.php",
                          ));
                        },
                      ),

                      SizedBox(
                        height: 40.0,
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
                              Navigator.of(context).push(_lauchURL(
                                "https://unnkonet.com.ng/contact.html",
                              ));
                            },
                          )),
                    ],
                  ),
                ))
          ],
        ));
  }

  _lauchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Open $url';
    }
  }
}
