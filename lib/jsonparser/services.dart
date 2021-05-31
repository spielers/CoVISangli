import 'package:http/http.dart' as http;
import 'package:covisangli/jsonparser/hospitals.dart';

class Services {
  static var url = Uri.parse('https://sangli.me/api/v1');

  static Future<List<Hospitals>> getHospitals() async {
    //final String response = await rootBundle.loadString('assets/data.json');
    final response = await http.get(url);
    final List<Hospitals> hospitalo = hospitalsFromJson(response.body);
    // try{
    //   //  final response = await http.get(url);
    //   if(response.statusCode == 200 ){
    //     final List<Hospitals> hospitalo = hospitalsFromJson(response.body);
    //     return hospitalo;
    //   }else{
    //     print('Request failed with status: ${response.statusCode}.');
    //     return List<Hospitals>();
    //   }
    // }catch(e){
    //   print('Request failed with status: ${response.statusCode}.');
    //    return List<Hospitals>();
    // }
    //  final List<Hospitals> hospitalo = hospitalsFromJson(response);
    return hospitalo;
  }
  // static List<Hospitals> getHospitalsDe() {
  //    final List<Hospitals> hospital = hospitalsFromJson('assets/data.json');
  //    return hospital;
  // }

}
