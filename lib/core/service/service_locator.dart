import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/utility/consts.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';

import '../../weather/data/datasource/remote_datasource.dart';
import '../../weather/data/repository/weather_repository.dart';
import '../../weather/domain/usecases/get_dailyWeather_usecase.dart';
import '../../weather/domain/usecases/get_weather_by_country.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){
    // Networking
    sl.registerLazySingleton<Dio>(() => Dio(BaseOptions(
      baseUrl: AppConstance.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ))..interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    )));

    // Data Sources
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource(sl()));
    
    // Repositories
    sl.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(sl()));
    
    // Use Cases
    sl.registerLazySingleton<GetWeatherByCountry>(() => GetWeatherByCountry(sl()));
    sl.registerLazySingleton<GetDailyWeather>(() => GetDailyWeather(sl()));
  }
}