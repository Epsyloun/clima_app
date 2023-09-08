import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitud = 0;

  //metodo para obtener posicion
  Future<void> getLocation() async {
    try {
      await _checkPermissions();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitud = position.longitude;
      // Si deseas mostrar la ubicación al usuario, puedes usar un SnackBar o actualizar el estado del widget.
    } catch (e) {
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      print(e);
    }
  }

  //Funcion para solicitar servicios de geolacalizacion
  Future<void> _checkPermissions() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Los servicios de ubicación están desactivados.';
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'El permiso de ubicación fue denegado.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'El permiso de ubicación fue denegado permanentemente.';
    }
  }
}