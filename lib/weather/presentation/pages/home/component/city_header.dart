import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utility/app_colors.dart';
import 'package:weather_app/core/utility/global_methods.dart';

class CityHeader extends StatelessWidget {
  final String cityName;

  const CityHeader({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      duration: const Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: AppColors.stringsColor,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            GlobalMethods.formatDate,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.dateColor,
            ),
          ),
        ],
      ),
    );
  }
}
