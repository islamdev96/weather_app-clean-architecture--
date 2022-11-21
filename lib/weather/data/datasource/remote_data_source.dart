// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:weather_app/weather/data/model/weather_model.dart';

import '../../../core/utils/constanances.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName) async {
    try {
      var response = await Dio().get(
          '${Appconstances.baseUrl}/weather?q=$countryName&appid=${Appconstances.appKey}');
      print(response);
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
