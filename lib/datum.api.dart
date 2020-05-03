import 'dart:convert';

import 'datumcom.dart';
import 'package:http/http.dart' as http;

Future<List<Datum>> fetchData(String category) async{
  
  // var url = 'https://unnkonet.com.ng/views/news/apicomment.php?category=$category';
  var url = 'http://10.0.2.2/www/version/views/news/apicomment.php?category=$category';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return datumFromJson(response.body);
  }
  return datumFromJson('Error');
  //String response = await http.get()
  
}
Future postCom(String tag, String fname, String lname) async{
  var url = 'http://10.0.2.2:8000/person';
  final response = await http.post(url, body: jsonEncode({
    'firstname' : fname,
    'lastname' :lname,
    'firstparent_id' : 3,
    'secondparent_id' : 4,
  }), headers:  {
    'Content-Type' : 'application/json'
  });
  if(response.statusCode == 201) {print("true");}
  else {print("false");}
}