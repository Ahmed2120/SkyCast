import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utility/consts.dart';
import 'package:weather_app/core/utility/global_methods.dart';
import 'package:weather_app/weather/presentation/controller/dailyWeather_bloc.dart';
import 'package:weather_app/weather/presentation/controller/dailyWeather_state.dart';

import '../../../../../core/utility/app_colors.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyWeatherBloc, DailyWeatherState>(
      builder: (context, state) => ZoomIn(
        duration: const Duration(milliseconds: 600),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.dailyWeathers[0].hours!.length,
          padding: const EdgeInsets.symmetric(vertical: 8),
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            final hour = state.dailyWeathers[0].hours![index];
            return FadeIn(
              duration: const Duration(milliseconds: 400),
              child: Container(
                width: 70,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      GlobalMethods.formatTime(hour.dateTime),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.stringsColor,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: AppConstance.getIconPath(hour.icon),
                        width: 38,
                        height: 38,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.wb_cloudy_outlined,
                          color: AppColors.stringsColor,
                        ),
                      ),
                    ),
                    Text(
                      '${hour.temp.toInt()}°',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.stringsColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}