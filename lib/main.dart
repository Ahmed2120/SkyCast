import 'package:flutter/material.dart';

import 'core/service/service_locator.dart';
import 'weather/data/datasource/remote_datasource.dart';
import 'weather/data/repository/weather_repository.dart';
import 'weather/domain/repository/base_weather_repository.dart';
import 'weather/domain/usecases/get_weather_by_country.dart';
import 'weather/presentation/pages/home/home_page.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:weather_app/core/utility/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  ServiceLocator().init();
  runApp(const WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
