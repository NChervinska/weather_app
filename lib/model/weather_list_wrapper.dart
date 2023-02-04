import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'weather_wrapper.dart';

part 'weather_list_wrapper.g.dart';

@JsonSerializable()
class WeatheListWrapper extends Equatable {
  final List<WeatherWrapper> list;

  const WeatheListWrapper({required this.list});

  factory WeatheListWrapper.fromJson(Map<String, dynamic> json) {
    return _$WeatheListWrapperFromJson(json);
  }

  @override
  List<Object> get props => [list];

  Map<String, dynamic> toJson() => _$WeatheListWrapperToJson(this);
}
