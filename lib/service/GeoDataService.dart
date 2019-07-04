import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart';

class GetLocationPage extends StatefulWidget {
  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
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
                : Text('http://www.metaweather.com/api/location/search/?lattlong='+userLocation["latitude"].toString()+","+userLocation["longitude"].toString()),

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

  getWoeid() {
    String string =
        '[{"title":"San Francisco","location_type":"City","woeid":2487956,"latt_long":"37.777119, -122.41964"},{"title":"San Diego","location_type":"City","woeid":2487889,"latt_long":"32.715691,-117.161720"},{"title":"San Jose","location_type":"City","woeid":2488042,"latt_long":"37.338581,-121.885567"},{"title":"San Antonio","location_type":"City","woeid":2487796,"latt_long":"29.424580,-98.494614"},{"title":"Santa Cruz","location_type":"City","woeid":2488853,"latt_long":"36.974018,-122.030952"},{"title":"Santiago","location_type":"City","woeid":349859,"latt_long":"-33.463039,-70.647942"},{"title":"Santorini","location_type":"City","woeid":56558361,"latt_long":"36.406651,25.456530"},{"title":"Santander","location_type":"City","woeid":773964,"latt_long":"43.461498,-3.810010"},{"title":"Busan","location_type":"City","woeid":1132447,"latt_long":"35.170429,128.999481"},{"title":"Santa Cruz de Tenerife","location_type":"City","woeid":773692,"latt_long":"28.46163,-16.267059"},{"title":"Santa Fe","location_type":"City","woeid":2488867,"latt_long":"35.666431,-105.972572"}]';
    int ende;
    int start;
    ende = string.indexOf('latt_long');
    ende = ende - 2;
    start = string.indexOf('woeid');
    start = start + 7;
    string = string.substring(start, ende);
    return string;
  }
}
