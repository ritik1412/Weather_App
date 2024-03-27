import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../utilities/api_key.dart';
import '../models/temperatures_model.dart';

class FetchWeatherRepository {
  Future<Temperatures?> fetchWeatherRepo({
    required String lat,
    required String lon,
  }) async {
    const String key = ApiKey.weatherApiKey;
    final http.Client client = http.Client();
    try {
      final Map<String, String> queryParameters = <String, String>{
        'key': key,
        'q': '$lat,$lon',
        'days': '1',
        'aqi': 'yes',
      };

      final http.Response response = await client.get(
        Uri(
          scheme: 'https',
          host: 'api.weatherapi.com',
          path: '/v1/forecast.json',
          queryParameters: queryParameters,
        ),
      );

      // Check if the response status code is successful (2xx)
      if (response.statusCode == 200) {
        // Parse the JSON response into your model
        final Temperatures temperatures =
            Temperatures.fromJson(jsonDecode(response.body));

        return temperatures;
      } else {
        // Handle non-successful response
        throw Exception('Failed to fetch weather: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
      return null;
    } finally {
      // Always close the client to prevent resource leaks
      client.close();
    }
  }
}
