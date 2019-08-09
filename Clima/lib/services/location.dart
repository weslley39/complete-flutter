import 'dart:convert';

import 'package:clima/models/weather_info.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

const STATUS_OK = 200;
const WETHERAPI_KEY = 'ea22e0a76ba3f681683a4a8f239733a3';
const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
const ERROR_WEATHER = WeatherInfo(
  cityName: 'Unable to get weather data',
  condition: null,
  temperature: null,
);

class LocationService {
  static Future<WeatherInfo> getByGPS() async {
    try {
      Position position =
          await Geolocator().getCurrentPosition(LocationAccuracy.low);
      String url =
          '$BASE_URL?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=$WETHERAPI_KEY';
      WeatherInfo weather = await _get(url);
      return weather;
    } catch (e) {
      return ERROR_WEATHER;
    }
  }

  static Future<WeatherInfo> getByName(String cityName) async {
    String url = '$BASE_URL?q=$cityName&units=metric&appid=$WETHERAPI_KEY';
    WeatherInfo weather = await _get(url);
    return weather;
  }

  static Future<WeatherInfo> _get(String url) async {
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
    return ERROR_WEATHER;
  }
}
