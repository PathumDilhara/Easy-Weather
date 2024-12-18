import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationService {
  Future<String> getCityNameFromCurrentLocation() async {
    // Get the permission from the user to access the current location
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);

    // convert the location into list of placeMarks
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // Extract the city name from the place marks
    String cityName = placeMarks[0].locality!;
    print(cityName);

    return cityName;
  }
}
