import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/double_ext.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  final int humidity;
  final int pressure;

  @JsonKey(fromJson: DoubleExt.kelvinToCelsius)
  final double temp;

  const Weather({
    required this.humidity,
    required this.pressure,
    required this.temp,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }

  @override
  List<Object?> get props => [humidity, pressure, temp];

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
