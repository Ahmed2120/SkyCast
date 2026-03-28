import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utility/enums.dart';
import 'package:weather_app/core/utility/result.dart';
import 'package:weather_app/weather/presentation/controller/dailyWeather_event.dart';
import 'package:weather_app/weather/presentation/controller/dailyWeather_state.dart';

import '../../domain/usecases/get_dailyWeather_usecase.dart';

class DailyWeatherBloc extends Bloc<DailyWeatherEvent, DailyWeatherState>{

  final GetDailyWeather _getDailyWeather;

  DailyWeatherBloc(this._getDailyWeather): super(DailyWeatherState()){
    on<GetDailyWeatherEvent>((event, emit) async{
      emit(state.copyWith(dailyWeatherState: RequestState.loading));

      final result = await _getDailyWeather.call(WeatherParameters(event.address));

      result.fold(
        (data) => emit(state.copyWith(
          dailyWeathers: data,
          dailyWeatherState: RequestState.loaded,
        )),
        (failure) => emit(state.copyWith(
          dailyWeatherState: RequestState.error,
          message: failure.message,
        )),
      );
    });

    on<SearchDailyEvent>((event, emit) async{

      emit(state.copyWith(isActiveSearch: event.isActiveSearch));

    });
  }
}