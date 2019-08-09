import 'package:clima/models/weather_info.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({@required this.weather});

  WeatherInfo weather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.weather.temperature);
  }

  void updateLocation() async {
    WeatherInfo weather = await LocationService.getByGPS();
    setState(() {
      widget.weather = weather;
    });
  }

  void goToCityScreen() async {
    String cityName = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => CityScreen()));
    if (cityName != null) {
      WeatherInfo cityWeather = await LocationService.getByName(cityName);
      setState(() {
        widget.weather = cityWeather;
      });
    }
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
                    onPressed: () => updateLocation(),
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () => goToCityScreen(),
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${widget.weather.temperature != null ? widget.weather.temperature.toStringAsFixed(0) : ''}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${widget.weather.getWeatherIcon()}',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${widget.weather.getMessage()} in ${widget.weather.cityName}!",
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
