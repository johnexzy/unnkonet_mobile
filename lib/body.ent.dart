
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'screen/image_banner.dart';
import 'style.dart';
import 'datum.ent.api.dart';
import 'datum.ent.dart';
import 'details.ent.dart';

class Entertainment extends StatefulWidget {
  final String tablename;

  //const BodyTech(String s, {Key key, this.tablename}) : super(key: key);
  Entertainment(this.tablename);
  @override
  _Entertainment createState() => _Entertainment(tablename);
}

class _Entertainment extends State<Entertainment> with AutomaticKeepAliveClientMixin<Entertainment> {
  bool get wantKeepAlive => true;
  final String tablename;

  _Entertainment(this.tablename);
    Future<List<Datum>> _future;
  @override
  void initState() { 
    super.initState();
    _future = fetchData(tablename);
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body:Container(
      child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Datum datum = snapshot.data[index];
                // return Text('${datum.headline}');
                //bool isliked = true;
                // bool isLiked = false;
                return GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ImageBanner(
                                datum.image,
                            12,
                            0),
                        Container(
                          child: Text(
                              "Date Posted: " +
                                  datum.dateofpost.substring(6, 8) +
                                  "|" +
                                  datum.dateofpost.substring(4, 6) +
                                  "|" +
                                  datum.dateofpost.substring(0, 4),
                              style: CaptionTextStyle),
                          padding: EdgeInsets.fromLTRB(5, 1, 0, 5),
                        ),
                        //Icon(Icons.favorite_border),
                        // IconButton(
                        //   onPressed: () => setState(() {
                        //     isLiked ? isLiked = false : isLiked = true;
                        //   }),
                        //   icon: Icon(
                        //       isLiked ? Icons.favorite : Icons.favorite_border),
                        // ),
                        
                        Container(
                          child: Text("By: " + datum.writer),
                          padding: EdgeInsets.fromLTRB(5, 1, 0, 5),
                        ),
                        Container(
                          child: Text(
                            datum.header,
                            style: TitleTextStyle,
                          ),
                          padding: EdgeInsets.fromLTRB(10, 1, 0, 12),
                          color: Colors.transparent,
                        ),
                        Divider(
                            thickness: 5.0,
                            color: Color.fromRGBO(224, 193, 4, 1))
                      ],
                    ),
                  ),
                  onTap: () => _viewnews(context, snapshot.data, index, tablename),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(
            ),
          );
        },
      ),
    ));
  }
}

_viewnews(BuildContext context, List list, int newsIndex, String tablename) {
  //Navigator.pushNamed(context, routeName)
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => Details(list, newsIndex, tablename)));
}
