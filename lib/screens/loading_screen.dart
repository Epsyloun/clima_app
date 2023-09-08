import 'package:clima_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  //metodo para obtener posicion
  void getLocation() async {
    //inicializamos la clase
    Location location = Location();
    await location.getLocation();
    print(location.latitude);
    print(location.longitud);
  }

  void getData() async {
    var url = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=$part&appid=$apiKey";

    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int conditionNumber = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

    }else{
      print(response.statusCode);
    }
  }

  //Funcion para pedir la ubicacion al iniciar la app
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }
}
