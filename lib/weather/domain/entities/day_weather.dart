import 'weather.dart';

class DayWeather{
  String? name;
  String? dateTime;
  Weather? weather;
  List<Weather>? hours;

  DayWeather({
    required this.name,
    required this.dateTime,
    required this.weather,
    required this.hours,
});
}