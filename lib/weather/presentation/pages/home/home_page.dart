import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/core/utility/consts.dart';
import 'package:weather_app/core/utility/enums.dart';
import 'package:weather_app/core/utility/global_methods.dart';
import 'package:weather_app/weather/presentation/controller/dailyWeather_state.dart';

import '../../../../core/service/service_locator.dart';
import '../../../../core/utility/app_colors.dart';
import '../../../../core/utility/app_strings.dart';
import '../../controller/dailyWeather_bloc.dart';
import '../../controller/dailyWeather_event.dart';
import 'component/categories.dart';
import 'component/city_header.dart';
import 'component/homeAppbar.dart';
import 'component/home_shimmer.dart';
import 'component/hourly_weather.dart';
import 'component/temperature_display.dart';
import 'component/weather_detail_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyWeatherBloc(sl())
        ..add(const GetDailyWeatherEvent('Egypt'))
        ..add(const SearchDailyEvent(false)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: AppColors.linearColor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppbar(),
              Expanded(
                child: BlocBuilder<DailyWeatherBloc, DailyWeatherState>(
                  builder: (context, state) {
                    switch (state.dailyWeatherState) {
                      case RequestState.loading:
                        return const RepaintBoundary(child: HomeShimmer());
                      case RequestState.loaded:
                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<DailyWeatherBloc>().add(
                                  GetDailyWeatherEvent(state.dailyWeathers[0].name!),
                                );
                          },
                          color: AppColors.stringsColor,
                          backgroundColor: AppColors.cardColor,
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CityHeader(cityName: state.dailyWeathers[0].name!),
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    state.dailyWeathers[0].weather!.conditions,
                                    style: const TextStyle(
                                      color: AppColors.stringsColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 160,
                                  child: FadeIn(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                            child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: CachedNetworkImage(
                                            imageUrl: AppConstance.getIconPath(
                                                state.dailyWeathers[0]
                                                    .weather!.icon),
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: AppColors.shimmerBase,
                                              highlightColor:
                                                  AppColors.shimmerHighlight,
                                              child: Container(
                                                height: 80.0,
                                                width: 80.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(40.0),
                                                ),
                                              ),
                                            ),
                                            errorWidget: (context, url, error) =>
                                                const Icon(Icons.error),
                                            height: 120.0,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                        TemperatureDisplay(
                                          title: '',
                                          temp: state
                                              .dailyWeathers[0].weather!.temp,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                FadeInRight(
                                  child: Column(
                                    children: [
                                      WeatherDetailCard(
                                        title: AppStrings.rainFall,
                                        value:
                                            '${state.dailyWeathers[0].weather!.precipProb.toInt()}%',
                                        icon: 'assets/icons/umbrella.png',
                                      ),
                                      WeatherDetailCard(
                                        title: AppStrings.feelsLike,
                                        value:
                                            '${state.dailyWeathers[0].weather!.feelsLike.toInt()}°',
                                        icon: 'assets/icons/wind.png',
                                      ),
                                      WeatherDetailCard(
                                        title: AppStrings.uvIndex,
                                        value:
                                            '${state.dailyWeathers[0].weather!.uvIndex.toInt()} (${GlobalMethods.getUVIndexRiskLevel(state.dailyWeathers[0].weather!.uvIndex)})',
                                        icon: 'assets/icons/humidity.png',
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Categories(),
                                const Divider(
                                  color: AppColors.lineColor,
                                  thickness: 1,
                                  height: 32,
                                ),
                                const SizedBox(
                                  height: 150,
                                  child: RepaintBoundary(child: HourlyWeather()),
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        );
                      case RequestState.error:
                        return Center(
                          child: Text(state.message),
                        );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}