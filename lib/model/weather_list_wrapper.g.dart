// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_list_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatheListWrapper _$WeatheListWrapperFromJson(Map<String, dynamic> json) =>
    WeatheListWrapper(
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatheListWrapperToJson(WeatheListWrapper instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
