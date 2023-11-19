import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getweathercubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/getweathercubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              )),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.blue;
    case 'cloudy':
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
    case 'patchy freezing drizzle possible':
    case 'blowing snow':
    case 'blizzard':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.grey;
    case 'patchy rain possible':
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.blue;
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'ice pellets':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.grey;
    case 'thundery outbreaks possible':
      return Colors.red;
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
