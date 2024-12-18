import 'dart:convert';

import 'package:easy_weather/models/weather_model.dart';
import 'package:easy_weather/services/get_location_service.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  // https://api.openweathermap.org/data/2.5/weather?lat=57&lon=-2.15&appid=b3383cbd5e5b62d5b2e3f48efefb3c29&units=metric

  // https://api.openweathermap.org/data/2.5/weather?q=London&appid=b3383cbd5e5b62d5b2e3f48efefb3c29&units=metric

  static const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherServices({
    required this.apiKey,
  });

  // Get the weather from the city name
  Future<WeatherModel> getWeather(String cityName) async {
    try{
      final url = "$BASE_URL?q=$cityName&appid=$apiKey&units=metric";

      final response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
        return WeatherModel.fromJson(json);
      } else {
        throw Exception("Failed to load the whether data");
      }
    } catch(err) {
      throw Exception("Failed to load the whether data");
    }
  }

  // Get the weather data from the current location
  Future<WeatherModel> getWeatherFromLocation () async {
    try {
      final location = GetLocationService();
      final cityName = await location.getCityNameFromCurrentLocation();
      
      final url = "$BASE_URL?q=$cityName&appid=$apiKey&units=metric";
      
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return WeatherModel.fromJson(json);
      } else {
        throw Exception("Failed to load the weather data");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Failed to load the weather data");
    }
  }
}
