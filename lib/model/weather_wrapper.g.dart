// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherWrapper _$WeatherWrapperFromJson(Map<String, dynamic> json) =>
    WeatherWrapper(
      name: json['name'] as String?,
      weather: Weather.fromJson(json['main'] as Map<String, dynamic>),
      time: DateTimeExt.fromJson(json['dt'] as int),
    );

Map<String, dynamic> _$WeatherWrapperToJson(WeatherWrapper instance) =>
    <String, dynamic>{
      'name': instance.name,
      'main': instance.weather,
      'dt': instance.time.toIso8601String(),
    };
