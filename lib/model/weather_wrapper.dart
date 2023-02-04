import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/date_time_ext.dart';
import 'weather.dart';

part 'weather_wrapper.g.dart';

@JsonSerializable()
class WeatherWrapper extends Equatable {
  final String? name;

  @JsonKey(name: 'main')
  final Weather weather;

  @JsonKey(name: 'dt', fromJson: DateTimeExt.fromJson)
  final DateTime time;

  const WeatherWrapper({
    this.name,
    required this.weather,
    required this.time,
  });

  factory WeatherWrapper.fromJson(Map<String, dynamic> json) {
    return _$WeatherWrapperFromJson(json);
  }

  @override
  List<Object?> get props => [weather, name, time];

  Map<String, dynamic> toJson() => _$WeatherWrapperToJson(this);
}
