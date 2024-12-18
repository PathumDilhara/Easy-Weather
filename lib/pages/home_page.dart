import 'package:easy_weather/models/weather_model.dart';
import 'package:easy_weather/services/weather_services.dart';
import 'package:easy_weather/widgets/display_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'search_weather_by_city_page.dart';

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
  void fetchWeather() async {
    try {
      final weather = await _weatherServices.getWeatherFromLocation();
      setState(() {
        _weather = weather;
      });
    } catch (err) {
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
          title: const Text(
            "Easy Weather",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.light_mode))
          ],
        ),
        body: _weather != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisplayWeatherWidget(weather: _weather!),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchWeatherByCityPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(107, 255, 208, 128),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Search Weather",
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
