import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather_calling_services/models/weather_model.dart';

class WeatherService {
  static const String _baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<WeatherModel> fetchWeather(String cityName) async {
    final url = Uri.parse('$_baseUrl?q=$cityName&appid=$apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}