import 'package:weather_app/core/utility/result.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';

import '../entities/day_weather.dart';
import '../usecases/get_dailyWeather_usecase.dart';

abstract class BaseWeatherRepository{
  Future<Result<Weather>>getWeatherByCityName(String cityName);

  Future<Result<List<DayWeather>>>getDailyWeatherByAddress(WeatherParameters parameter);
}