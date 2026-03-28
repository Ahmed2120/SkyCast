import 'package:weather_app/core/utility/enums.dart';

import '../../domain/entities/day_weather.dart';

class DailyWeatherState {
  final List<DayWeather> dailyWeathers;
  final RequestState dailyWeatherState;
  final String message;

  final bool isActiveSearch;

  DailyWeatherState({
    this.dailyWeathers = const [],
    this.dailyWeatherState = RequestState.loading,
    this.message = '',

    this.isActiveSearch = false
  });

  DailyWeatherState copyWith({
    List<DayWeather>? dailyWeathers,
    RequestState? dailyWeatherState,
    String? message,
    bool? isActiveSearch,
  }) =>
      DailyWeatherState(
        dailyWeathers: dailyWeathers ?? this.dailyWeathers,
        dailyWeatherState: dailyWeatherState ?? this.dailyWeatherState,
        message: message ?? this.message,
        isActiveSearch: isActiveSearch ?? this.isActiveSearch,
      );

}