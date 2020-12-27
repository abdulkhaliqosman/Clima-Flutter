import 'location.dart';
import 'networking.dart';

class WeatherModel {
  final String apiKey = '<YOUR API KEY HERE>';
  final String url = 'https://api.openweathermap.org/data/2.5/weather';
  final String units = 'metric';

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

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper helper = NetworkHelper(
        '$url?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=$units');
    return helper.getData();
  }

  Future<dynamic> getLocationDataWithName(String cityName) async {
    NetworkHelper helper =
        NetworkHelper('$url?q=$cityName&appid=$apiKey&units=$units');
    return helper.getData();
  }
}
