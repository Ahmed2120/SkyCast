import 'package:weather_app/weather/data/model/weather_model.dart';

import '../../domain/entities/hour_weather.dart';

class HourWeatherModel extends HourWeather{

  HourWeatherModel({required super.dateTime, required super.weather});

  factory HourWeatherModel.fromJson(Map<String, dynamic> res)=>
      HourWeatherModel(dateTime: res['datetime'], weather: WeatherModel.fromJson(res));
}