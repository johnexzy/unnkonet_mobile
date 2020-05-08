import 'dart:convert';

import 'comment.model.dart';

List<Datum> datumFromJson(String str) =>
    List<Datum>.from(json.decode(str).map((x) => Datum.fromMap(x)));

String datumToJson(List<Datum> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Datum {
  String id;
  String headline;
  String uploads;
  String body;
  String tag;
  String category;
  String dateofpost;
  String writer;
  int numComments;
  DateTime timestamps;
  List<Comment> comments;

  Datum({
    this.id,
    this.headline,
    this.uploads,
    this.body,
    this.tag,
    this.category,
    this.dateofpost,
    this.writer,
    this.timestamps,
    this.numComments,
    this.comments,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        headline: json["headline"],
        // uploads: 'https://unnkonet.com.ng/admin/homepages/' + json["uploads"],
        uploads: 'http://10.0.2.2/www/version/admin/homepages/' + json["uploads"],
        body: json["body"],
        tag: json["tag"],
        category: json["category"],
        dateofpost: json["Dateofpost"],
        writer: json["Writer"],
        numComments: List<Comment>.from(json["comments"].map((x) => Comment.fromMap(x))).length,
        timestamps: DateTime.parse(json["timestamps"]),
        comments:
            List<Comment>.from(json["comments"].map((x) => Comment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "headline": headline,
        "uploads": uploads,
        "body": body,
        "tag": tag,
        "category": category,
        "Dateofpost": dateofpost,
        "Writer": writer,
        "NumComments": numComments,
        "timestamps": timestamps.toIso8601String(),
        "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
      };
}
