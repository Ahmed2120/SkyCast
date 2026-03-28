import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/weather/data/model/dayWeather_model.dart';
import 'package:weather_app/weather/domain/usecases/get_weather_by_country.dart';

import '../../../core/utility/consts.dart';
import '../../domain/usecases/get_dailyWeather_usecase.dart';
import '../model/weather_model.dart';

abstract class BaseRemoteDataSource{
  Future<WeatherModel?> getWeatherByCountryName(String countryName);
  
  Future<List<DayWeatherModel>?> getDailyWeatherByAddress(WeatherParameters parameter);
}

class RemoteDataSource implements BaseRemoteDataSource{

  @override
  Future<WeatherModel?> getWeatherByCountryName(String countryName) async{
    try{
      final response = await Dio().get('${AppConstance.baseUrl}/weather?q=$countryName&appid=${AppConstance.apiKey}');
      print(response);
      return WeatherModel.fromJson(response.data);
    }catch(e, s){
      print('$e, $s');
      return null;
    }
  }

  @override
  Future<List<DayWeatherModel>?> getDailyWeatherByAddress(WeatherParameters parameter) async{
    try{
      print('here:   ${AppConstance.getWeatherPath(parameter.cityName)} ');
      final response = await Dio().get(AppConstance.getWeatherPath(parameter.cityName));
      final parsed = response.data['days'].cast<Map<String, dynamic>>();
      print(response);
      return parsed.map<DayWeatherModel>((json)=> DayWeatherModel.fromJson(json, parameter.cityName)).toList();
    }on DioException catch(e, s){
      print('error:    ${e.message}, $s');
      return null;
    }catch(e, s){
      print('error:    $e, $s');
      return null;
    }

  }
}