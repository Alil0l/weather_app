import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getweathercubit/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        // backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: value);
            Navigator.pop(context);
          },
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 5,
              borderSide: BorderSide(
                width: 2,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            labelText: 'Enter City Name',
            hintText: "Search",
          ),
        ),
      )),
    );
  }
}
