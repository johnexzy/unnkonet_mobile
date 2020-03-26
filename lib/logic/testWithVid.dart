import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
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
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://unnkonet.com.ng/admin/uploads/2348165013911_status_6d808f824f3a48e583023b2ee7e207c5.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

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
    RegExp vidTag = new RegExp(
        r"\<(center><video)(\s)(src=)['A-Za-z0-9'\&.-/:=_\-\/\?\%\+\@\!\#\^\*\(\)\`\~]*(\s)['a-z0-9'=:;\#(\s)]*(></video></center>)",
        multiLine: true);
    String urla; //href of the a tag
    String urlv; // src of video
    String urlimg; //src of the img tag
    String concat; //String helper variable
    String match;
    List<Widget> matcheda = [];
    List<Widget> matchedimg = [];
    List<Widget> matchedvid = [];

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
            _lauchURL(urla);
          },
        ),
      );
      strr = strr.replaceFirst(match, '');
    }
    // "<img src='john.png' style=''>"
    matches = imgtag.allMatches(strr);
    for (Match k in matches) {
      match = k.group(0);
      //match = <img src='john.png' style=''>
      concat = match.substring(match.indexOf("'") + 1);
      //concat = jojohn.png' style=''>
      urlimg = match
          .substring(match.indexOf("'") + 1)
          .substring(0, concat.indexOf("'"));
      //urlimg = jojohn.png
      matchedimg.add(ImageBanner(urlimg, 0, 0));
      strr = strr.replaceFirst(match, '');
    }
    matches = vidTag.allMatches(strr);
    for (Match p in matches) {
      match = p.group(0);
      //match = <center><video src='https://unnkonet.com.ng/path-to-video/video.mp4' style='style:ss' controls></video></center>
      concat = match.substring(match.indexOf("'") + 1);
      //concat = https://unnkonet.com.ng/path-to-video/video.mp4' style='style:ss' controls></video></center>
      urlv = match
          .substring(match.indexOf("'") + 1)
          .substring(0, concat.indexOf("'"));
      print(urlv);
      //urlimg = https://unnkonet.com.ng/path-to-video/video.mp4
      // matchedvid.add(VideoPlayer(_controller));
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
        Column(
          children: <Widget>[
            Center(
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
          ],
        )
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
