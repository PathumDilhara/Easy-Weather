import 'package:easy_weather/models/weather_model.dart';
import 'package:easy_weather/services/weather_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherServices _weatherServices =
      WeatherServices(apiKey: dotenv.env["OPEN_WEATHER_API_KEY"] ?? "");

  WeatherModel? _weather;

  // Method to fetch the weather
  void fetchWeather () async {
    try {
      final weather = await _weatherServices.getWeatherFromLocation();
      setState(() {
        _weather = weather;
      });
    } catch(err){
      print("Error from weather data : $err");
    }
  }

  @override
  void initState() {
    super.initState();

    fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Easy Weather"),
      ),
    );
  }
}
