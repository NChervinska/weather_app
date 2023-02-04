import '../resources/app_strings.dart';

extension DoubleExt on double {
  static double kelvinToCelsius(double json) {
    return json - 273.15;
  }

  String getString() {
    return toStringAsFixed(2) + AppStrings.degreeCelsius;
  }
}
