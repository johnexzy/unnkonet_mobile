import 'datumcom.dart';
import 'package:http/http.dart' as http;

Future<List<Datum>> fetchData(String category) async{
  
  var url = 'https://unnkonet.com.ng/views/news/apicomment.php?category=$category';
  // var url = 'http://10.0.2.2/www/version/views/news/apicomment.php?category=$category';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return datumFromJson(response.body);
  }
  return datumFromJson('Error');
  //String response = await http.get()
  
}