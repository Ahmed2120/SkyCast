import 'package:weather_app/weather/domain/entities/weather.dart';

import '../entities/day_weather.dart';
import '../usecases/get_dailyWeather_usecase.dart';
import '../usecases/get_weather_by_country.dart';

abstract class BaseWeatherRepository{
  Future<Weather>getWeatherByCityName(String cityName);

  Future<List<DayWeather>>getDailyWeatherByAddress(WeatherParameters parameter);
}