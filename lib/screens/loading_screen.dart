import 'package:clima_app/screens/location_sreen.dart';
import 'package:clima_app/services/api.dart';
import 'package:clima_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = "2a65c5814b36618b3a5951cef5d8072c";

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude = 0;
  double longitud = 0;

  //metodo para obtener posicion
  void getLocationData() async {
    //inicializamos la clase
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longitud = location.longitud;

    //instancia hacia metodo api
    //ApiHelper apiHelper = ApiHelper("https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitud&appid=$apiKey");
    ApiHelper apiHelper = ApiHelper("https://pokeapi.co/api/v2/pokemon/gengar");
    //Se hace el llamado a la API
    try {
      //Se manda a traer la info y se almacena
      var weatherData = await apiHelper.getData();
      //Si se comprela se manda a llamar la nueva pantalla
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(pokemonInfo: weatherData,);
      }));

    } catch (error) {
      print('Error al hacer fetch a la data: $error');
    }
  }

  //Funcion para pedir la ubicacion al iniciar la app
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitPulsingGrid(
          color: Colors.white,
          size: 150,
        ),
      ),
    );
  }
}
