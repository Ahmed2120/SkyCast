import 'package:weather_app/core/usecase/base_usecase.dart';
import 'package:weather_app/weather/domain/entities/weather.dart';

import '../repository/base_weather_repository.dart';

class GetWeatherByCountry extends BaseUseCase<Weather, WeatherParameter>{

  final BaseWeatherRepository repository;

  GetWeatherByCountry(this.repository);

  Future<Weather>execute(String cityName) async{
    return await repository.getWeatherByCityName(cityName);
  }

  @override
  Future<Weather> call(WeatherParameter parameters) async{
    return await repository.getWeatherByCityName(parameters.cityName);
  }
}

class WeatherParameter{
  final String cityName;
  WeatherParameter(this.cityName);
}