import 'package:flutter/material.dart';

import '../../model/weather_wrapper.dart';
import '../../resources/app_strings.dart';
import '../../utils/date_time_ext.dart';
import '../../utils/double_ext.dart';

class WeatherTile extends StatelessWidget {
  final WeatherWrapper? weatherWrapper;
  final bool main;

  const WeatherTile({
    super.key,
    this.main = false,
    required this.weatherWrapper,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final weather = weatherWrapper;
    if (weather == null) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (weather.name != null)
          Text(
            weather.name ?? '',
            style: main ? theme.headlineLarge : theme.bodyLarge,
          )
        else
          Text(weather.time.getString()),
        const SizedBox(height: 16),
        Text(
          weather.weather.temp.getString(),
          style: main ? theme.headlineLarge : theme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text('${AppStrings.humidity}: ${weather.weather.humidity}%'),
        const SizedBox(height: 8),
        Text('${AppStrings.pressure}: ${weather.weather.pressure}'),
      ],
    );
  }
}
