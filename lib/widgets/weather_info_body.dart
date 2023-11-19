import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import '../cubits/getweathercubit/get_weather_cubit.dart';
import '../views/search_view.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    final MaterialColor condition = getThemeColor(
        BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.weatherCondition);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: condition,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  backgroundImage: AssetImage("assets/Image.jpeg"),
                  radius: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Designed By'),
                Text('Ali Mostafa'),
              ],
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(condition.shade900)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SearchPage();
                    },
                  ));
                },
                child: Text('New Search?')),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Today's Weather"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        // backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }));
              },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [condition, Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherModel.city,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  'Upated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      "https:${weatherModel.image}",
                    ),
                    Text(
                      '${weatherModel.avgt}°',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'MinT: ${weatherModel.maxt.round()}°',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'MaxT: ${weatherModel.mint.round()}°',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  weatherModel.weatherCondition,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
