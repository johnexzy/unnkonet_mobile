import 'dart:convert';

List<Datum> datumFromJson(String str) => List<Datum>.from(json.decode(str).map((x) => Datum.fromMap(x)));

String datumToJson(List<Datum> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Datum {
    String id;
    String headline;
    String uploads;
    String body;
    String tag;
    String category;
    String dateofpost;
    String writer;
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
        this.comments,
    });

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        headline: json["headline"],
        uploads: 'https://unnkonet.com.ng/admin/homepages/' + json["uploads"],
        //  uploads: 'http://10.0.2.2/www/version/admin/homepages/' + json["uploads"],
        body: json["body"],
        tag: json["tag"],
        category: json["category"],
        dateofpost: json["Dateofpost"],
        writer: json["Writer"],
        timestamps: DateTime.parse(json["timestamps"]),
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromMap(x))),
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
        "timestamps": timestamps.toIso8601String(),
        "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
    };
}

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