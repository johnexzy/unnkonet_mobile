import 'dart:convert';

import 'package:UNNKONET/comment.model.dart';

import 'datumcom.dart';
import 'package:http/http.dart' as http;

Future<List<Datum>> fetchData(String category) async {
  // var url = 'https://unnkonet.com.ng/views/news/apicomment.php?category=$category';
  var url =
      'http://10.0.2.2:8010/news/$category';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return datumFromJson(response.body);
  }
  return datumFromJson('Error');
  //String response = await http.get()
}
Future<List<Comment>> getCom(String tag) async{
  var url = 'http://10.0.2.2:8010/comments/$tag';
  final res = await http.get(url);
  if (res.statusCode == 200) {
    return commentFromJson(res.body);
  }
  else{
    throw Exception("Failed to get Comments");
  }
}
Future<List<Comment>> postCom(String tag, String names, String comments) async {
  var url = 'http://10.0.2.2:8010/comments';
  final response = await http.post(url,
      body: jsonEncode({
        'tag': tag,
        'names': names,
        'comments': comments,
      }),
      headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 201) {
    return commentFromJson(response.body);
  } else {
    print("false");
  }
}
