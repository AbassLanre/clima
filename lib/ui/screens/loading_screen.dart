import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
 void getLocation() async {
//    print("hey1");
//    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//    print("hey");
//    print(position);

      StreamSubscription<LocationResult> subscription = await
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
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
