import 'package:clima/ui/services/location.dart';
import 'package:clima/ui/services/networking.dart';


const apiKey = 'lol';
const apiURL = 'https://api.openweathermap.org/data/2.5/weather';

// apiURL?q={city name}&appid=$apiKey&units=metric
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =NetworkHelper(
        '$apiURL?q=$cityName&appid=$apiKey&units=metric');
    var cityData = await networkHelper.getData();
    return cityData;

  }

  Future<dynamic> getWeatherLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();

    //network helper
    NetworkHelper networkHelper = NetworkHelper(
        '$apiURL?lat=${myLocation.latitude}&lon='
            '${myLocation.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
