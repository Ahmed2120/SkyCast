import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstance{
  static const String baseUrl = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  static String getWeatherPath(String address)=> '$baseUrl/$address?unitGroup=metric&include=days%2Chours&key=$apiKey';

  static String getIconPath(String icon)=> 'https://raw.githubusercontent.com/visualcrossing/WeatherIcons/main/PNG/1st%20Set%20-%20Color/$icon.png';
}