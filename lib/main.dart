import 'package:flutter/material.dart';

import 'di/di.dart';
import 'weather_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const WeatherApp());
}
