import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getweathercubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFaliureState());
    }
  }
}
