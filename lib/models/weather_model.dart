class WeatherModel {
  final String city;
  final DateTime date;
  final String? image;
  final double avgt;
  final double maxt;
  final double mint;
  final String weatherCondition;

  WeatherModel(
      {required this.city,
      this.image,
      required this.date,
      required this.avgt,
      required this.maxt,
      required this.mint,
      required this.weatherCondition});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      city: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      avgt: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxt: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mint: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
