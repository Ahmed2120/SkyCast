import 'package:flutter/material.dart';
import 'package:weather_app/core/utility/app_colors.dart';

class TemperatureDisplay extends StatelessWidget {
  final String title;
  final double temp;

  const TemperatureDisplay({
    Key? key,
    required this.title,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${temp.toInt()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.stringsColor,
                  fontSize: 70,
                  height: 1.1,
                ),
              ),
              if (title.isNotEmpty)
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.stringsColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
          const Positioned(
            top: 8,
            right: -24,
            child: Text(
              '°C',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColors.stringsColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
