import 'dart:async';
import 'package:geolocator/geolocator.dart';


class MyLocation {

  double latitude;
  double longitude;

  Future getCurrentLocation() async {
    try {
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude= position.latitude;
      longitude=position.longitude;
      print('location: ${[longitude, latitude]}');

    } catch (e) {
      print(e);
    }
  }
}