import 'package:clima/models/weather_info.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationAndGo();
  }

  void getLocationAndGo() async {
    WeatherInfo weather = await LocationService.getByGPS();
    goToLocationScreen(weather);
  }

  void goToLocationScreen(WeatherInfo weather) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(weather: weather)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitWave(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
