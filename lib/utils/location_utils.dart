import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationUtils {
  static Future<String?> addressFromLocation(Position? position) async {
    // var lat = 31.582045;
    // var lng = 74.329376;
    // Position? latLng = Position(latitude: lat, longitude: lng);
    List placemarks = await placemarkFromCoordinates(
        position!.latitude, position.longitude,
        localeIdentifier: "en");
    print(placemarks);
    Placemark place = placemarks[0];
    String? address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    return address;
  }

  static Future<Location?> locationFromAddress([String? address]) async {
    address = " Hotel Parking, Sahab GLahore hotel Lahore Nazd Lahore, "
        "Garhi Shahu, Lahore, Punjab";
    var locations =
        await GeocodingPlatform.instance.locationFromAddress(address);
    var first = locations.first;
    print("${first.latitude} : ${first.longitude}");
    return first;
    ///////////////////////////////////////////////////
    // final query = "1600 Amphiteatre Parkway, Mountain View";
    // var addresses = await Geocoder.local.findAddressesFromQuery(query);
    // var first = addresses.first;
    // print("${first.featureName} : ${first.coordinates}");
  }

  static Future<String?> addressFromCurrentLocation() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      print(statuses[Permission.location]);
    }

    if (await Permission.location.isRestricted) {
      print('location acces is restrictd');
    }
    print('position get started');
    Position? currentLocation = await Geolocator.getCurrentPosition();
    var staticPosition = currentLocation;
    print('static position $staticPosition');
    var address = await addressFromLocation(currentLocation);
    return address;
  }
}
