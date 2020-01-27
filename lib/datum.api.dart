import 'datum.dart';
import 'package:http/http.dart' as http;

Future<List<Datum>> fetchData(String category) async{
  
  var url = 'https://unnkonet.com.ng/views/news/api.php?category=$category';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return datumFromJson(response.body);
  }
  return datumFromJson('Error');
  //String response = await http.get()
  
}