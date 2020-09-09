import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_geolocation/geolocation.dart';

//import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async {
//    print("hey1");
//    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//    print("hey");
//    print(position);

      StreamSubscription<LocationResult> subscription =
          Geolocation.currentLocation(accuracy: LocationAccuracy.best)
              .listen((result) {
        if (result.isSuccessful) {
          double latitude = result.location.latitude;
          double longitude = result.location.longitude;
          print({latitude, longitude});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            print("kjk");
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
