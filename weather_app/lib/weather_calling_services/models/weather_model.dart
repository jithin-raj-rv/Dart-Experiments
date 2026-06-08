class WeatherModel {
  
  final String cityName;
  final double temperature;
  final String description;
  final String iconUrl;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    
    required this.description,
    required this.iconUrl,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      iconUrl: 'http://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png',
    );
  }

}