import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_demo/services/weather.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String time = '';
  String weatherUrl = ' ';
  int temperature = 0;

  setupWeather() async {
    Weather weather = Weather();

    await weather.getWeather();
    setState(() {
      temperature = weather.temperature;
      time = weather.time;
      weatherUrl = weather.weatherUrl;
    });
  }

  refresh() {
    setupWeather();
    print('reset');
  }

  @override
  void initState() {
    super.initState();
    setupWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  temperature.toString() + ' °C',
                  style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                child: Image.network(
                  weatherUrl,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                  child: Text(
                'İzmir',
                style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 10.0),
              Container(
                  child: Text(
                'Time: ' + time,
                style: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
              )),
              IconButton(
                  icon: Icon(Icons.refresh),
                  color: Colors.white,
                  onPressed: () {
                    refresh();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
