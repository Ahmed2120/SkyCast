import 'package:get_it/get_it.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';

import '../../weather/data/datasource/remote_datasource.dart';
import '../../weather/data/repository/weather_repository.dart';
import '../../weather/domain/usecases/get_dailyWeather_usecase.dart';
import '../../weather/domain/usecases/get_weather_by_country.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){

  sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  sl.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(sl()));
  sl.registerLazySingleton<GetWeatherByCountry>(() => GetWeatherByCountry(sl()));
  sl.registerLazySingleton<GetDailyWeather>(() => GetDailyWeather(sl()));

  }
}