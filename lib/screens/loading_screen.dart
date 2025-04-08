
import 'package:clima_weather_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima_weather_app/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'location_screen.dart';

const apiKey ='fe5ddf76bb7e46110d190a774dea35eb';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

double latitude = 0;
double longitude = 0;

  void initState() {
    super.initState();
    getLocationData();

  }

  void getLocationData()async{
    Location location = Location();
    await location.getCurrentLocation();

    latitude= location.latitude;
    longitude= location.longitude;
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
     var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )

      ),
    );
  }
}