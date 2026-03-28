abstract class DailyWeatherEvent{
  const DailyWeatherEvent();
}

class GetDailyWeatherEvent extends DailyWeatherEvent{
  final String address;
  const GetDailyWeatherEvent(this.address);
}

class SearchDailyEvent extends DailyWeatherEvent{
  final bool isActiveSearch;
  const SearchDailyEvent(this.isActiveSearch);
}