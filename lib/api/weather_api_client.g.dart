// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WeatherApiClient implements WeatherApiClient {
  _WeatherApiClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<WeatherWrapper> getCurrentWeather(
    city, [
    apiKey = ApiConstants.apiKey,
  ]) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'q': city,
      r'appid': apiKey,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<WeatherWrapper>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/weather',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WeatherWrapper.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WeatheListWrapper> getHourlyWeather(
    city, [
    apiKey = ApiConstants.apiKey,
  ]) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'q': city,
      r'appid': apiKey,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<WeatheListWrapper>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/forecast',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WeatheListWrapper.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
