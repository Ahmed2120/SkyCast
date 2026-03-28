class Weather {
  final String dateTime;
  final String? preciptype;
  final String icon;
  final double pressure;
  final double humidity;
  final double temp;
  final double wind;
  final double feelsLike;
  final double uvIndex;
  final double precipProb;
  final double visibility;
  final String? sunrise;
  final String? sunset;
  final String? description;
  final String conditions;

  Weather(
    this.dateTime,
    this.preciptype,
    this.icon,
    this.pressure,
    this.humidity,
    this.temp,
    this.wind,
    this.feelsLike,
    this.uvIndex,
    this.precipProb,
    this.visibility,
    this.sunrise,
    this.sunset,
    this.description,
    this.conditions,
  );
}