import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utility/enums.dart';
import 'package:weather_app/weather/presentation/controller/weather_event.dart';
import 'package:weather_app/weather/presentation/controller/weather_state.dart';

import '../../data/datasource/remote_datasource.dart';
import '../../data/repository/weather_repository.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repository/base_weather_repository.dart';
import '../../domain/usecases/get_weather_by_country.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  GetWeatherByCountry getWeatherByCountry;
  WeatherBloc(this.getWeatherByCountry) : super(const WeatherState()){
    on<GetWeatherByCityNameEvent>((event, emit) async{
      // emit(state.copyWith(weatherState: RequestState.loading));
      //
      // final result = await getWeatherByCountry.execute(event.cityName);
      // emit(state.copyWith(weather: result, weatherState: RequestState.loaded));

      emit(state.copyWith(weatherState: RequestState.loading));

      final result2 = await getWeatherByCountry.call(WeatherParameter(event.cityName));
      emit(state.copyWith(weather: result2, weatherState: RequestState.loaded));

    });

    on<SearchEvent>((event, emit) async{

      emit(state.copyWith(isActiveSearch: event.isActiveSearch));

    });
  }
}