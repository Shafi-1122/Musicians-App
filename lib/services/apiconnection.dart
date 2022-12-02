
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/storymodel.dart';

class FetchDataClass {
  Future<List<Welcome>> fetchDataFromApi() async {
    
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/bdcdffd7-df4c-4645-8290-d451ea6fe98a'));
if(response.statusCode==200){
   List<dynamic> list = convert.jsonDecode(response.body);
    List<Welcome> details = list.map((e) => Welcome.fromJson(e)).toList();

    return details;
}
   else{
    throw Exception();
   }
      } 
  }
