import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromMap(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Comment {
  String id;
  String tag;
  String names;
  String comments;
  DateTime timeat;

  Comment({
    this.id,
    this.tag,
    this.names,
    this.comments,
    this.timeat,
  });

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        id: json["id"],
        tag: json["tag"],
        names: json["names"],
        comments: json["comments"],
        timeat: DateTime.parse(json["Timeat"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tag": tag,
        "names": names,
        "comments": comments,
        "Timeat": timeat.toIso8601String(),
      };
      
}
