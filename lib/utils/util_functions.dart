class UtilsFunctions {
  String getWeatherAnimations({required String condition}) {
    switch (condition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "assets/cloudy.json"; // if one of above match

      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/rainy.json";

      case "thunderstorm":
        return "assets/thunder.json";

      case "clear":
        return "assets/sunney.json";

      default:
        return "assets/sunney.json";
    }
  }
}
