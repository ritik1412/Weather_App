import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../models/temperatures_model.dart';
import '../repositories/fetch_location_repository.dart';
import '../repositories/fetch_weather_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Temperatures? _temperature;
  bool _loading = false;

  Temperatures? get temperature => _temperature;
  bool get loading => _loading;

  Future<void> fetchWeather() async {
    _loading = true;
    notifyListeners();

    final LocationData? position =
        await FetchLocationRepository().getCurrentLocation();
    if (position != null) {
      _temperature = await FetchWeatherRepository().fetchWeatherRepo(
        lat: position.latitude.toString(),
        lon: position.longitude.toString(),
      );
    }
    Future<void>.delayed(const Duration(seconds: 5));
    _loading = false;
    notifyListeners();
  }
}
