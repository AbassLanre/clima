import 'package:clima/ui/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:clima/ui/utilities/constants.dart';
import 'package:clima/ui/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeatherData});

  final locationWeatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature;
  String weatherConditionIcon;
  String weatherComment;
  String cityName;

  updateUI(dynamic locationWeatherData) {
    setState(() {
      if (locationWeatherData==null){
        temperature=0;
        weatherConditionIcon= '';
        cityName="Current City";
        weatherComment="Error determining location Services";
        return;
      }
      var temp = locationWeatherData['main']['temp'];
      temperature =temp.toInt();
      var condition = locationWeatherData['weather'][0]['id'];
      weatherConditionIcon = weatherModel.getWeatherIcon(condition);
      cityName = locationWeatherData['name'];
      weatherComment = weatherModel.getMessage(temperature);

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('setState1');

    updateUI(widget.locationWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var weatherData = await weatherModel.getWeatherLocation();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 30.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedCityName = await Navigator.push(context, MaterialPageRoute(builder: (_){
                        return CityScreen();
                      },),);
                      if(typedCityName!= null ){
                        var weatherData= await weatherModel.getCityWeather(typedCityName);
                        updateUI(weatherData);
                        print('ikeja');
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherConditionIcon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherComment in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
