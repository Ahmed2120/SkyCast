abstract class WeatherEvent{
  const WeatherEvent();
}

class GetWeatherByCityNameEvent extends WeatherEvent{
  String cityName;
  GetWeatherByCityNameEvent(this.cityName);
}

class SearchEvent extends WeatherEvent{
  bool isActiveSearch;
  SearchEvent(this.isActiveSearch);
}