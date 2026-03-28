import 'package:weather_app/weather/data/model/weather_model.dart';
import 'package:weather_app/weather/domain/entities/day_weather.dart';

class DayWeatherModel extends DayWeather {
  DayWeatherModel(
      { required super.name, required super.dateTime, required super.weather, required super.hours});

  factory DayWeatherModel.fromJson(Map<String, dynamic> res, String name) => DayWeatherModel(
      name: name,
      dateTime: res['datetime'],
      weather: WeatherModel.fromJson(res),
      hours: res['hours']
          .map<WeatherModel>((json) => WeatherModel.fromJson(json))
          .toList());
}
