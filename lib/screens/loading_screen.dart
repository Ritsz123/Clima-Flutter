import 'package:clima/services/weather.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //get locationdata
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    if (weatherData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            locationWeather: weatherData,
          ),
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Location disabled'),
              content: Container(
                child: Text(
                    'Location switch is turned of please turn it on to use the app'),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    //close dialog
                    Navigator.pop(context);
                    getLocationData();
                  },
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    //close application
                    SystemNavigator.pop();
                  },
                ),
              ],
            );
          });
    }
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
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
