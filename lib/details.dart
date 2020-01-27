// import 'package:UNNKONET/screen/test.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:UNNKONET/screen/webview.dart';
import 'package:UNNKONET/style.dart';
import 'datum.dart';
import 'package:flutter/cupertino.dart';
import 'screen/image_banner.dart';
import 'screen/testmain.dart';

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

    return CupertinoApp(
      
      debugShowCheckedModeBanner: false,
      title: data.headline,
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: true,
            automaticallyImplyLeading: true,
            previousPageTitle: 'back',
            middle: Text(data.headline),
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
                    TextSection(Colors.transparent, data.headline, data.body),
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
                                  _lauchURL("https://unnkonet.com.ng/views/news/view.php?id=" +
                                      data.id);
                  },
                )),
          )),
    );
  }
  _lauchURL(String url) async{
    if (await canLaunch(url)) {
      await launch(url);
    }else{
      throw 'Could not Open $url';
    }
  }
}
