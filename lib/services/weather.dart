import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey='6ca47ce0b40f4d781109b43408303ced';
const openweatherURL='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName)async{
    NetworkHelper networkHelper=NetworkHelper('$openweatherURL?q=$cityName&appid=$apikey&units=metric');
    var weatherdata= await networkHelper.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather()async{
    Location location= Location();
    await location.getcurrentlocation();

    NetworkHelper networkHelper= NetworkHelper('$openweatherURL?lat=${location.latitude}&lon=${location.longitude
    }&appid=$apikey&units=metric');

    var weatherdata= await networkHelper.getData();
    return weatherdata;
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
