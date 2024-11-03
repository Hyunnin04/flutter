import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 245, 226, 255),
      ),
      body: Center( // Wrap the Row with Center
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the Row contents
          children: [
            WeatherWidget(
              days: DayOfWeek.monday,
              maxTemp: "32°",
              minTemp: "24°",
              forecast: Weather.sunny,
            ),
            WeatherWidget(
              days: DayOfWeek.tuesday,
              maxTemp: "30°",
              minTemp: "20°",
              forecast: Weather.sunny,
            ),
            WeatherWidget(
              days: DayOfWeek.wednesday,
              maxTemp: "27°",
              minTemp: "20°",
              forecast: Weather.cloudy,
            ),
            WeatherWidget(
              days: DayOfWeek.thursday,
              maxTemp: "26°",
              minTemp: "19°",
              forecast: Weather.cloudy,
            ),
            WeatherWidget(
              days: DayOfWeek.friday,
              maxTemp: "29°",
              minTemp: "25°",
              forecast: Weather.sunny,
            ),
            WeatherWidget(
              days: DayOfWeek.saturday,
              maxTemp: "20°",
              minTemp: "16°",
              forecast: Weather.cloudy,
            ),
            WeatherWidget(
              days: DayOfWeek.sunday,
              maxTemp: "16°",
              minTemp: "9°",
              forecast: Weather.rainy,
            ),
          ],
        ),
      ),
    ),
  ));
}

enum Weather {
  sunny("assets/Image/sunny.png"),
  rainy("assets/Image/rainy.png"),
  cloudy("assets/Image/cloudy.png");


  final String _weather;
  String get weather => _weather;
  const Weather(this._weather);
}

enum DayOfWeek {
  monday("Mon"),
  tuesday("Tue"),
  wednesday("Wed"),
  thursday("Thu"),
  friday("Fri"),
  saturday("Sat"),
  sunday("Sun");

  final String _days;
  String get day => _days;
  const DayOfWeek(this._days);

  @override
  String toString() => day;
}

// ignore: must_be_immutable
class  WeatherWidget extends StatelessWidget {
  DayOfWeek days;
  Weather forecast;
  String minTemp;
  String maxTemp;
  WeatherWidget(
      {required this.days,
      required this.forecast,
      required this.maxTemp,
      required this.minTemp,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              ),
              height: 200,
              width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  days._days,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
                child: Image(
                  image: AssetImage(forecast._weather),
                  height: 50,
                  width: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        maxTemp,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        minTemp,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
