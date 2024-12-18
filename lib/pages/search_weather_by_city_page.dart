import 'package:easy_weather/widgets/display_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/weather_model.dart';
import '../services/weather_services.dart';

class SearchWeatherByCityPage extends StatefulWidget {
  const SearchWeatherByCityPage({super.key});

  @override
  State<SearchWeatherByCityPage> createState() =>
      _SearchWeatherByCityPageState();
}

class _SearchWeatherByCityPageState extends State<SearchWeatherByCityPage> {
  final WeatherServices _weatherServices =
      WeatherServices(apiKey: dotenv.env["OPEN_WEATHER_API_KEY"] ?? "");

  WeatherModel? _weather;
  String? _error;

  final TextEditingController _controller = TextEditingController();

  void _searchWeather() async {
    final cityName = _controller.text.trim(); // remove spaces at begin or end

    if (cityName.isEmpty) {
      setState(() {
        _error = "Please enter a city name";
      });
      return;
    }

    try {
      final weather = await _weatherServices.getWeather(cityName);
      setState(() {
        _weather = weather;
        _error = null;
      });
    } catch (err) {
      setState(() {
        _error = "Could not find weather data for $cityName";
      });
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Weather"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "City Name",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: _searchWeather,
                    icon: const Icon(Icons.search),
                  ),
                ),
                onSubmitted: (value) => _searchWeather(),
              ),
              const SizedBox(height: 50,),
              _error !=null ? Text(_error!, style: const TextStyle(color: Colors.red),) :
                  _weather != null ? DisplayWeatherWidget(weather: _weather!) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
