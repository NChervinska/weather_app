import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home_cubit/home_cubit.dart';
import '../../di/di.dart';
import '../../resources/app_routes.dart';
import '../../resources/app_strings.dart';
import '../../utils/dialogs_utils.dart';
import '../view/chart_weather_view.dart';
import '../view/weather_tile.dart';

class HomePage extends StatelessWidget {
  static Widget create() {
    return BlocProvider(
      create: (context) => locator.get<HomeCubit>()..getWeathers(),
      child: const HomePage._(),
    );
  }

  const HomePage._();

  void _onStateChanged(BuildContext context, HomeState state) {
    if (state.status == HomeStatus.error) {
      Dialogs.of(context).showErrorToast(state.errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.weatherApp),
        actions: [_buildLeading(context)],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: _onStateChanged,
            builder: (context, state) {
              switch (state.status) {
                case HomeStatus.loading:
                case HomeStatus.error:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case HomeStatus.init:
                  return _buildBody(context, state);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.city);
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 16),
        child: Text(AppStrings.changeCity),
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomeState state) {
    return Column(
      children: [
        const Spacer(),
        WeatherTile(
          weatherWrapper: state.currentWeather,
          main: true,
        ),
        const Spacer(),
        ChartWeatherView(weatherWrapper: state.weathers),
        const Spacer(),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 24),
            itemBuilder: (_, index) {
              return WeatherTile(
                weatherWrapper: state.weathers[index],
              );
            },
            itemCount: state.weathers.length,
          ),
        ),
      ],
    );
  }
}
