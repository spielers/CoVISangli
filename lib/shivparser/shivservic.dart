import 'package:http/http.dart' as http;
import 'package:my_app/shivparser/shiv.dart';
import 'package:flutter/services.dart' show rootBundle;

class Shivservices {
  
   static Future<List<Thali>> getThali() async{
    final String response = await rootBundle.loadString('assets/shiv.json');
    final List<Thali> shivthali = thaliFromJson(response);
    return shivthali;
   }
}