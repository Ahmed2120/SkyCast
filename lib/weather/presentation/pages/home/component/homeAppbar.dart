import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utility/app_colors.dart';
import 'package:weather_app/weather/presentation/controller/dailyWeather_bloc.dart';
import 'package:weather_app/weather/presentation/controller/dailyWeather_event.dart';
import 'package:weather_app/weather/presentation/controller/dailyWeather_state.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppbarState extends State<HomeAppbar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _triggerSearch(BuildContext context) {
    if (_searchController.text.isNotEmpty) {
      BlocProvider.of<DailyWeatherBloc>(context)
          .add(GetDailyWeatherEvent(_searchController.text));
      BlocProvider.of<DailyWeatherBloc>(context)
          .add(const SearchDailyEvent(false));
      _searchController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyWeatherBloc, DailyWeatherState>(
      builder: (context, state) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: state.isActiveSearch
            ? FadeInDown(
                duration: const Duration(milliseconds: 300),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: TextField(
                    controller: _searchController,
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.search,
                    autofocus: true,
                    style: const TextStyle(
                      color: AppColors.stringsColor,
                      fontSize: 16,
                    ),
                    onSubmitted: (String text) => _triggerSearch(context),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                      hintText: 'Search city...',
                      hintStyle: TextStyle(
                        color: AppColors.stringsColor.withOpacity(0.5),
                        fontSize: 16,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.stringsColor,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.stringsColor,
                          size: 16,
                        ),
                        onPressed: () => _triggerSearch(context),
                      ),
                    ),
                  ),
                ),
              )
            : null,
        leading: IconButton(
          icon: state.isActiveSearch
              ? Icon(Icons.close, color: AppColors.stringsColor)
              : Icon(Icons.search, color: AppColors.stringsColor),
          onPressed: () {
            BlocProvider.of<DailyWeatherBloc>(context)
                .add(SearchDailyEvent(state.isActiveSearch ? false : true));
            if (state.isActiveSearch) {
              _searchController.clear();
            }
          },
        ),
      ),
    );
  }
}
