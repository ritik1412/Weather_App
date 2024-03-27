import 'package:location/location.dart';
import 'package:logger/logger.dart';

class FetchLocationRepository {
  final Logger _logger = Logger();
  Location location = Location();

  Future<LocationData?> getCurrentLocation() async {
    try {
      final PermissionStatus permission = await _checkLocationPermission();
      if (permission == PermissionStatus.denied ||
          permission == PermissionStatus.deniedForever) {
        throw LocationPermissionDeniedException();
      }

      if (!await _checkLocationServicesEnabled()) {
        throw LocationServicesDisabledException();
      }

      final LocationData position = await location.getLocation();
      return position;
    } catch (e) {
      _logger.e('Error determining position ${e.toString()}');
      return null;
    }
  }

  Future<bool> _checkLocationServicesEnabled() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService().then((bool value) {
        if (!value) {
          _logger.w('Location services disabled');
        }
        return value;
      });
    }
    return serviceEnabled;
  }

  Future<PermissionStatus> _checkLocationPermission() async {
    PermissionStatus permission = await location.hasPermission();

    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.grantedLimited) {
      permission = await location.requestPermission();
      if (permission == PermissionStatus.denied ||
          permission == PermissionStatus.deniedForever) {
        _logger.w('Location permission denied');
      }
    }

    return permission;
  }
}

class LocationServicesDisabledException implements Exception {}

class LocationPermissionDeniedException implements Exception {}
