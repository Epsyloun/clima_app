import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  ApiHelper(this.url);

  final String url;

  Future getData() async{
    print(url);
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      String data = response.body;

      return jsonDecode(data);

      //double temperature = decodedData['main']['temp'];
      //int conditionNumber = decodedData['weather'][0]['id'];
      //String cityName = decodedData['name'];

    }else{
      print(response.statusCode);
      throw Exception('Error al conectar con la API');
    }
  }

}