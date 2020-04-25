import 'package:UNNKONET/logic/dateString.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'screen/image_banner.dart';
import 'style.dart';
import 'datum.api.dart';
import 'datumcom.dart';
import 'details.dart';

class Body extends StatefulWidget {
  final String category;

  //const BodyTech(String s, {Key key, this.cat}) : super(key: key);
  Body(this.category);
  @override
  _Body createState() => _Body(category);
}

class _Body extends State<Body> with AutomaticKeepAliveClientMixin<Body> {
  final String cat;

  _Body(this.cat);
  Future<List<Datum>> _future;
  @override
  void initState() {
    super.initState();
    _future = fetchData(cat);
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Datum datum = snapshot.data[index];
                // return Text('${datum.headline}');
                //bool isliked = true;
                // bool isLiked = false;
                //print(datum.numComments);
                CheckDate datestr = new CheckDate(datum.timestamps);
                return GestureDetector(
                  child: Card(
                    elevation: 4.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                      bottom: Radius.circular(0),
                    )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ImageBanner(datum.uploads, 12, 0),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.create,
                                        size: CTS + 4.0,
                                      ),
                                      Text(
                                        ": " + datum.writer,
                                        style: CaptionTextStyle,
                                      ),
                                    ],
                                  ),
                                  
                                ],
                              ),
                              Row(children: <Widget>[
                                Icon(Icons.access_time, size: CTS + 4.0),
                                Text(
                                  datestr.computeDateString(),
                                  style: CaptionTextStyle,
                                ),
                              ]),
                              
                            ],
                          ),
                          
                        ),
                        Container(
                          child: Text(
                            datum.headline,
                            style: TitleTextStyle,
                          ),
                          padding: EdgeInsets.fromLTRB(10, 1, 0, 12),
                          color: Colors.transparent,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          child:Row(children: <Widget>[
                                    Icon(
                                      Icons.comment,
                                      size: CTS + 4.0,
                                    ),
                                    Text(
                                        "(" + datum.numComments.toString() + ")",
                                        style: CaptionTextStyle,
                                      ),
                                  ]),
                        ),
                        Divider(
                          thickness: 5.0,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  onTap: () => _viewnews(context, snapshot.data, index),
                );
              },
            );
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Connecting..."),
              Divider(),
              CircularProgressIndicator()
            ],
          ));
        },
      ),
    );
  }
}

_viewnews(BuildContext context, List list, int newsIndex) {
  //Navigator.pushNamed(context, routeName)
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => Details(list, newsIndex)));
}
