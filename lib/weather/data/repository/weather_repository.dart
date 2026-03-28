import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/core/utility/result.dart';
import 'package:weather_app/weather/data/datasource/remote_datasource.dart';
import 'package:weather_app/weather/domain/entities/day_weather.dart';
import 'package:weather_app/weather/domain/repository/base_weather_repository.dart';

import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_dailyWeather_usecase.dart';

class WeatherRepository implements BaseWeatherRepository{
  final BaseRemoteDataSource baseRemoteDataSource;

  WeatherRepository(this.baseRemoteDataSource);

  @override
  Future<Result<Weather>> getWeatherByCityName(String cityName) async{
    try {
      final model = await baseRemoteDataSource.getWeatherByCountryName(cityName);
      if (model != null) {
        return Success(model.toEntity());
      }
      return const FailureResult(ServerFailure('City not found or server error.'));
    } catch (e) {
      return const FailureResult(UnknownFailure());
    }
  }

  @override
  Future<Result<List<DayWeather>>> getDailyWeatherByAddress(WeatherParameters parameter) async{
    try {
      final models = await baseRemoteDataSource.getDailyWeatherByAddress(parameter);
      if (models != null) {
        return Success(models.map((m) => m.toEntity()).toList());
      }
      return const FailureResult(ServerFailure('Weather data unavailable.'));
    } catch (e) {
      return const FailureResult(UnknownFailure());
    }
  }
}