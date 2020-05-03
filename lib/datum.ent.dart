import 'dart:convert';

List<Datum> datumFromJson(String str) => List<Datum>.from(json.decode(str).map((x) => Datum.fromMap(x)));

String datumToJson(List<Datum> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Datum {
    String id;
    String header;
    String image;
    String body;
    String tag;
    String current;
    String dateofpost;
    String writer;

    Datum({
        this.id,
        this.header,
        this.image,
        this.body,
        this.tag,
        this.dateofpost,
        this.writer,
        this.current
    });

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        header: json["header"],
        image: 'http://10.0.2.2/www/version/admin/homepages/' + json["image"],
        body: json["body"],
        tag: json["tag"],
        current: json["current"],
        dateofpost: json["Dateofpost"],
        writer: json["Writer"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "header": header,
        "image": image,
        "body": body,
        "tag": tag,
        "Timestamp": current,
        "Dateofpost": dateofpost,
        "Writer": writer,
    };
}