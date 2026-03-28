import 'package:weather_app/weather/data/datasource/remote_datasource.dart';
import 'package:weather_app/weather/domain/entities/day_weather.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';

import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_dailyWeather_usecase.dart';
import '../../domain/usecases/get_weather_by_country.dart';

class WeatherRepository implements BaseWeatherRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Weather> getWeatherByCityName(String countryName) async{

    return (await baseRemoteDataSource.getWeatherByCountryName(countryName))!;
  }

  @override
  Future<List<DayWeather>> getDailyWeatherByAddress(WeatherParameters parameter) async{
    return (await baseRemoteDataSource.getDailyWeatherByAddress(parameter))!;
  }
}