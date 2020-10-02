import 'package:clima/ui/screens/location_screen.dart';
import 'package:clima/ui/services/location.dart';
import 'package:clima/ui/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'b062ace237380dec4fb6ddf95d68b733';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocationData() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();

    //network helper
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    Navigator.push(context,MaterialPageRoute(builder:  (_){
      print('i came here');
      return LocationScreen(locationWeatherData: weatherData);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          )
      ),
    );
  }
}
