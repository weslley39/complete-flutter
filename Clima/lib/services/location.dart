import 'dart:convert';

import 'package:clima/models/weather_info.dart';
import 'package:http/http.dart' as http;

const STATUS_OK = 200;
const WETHERAPI_KEY = 'ea22e0a76ba3f681683a4a8f239733a3';

class LocationService {
  static Future<WeatherInfo> getSomething(double lat, double lon) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&units=metric&appid=${WETHERAPI_KEY}';
    http.Response data = await http.get(url);

    if (data.statusCode == STATUS_OK) {
      var jsonData = jsonDecode(data.body);

      WeatherInfo weather = WeatherInfo(
        cityName: jsonData['name'],
        condition: jsonData['weather'][0]['id'],
        temperature: jsonData['main']['temp'],
      );

      return weather;
    }
  }
}
