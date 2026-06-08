import 'package:get/get.dart';
import 'package:weather_app/weather_calling_services/models/weather_model.dart';
import 'package:weather_app/weather_calling_services/service/WeatherService.dart';

class WeatherController extends GetxController {
  final WeatherService weatherService = WeatherService('1c2e95c6b3dde9061fe2aeefc5673344');

  var weather = Rxn<WeatherModel>();
  var loading = true.obs;
  var error = RxnString();
  String cityName ="Trivandrum";

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  void fetchWeather() async {
    loading.value = true;
    error.value = null;
    try {
      final result = await weatherService.fetchWeather('$cityName,IN');
      weather.value = result;
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
    }
  }
}
