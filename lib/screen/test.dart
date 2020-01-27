import 'dart:ui';
import 'package:UNNKONET/screen/image_banner.dart';
import 'package:UNNKONET/screen/webview.dart';
import 'package:flutter/material.dart';
import 'package:UNNKONET/style.dart';

class TestString extends StatelessWidget {
  final String str;
  //String NewString;

  TestString(this.str);

  @override
  Widget build(BuildContext context) {
    String strr = str;
    RegExp atag = new RegExp(
        r"\<[a](\s)(href=)['A-Za-z0-9'\&.-/:=_\-\/\?\%\+\@\!\#\^\*\(\)\`\~]*(\s)['a-z'=_]*\>['A-Za-z0-9'\&.-/:=_\-\/\?\%\+\@\!\#\^\*\(\)\`\~\,(\s)]*(</a>)",
        multiLine: true);
    //pattern to test for an image tag "<img src='john.png' style=''>"
    RegExp imgtag = new RegExp(
        r"\<(img)(\s)(src=)['A-Za-z0-9'\&.-/:=_\-\/\?\%\+\@\!\#\^\*\(\)\`\~]*(\s)['a-z0-9'=:;(\s)]*\>",
        multiLine: true);
    String urla; //href of the a tag
    String urlimg; //src of the img tag
    String concat; //String helper variable
    String match;
    List<Widget> matcheda = [];
    List<Widget> matchedimg = [];

    Iterable<Match> matches;
    matches = atag.allMatches(strr);
    for (Match m in matches) {
      match = m.group(0);
      concat = match.substring(match.indexOf("'") + 1);
      urla = match
          .substring(match.indexOf("'") + 1)
          .substring(0, concat.indexOf("'"));
      matcheda.add(
        GestureDetector(
          child: Text(
            "Click Here",
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontSize: 20),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyWebView(
                      selectedUrl: urla,
                    )));
          },
        ),
      );
      strr = strr.replaceFirst(match, '');
    }
    matches = imgtag.allMatches(strr);
    for (Match k in matches) {
      match = k.group(0);

      concat = match.substring(match.indexOf("'") + 1);
      urlimg = match
          .substring(match.indexOf("'") + 1)
          .substring(0, concat.indexOf("'"));
      matchedimg.add(ImageBanner(urlimg, 0, 0));
      strr = strr.replaceFirst(match, '');
    }
    //return(ino);
    return Column(
      children: <Widget>[
        Text(
          strr,
          style: Body1TextStyle,
        ),
        Column(
          children: matchedimg,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: matcheda,
          
        ),
      ],
    );
  }
  //NewString = str.toString().contains('<br>');

}
