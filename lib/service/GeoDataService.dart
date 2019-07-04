import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class GetLocationPage extends StatefulWidget {
  @override
  _GetLocationPageState createState() =>
      _GetLocationPageState(httpClient: http.Client());
}

class _GetLocationPageState extends State<GetLocationPage> {
  //http
  final http.Client httpClient;

  //date
  var now = new DateTime.now();
  String date = '';

  //helping
  int useless = 0;

  _GetLocationPageState({@required this.httpClient})
      : assert(httpClient != null);
  var location = new Location();

  Map<String, double> userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userLocation == null
                ? _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  })
                : Text(cutYear() + "/" + cutMonth() + "/" + cutDay()),useless == 0?getWeather().then((value) {setState(() {useless = 1;});}): Container(child: Row(children: <Widget>[],)),
            //todo Substring woeid
            // 'https://www.metaweather.com/api/location/search/?lattlong='+userLocation["latitude"].toString()+","+userLocation["longitude"].toString()
            // https://www.metaweather.com/api/location/search/?lattlong=47.377060,8.539550

            //todo Wetter
            // https://www.metaweather.com/api/#location
            // 'https://www.metaweather.com/api/location/'+getWoeid()+'/'
          ],
        ),
      ),
    );
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  getWoeid() async {
    final locationUrl =
        'http://www.metaweather.com/api/location/search/?lattlong=' +
            userLocation["latitude"].toString() +
            "," +
            userLocation["longitude"].toString();
    final locationResponse = await this.httpClient.get(locationUrl);
    print(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }
    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  //weather_state_abbr
  //min_temp
  //the_temp
  getWeather() async {
    String string = '';
    final weatherUrl = 'http://www.metaweather.com/api/location/' +
        getWoeid().toString() +
        '/' +
        cutYear().toString() +
        '/' +
        cutMonth().toString() +
        '/' +
        cutDay().toString() +
        '/';
    final weatherResponse = await this.httpClient.get(weatherUrl);
    print(weatherUrl);
    useless = 1;
    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }
    final weatherJson = jsonDecode(weatherResponse.body) as List;
    string = (weatherJson.first)['weather_state_abbr'];
    string = string + " " + (weatherJson.first)['min_temp'];
    string = string + " " + (weatherJson.first)['the_temp'];
  }

  //fullDate with -
  cutDate() {
    now = new DateTime.now();
    now.toString();
    int start = 0;
    int ende = 10;
    return date = now.toString().substring(start, ende);
  }

  //year
  cutYear() {
    String year = cutDate();
    int start = 0;
    int ende = 4;
    return date = now.toString().substring(start, ende);
  }

  //month
  cutMonth() {
    String month = cutDate();
    int start = 5;
    int ende = 7;
    return date = now.toString().substring(start, ende);
  }

  //day
  cutDay() {
    String day = cutDate();
    int start = 8;
    int ende = 10;
    return date = now.toString().substring(start, ende);
  }

//  getWoeid2() {
//    getWoeid().then((res) {
//      String string = res;
//      int ende;
//      int start;
//      ende = string.indexOf('latt_long');
//      ende = ende - 2;
//      start = string.indexOf('woeid');
//      start = start + 7;
//      string = string.substring(start, ende);
//      return string;
//    });
//  }
}
