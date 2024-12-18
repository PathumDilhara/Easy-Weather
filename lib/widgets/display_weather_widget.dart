import 'package:easy_weather/models/weather_model.dart';
import 'package:easy_weather/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DisplayWeatherWidget extends StatelessWidget {
  final WeatherModel weather;
  const DisplayWeatherWidget({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: LottieBuilder.asset(
                UtilsFunctions()
                    .getWeatherAnimations(condition: weather.condition),
                width: 400,
                height: 400,
              ),
            ),
            Text(
              weather.cityName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${weather.temperature.toStringAsFixed(1)} °C",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  weather.condition,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  weather.description,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildWeatherDetails("Pressure", "${weather.pressure} hPa"),
                _buildWeatherDetails("Pressure", "${weather.humidity} %"),
                _buildWeatherDetails("Pressure", "${weather.windSpeed} m/s"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetails(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
