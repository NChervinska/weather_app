import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api/api_constants.dart';
import '../api/weather_api_client.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio() {
    return Dio()
      ..options.sendTimeout = 10000
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  @lazySingleton
  WeatherApiClient apiClient(Dio dio) => WeatherApiClient(
        dio,
        baseUrl: ApiConstants.baseUrl,
      );
}
