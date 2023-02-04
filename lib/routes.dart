import 'package:flutter/material.dart';

import 'resources/app_routes.dart';
import 'ui/pages/city_page.dart';
import 'ui/pages/home_page.dart';

Route onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: _getPageBuilder(settings),
  );
}

WidgetBuilder _getPageBuilder(RouteSettings settings) {
  try {
    return _mapRoutes(settings)[settings.name] ?? (_) => CityPage.create();
  } catch (_) {
    return (_) => CityPage.create();
  }
}

Map<String, WidgetBuilder> _mapRoutes(RouteSettings settings) {
  return {
    AppRoutes.home: (_) => HomePage.create(),
    AppRoutes.city: (_) => CityPage.create(),
  };
}
