import 'package:flutter/material.dart';

import 'resources/themes.dart';
import 'routes.dart';
import 'ui/pages/splash_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage.create(),
      theme: createTheme(),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
