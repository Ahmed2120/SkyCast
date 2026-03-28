import 'package:weather_app/weather/domain/entities/weather.dart';

import '../../../core/utility/enums.dart';

class WeatherState {
  final Weather? weather;
  final RequestState weatherState;
  final String message;

  final bool isActiveSearch;

  const WeatherState(
      {this.weather,
      this.weatherState = RequestState.loading,
      this.message = '',
      this.isActiveSearch = false});

  WeatherState copyWith({
    Weather? weather,
    RequestState? weatherState,
    String? message,
    bool? isActiveSearch,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      weatherState: weatherState ?? this.weatherState,
      message: message ?? this.message,
      isActiveSearch: isActiveSearch ?? this.isActiveSearch,
    );
  }
}
