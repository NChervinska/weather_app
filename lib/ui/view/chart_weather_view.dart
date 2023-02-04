import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/weather_wrapper.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';

class ChartWeatherView extends StatelessWidget {
  final List<WeatherWrapper> weatherWrapper;

  const ChartWeatherView({
    super.key,
    required this.weatherWrapper,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SfCartesianChart(
        primaryXAxis: DateTimeAxis(dateFormat: DateFormat('E')),
        series: <ChartSeries>[
          LineSeries<WeatherWrapper, DateTime>(
            dataSource: weatherWrapper,
            xValueMapper: (weather, _) => weather.time,
            yValueMapper: (weather, _) => weather.weather.temp,
            pointColorMapper: (_, __) => AppColors.green,
            xAxisName: AppStrings.date,
            yAxisName: AppStrings.degreeCelsius,
          ),
        ],
      ),
    );
  }
}
