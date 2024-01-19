// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animated_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimatedDataImpl _$$AnimatedDataImplFromJson(Map<String, dynamic> json) =>
    _$AnimatedDataImpl(
      topHeight: (json['top_height'] as num).toDouble(),
      posLeft: (json['pos_left'] as num).toDouble(),
      posRight: (json['pos_right'] as num).toDouble(),
      textOpacity: (json['text_opacity'] as num).toDouble(),
      listPad: (json['list_pad'] as num).toDouble(),
    );

Map<String, dynamic> _$$AnimatedDataImplToJson(_$AnimatedDataImpl instance) =>
    <String, dynamic>{
      'top_height': instance.topHeight,
      'pos_left': instance.posLeft,
      'pos_right': instance.posRight,
      'text_opacity': instance.textOpacity,
      'list_pad': instance.listPad,
    };
