import 'package:flutter/material.dart';
import 'package:clima_weather_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData()async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        ElevatedButton(
          onPressed: () {
            print("Button Pressed!");
            // getLocation();
            // Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}