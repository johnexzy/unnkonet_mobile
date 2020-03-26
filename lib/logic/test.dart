import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:UNNKONET/screen/image_banner.dart';

import 'package:UNNKONET/style.dart';

class TestString extends StatefulWidget {
  final String str;
  TestString(this.str);
  // TestString({Key key}) : super(key: key);

  @override
  _TestStringState createState() => _TestStringState(str);
}

class _TestStringState extends State<TestString> {
  final String str;
  _TestStringState(this.str);
  VideoPlayerController _playerController;
  @override
  void initState() {
    super.initState();
  }

  // Widget build(BuildContext context) {
  //str.length();
  _tester(String type) {
    String strr = str;
    print(strr);
    RegExp atag = new RegExp(
        r"\<[a](\s)(href=)['A-Za-z0-9'\&.-/:=_\-\/\?\%\+\@\!\#\^\*\(\)\`\~]*(\s)['a-z'=_]*\>['A-Za-z0-9'\&.-/:=_\-\/\?\%\+\@\!\#\^\*\(\)\`\~\,(\s)]*(</a>)",
        multiLine: true);
    //pattern to test for an image tag "<img src='john.png' style=''>"
    RegExp imgtag = new RegExp(
        r"\<(img)(\s)(src=)['A-Za-z0-9'\&.-/:=_\-\/\?\%\+\@\!\#\^\*\(\)\`\~]*(\s)['a-z0-9'=:;(\s)]*\>",
        multiLine: true);
    RegExp vidTag = new RegExp(
        r"\<(center><video)(\s)(src=)['A-Za-z0-9'\&.-/:=_\-\/\?\%\+\@\!\#\^\*\(\)\`\~]*(\s)['a-z0-9'=:;\#(\s)]*(></video></center>)",
        multiLine: true);
    String urla; //href of the a tag
    String urlv; // src of video
    String urlimg; //src of the img tag
    String concat; //String helper variable
    String match;
    List matcheda = [];
    List matchedimg = [];
    List matchedvid = [];

    Iterable<Match> matches;

    matches = atag.allMatches(strr);
    if (matches.isNotEmpty) {
      for (Match m in matches) {
        match = m.group(0);
        concat = match.substring(match.indexOf("'") + 1);
        urla = match
            .substring(match.indexOf("'") + 1)
            .substring(0, concat.indexOf("'"));
        matcheda.add(urla);

        strr = strr.replaceFirst(match, '');
      }
    }
    print(matcheda);

    // "<img src='john.png' style=''>"
    matches = imgtag.allMatches(strr);
    if (matches.isNotEmpty) {
      for (Match k in matches) {
        match = k.group(0);
        //match = <img src='john.png' style=''>
        concat = match.substring(match.indexOf("'") + 1);
        //concat = jojohn.png' style=''>
        urlimg = match
            .substring(match.indexOf("'") + 1)
            .substring(0, concat.indexOf("'"));
        //urlimg = jojohn.png
        matchedimg.add(urlimg);
        strr = strr.replaceFirst(match, '');
      }
    }

    matches = vidTag.allMatches(strr);
    if (matches.isNotEmpty) {
      for (Match p in matches) {
        match = p.group(0);
        //match = <center><video src='https://unnkonet.com.ng/path-to-video/video.mp4' style='style:ss' controls></video></center>
        concat = match.substring(match.indexOf("'") + 1);
        //concat = https://unnkonet.com.ng/path-to-video/video.mp4' style='style:ss' controls></video></center>
        urlv = match
            .substring(match.indexOf("'") + 1)
            .substring(0, concat.indexOf("'"));

        // initState() {
        //   super.initState();
        //   _controller = VideoPlayerController.network(urlv)..initialize().then((_){
        //     setState((){});
        //   });
        // }

        //urlimg = https://unnkonet.com.ng/path-to-video/video.mp4
        matchedvid.add(urlv);
        strr = strr.replaceFirst(match, '');
      }
    }

    switch (type) {
      case 'vid':
        return matchedvid;
        break;
      case 'link':
        return matcheda;
        break;
      case 'img':
        return matchedimg;
        break;
      case 'text':
        return strr;
        break;
      default:
        return strr;
        break;
    }
  }

  //return(ino);
  // return Column(
  //   children: <Widget>[
  //     Text(
  //       strr,
  //       style: Body1TextStyle,
  //     ),
  //     Column(
  //       children: matchedimg,
  //     ),
  //     Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       //textDirection: TextDirection.rtl,
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: matcheda,
  //     ),
  //   ],
  // );
  // }
  @override
  Widget build(BuildContext context) {
    List<Widget> vid;
    List<Widget> link;
    List<Widget> img;
    if (_tester('vid').isNotEmpty) {
      for (var k in _tester('vid')) {
        link.add(
          GestureDetector(
            child: Text(
              "Click Here",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                  fontSize: 20),
            ),
            onTap: () {
              _lauchURL(k);
            },
          ),
        );
      }
    }
    if (_tester('img').isNotEmpty) {
      for (var k in _tester('img')) {
        img.add(ImageBanner(k, 0, 0));
      }
    }
    if (_tester('vid').isNotEmpty) {
      for (var k in _tester('vid')) {
        vid.add(VideoPlayer(VideoPlayerController.network(k)));
      }
    }

    return Column(
      children: <Widget>[
        Text(
          _tester('text'),
          style: Body1TextStyle,
        ),
        Column(children: img),
        Column(children: vid),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: link),
      ],
    );
  }

  //NewString = str.toString().contains('<br>');
  _lauchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Open $url';
    }
  }
}
