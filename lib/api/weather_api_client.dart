import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/weather_list_wrapper.dart';
import '../model/weather_wrapper.dart';
import 'api_constants.dart';

part 'weather_api_client.g.dart';

@RestApi()
abstract class WeatherApiClient {
  factory WeatherApiClient(
    Dio dio, {
    String baseUrl,
  }) = _WeatherApiClient;

  @GET('/weather')
  Future<WeatherWrapper> getCurrentWeather(
    @Query('q') String? city, [
    @Query('appid') String apiKey = ApiConstants.apiKey,
  ]);

  @GET('/forecast')
  Future<WeatheListWrapper> getHourlyWeather(
    @Query('q') String? city, [
    @Query('appid') String apiKey = ApiConstants.apiKey,
  ]);
}
