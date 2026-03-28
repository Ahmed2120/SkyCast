import 'package:weather_app/core/usecase/base_usecase.dart';
import 'package:weather_app/core/utility/result.dart';

import '../entities/day_weather.dart';
import '../repository/base_weather_repository.dart';

class GetDailyWeather extends BaseUseCase<Result<List<DayWeather>>, WeatherParameters>{

  final BaseWeatherRepository repository;

  GetDailyWeather(this.repository);

  @override
  Future<Result<List<DayWeather>>> call(WeatherParameters parameters) async{
    return await repository.getDailyWeatherByAddress(parameters);
  }
}

class WeatherParameters{
  final String cityName;
  WeatherParameters(this.cityName);
}