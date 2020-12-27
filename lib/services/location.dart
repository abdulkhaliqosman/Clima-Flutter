import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  List<Placemark> _placemarks;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;

      _placemarks =
          await Geolocator().placemarkFromCoordinates(latitude, longitude);
    } catch (e) {
      print(e);
    }
  }
}
