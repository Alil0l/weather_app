import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '58d16ebc01b6449bae5143135230110';
  WeatherService();
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      WeatherModel weatherModel = WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Oops There Was An Error, Please Try Later!';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops There Was An Error, Please Try Later!');
    }
  }
}
