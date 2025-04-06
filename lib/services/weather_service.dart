// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "02c62a0049754b0aba885727252601";
  WeatherService({
    required this.dio,
  });
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errmessage = e.response?.data["error"]["message"] ??
          "Opps there was an error ,try later";
      throw Exception(errmessage);
    } catch (e) {
      log(e.toString());
      throw Exception( "Opps there was an error ,try later");
    }
  }
}
