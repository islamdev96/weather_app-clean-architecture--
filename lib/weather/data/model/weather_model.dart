import 'package:weather_app/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required int id,
    required String cityName,
    required String main,
    required String description,
    required int pressure,
  }) : super(
          id: id,
          cityName: cityName,
          main: main,
          description: description,
          pressure: pressure,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      cityName: json['name'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      pressure: json['main']['pressure'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': cityName,
      'main': main,
      'description': description,
      'pressure': pressure,
    };
  }
}
