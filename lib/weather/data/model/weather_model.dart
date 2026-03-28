import 'package:weather_app/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel(
    super.dateTime,
    super.preciptype,
    super.icon,
    super.pressure,
    super.humidity,
    super.temp,
    super.wind,
    super.feelsLike,
    super.uvIndex,
    super.precipProb,
    super.visibility,
    super.sunrise,
    super.sunset,
    super.description,
    super.conditions,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> res) => WeatherModel(
        res['datetime'],
        res['preciptype']?[0],
        res['icon'],
        res['pressure']?.toDouble() ?? 0.0,
        res['humidity']?.toDouble() ?? 0.0,
        res['temp']?.toDouble() ?? 0.0,
        res['windspeed']?.toDouble() ?? 0.0,
        res['feelslike']?.toDouble() ?? 0.0,
        res['uvindex']?.toDouble() ?? 0.0,
        res['precipprob']?.toDouble() ?? 0.0,
        res['visibility']?.toDouble() ?? 0.0,
        res['sunrise'],
        res['sunset'],
        res['description'],
        res['conditions'] ?? '',
      );

  Weather toEntity() => Weather(
    dateTime,
    preciptype,
    icon,
    pressure,
    humidity,
    temp,
    wind,
    feelsLike,
    uvIndex,
    precipProb,
    visibility,
    sunrise,
    sunset,
    description,
    conditions,
  );
}
