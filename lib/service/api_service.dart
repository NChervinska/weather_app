import 'package:injectable/injectable.dart';

import '../api/weather_api_client.dart';
import '../model/weather_wrapper.dart';
import 'base_service.dart';

@injectable
class ApiService extends BaseService {
  final WeatherApiClient apiClient;

  ApiService(this.apiClient);

  Future<WeatherWrapper> getCurrentWeather(String? city) {
    return makeErrorParsedCall(() async {
      return await apiClient.getCurrentWeather(city);
    });
  }

  Future<List<WeatherWrapper>> getHourlyWeather(String? city) {
    return makeErrorParsedCall(() async {
      final response = await apiClient.getHourlyWeather(city);

      return response.list;
    });
  }
}
