import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:weather_app/weather_calling_services/controllers/weather_controller.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = Get.put(WeatherController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Center(child: const Text('Weather Searcher')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() {
                if (controller.loading.value) {
                  return const CircularProgressIndicator();
                } else if (controller.error.value != null) {
                  return Text('Error: \n${controller.error.value}', style: const TextStyle(color: Colors.red));
                } else if (controller.weather.value != null) {
                  final weather = controller.weather.value!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(weather.cityName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Image.network(weather.iconUrl),
                      Text('${weather.temperature}°C', style: const TextStyle(fontSize: 32)),
                      Text(weather.description, style: const TextStyle(fontSize: 18)),
                    ],
                  );
                } else {
                  return const Text('No data');
                }
              }),
              TextField(
                onTap: () {
                  DropdownButton<String>(
                    items: ['Trivandrum', 'Kochi', 'Kozhikode'].map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.cityName = newValue;
                        controller.fetchWeather();
                      }
                    },
                  );
                },

                inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
  ],
                decoration: const InputDecoration(
                  labelText: 'Enter city name',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  controller.cityName = value;
                  controller.fetchWeather();
                },
              ),
                            ElevatedButton(
                onPressed: () async {
              final selectedCity = await showModalBottomSheet<String>(
                context: context,
                builder: (BuildContext context) {
                  return ListView(
                    children: ['Trivandrum', 'Kochi', 'Kozhikode'].map((city) {
                      return ListTile(
                        title: Text(city),
                        onTap: () {
                          Navigator.pop(context, city);
                        },
                      );
                    }).toList(),
                  );
                },
              );
              if (selectedCity != null) {
                controller.cityName = selectedCity;
                controller.fetchWeather();
              }
            },
                child: const Text(' Choose City'),
              ),
            ],
          ),
        ),
      ),
    );
}
}