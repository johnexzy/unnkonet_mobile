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

    Datum({
        this.id,
        this.headline,
        this.uploads,
        this.body,
        this.tag,
        this.category,
        this.dateofpost,
        this.writer,
    });

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        headline: json["headline"],
        uploads: 'https://unnkonet.com.ng/admin/homepages/' + json["uploads"],
        body: json["body"],
        tag: json["tag"],
        category: json["category"],
        dateofpost: json["Dateofpost"],
        writer: json["Writer"],
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
    };
}