// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      humidity: json['humidity'] as int,
      pressure: json['pressure'] as int,
      temp: DoubleExt.kelvinToCelsius(json['temp'] as double),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'temp': instance.temp,
    };
