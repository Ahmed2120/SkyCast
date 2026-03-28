import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utility/enums.dart';
import 'package:weather_app/core/utility/result.dart';
import 'package:weather_app/weather/presentation/controller/weather_event.dart';
import 'package:weather_app/weather/presentation/controller/weather_state.dart';

import '../../domain/usecases/get_weather_by_country.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  final GetWeatherByCountry _getWeatherByCountry;

  WeatherBloc(this._getWeatherByCountry) : super(const WeatherState()){
    on<GetWeatherByCityNameEvent>((event, emit) async{
      emit(state.copyWith(weatherState: RequestState.loading));

      final result = await _getWeatherByCountry.call(WeatherParameter(event.cityName));

      result.fold(
        (data) => emit(state.copyWith(
          weather: data,
          weatherState: RequestState.loaded,
        )),
        (failure) => emit(state.copyWith(
          weatherState: RequestState.error,
          message: failure.message,
        )),
      );
    });

    on<SearchEvent>((event, emit) async{
      emit(state.copyWith(isActiveSearch: event.isActiveSearch));
    });
  }
}