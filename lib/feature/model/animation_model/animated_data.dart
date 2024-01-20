// To parse this JSON data, do
//
//     final animatedData = animatedDataFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'animated_data.freezed.dart';
part 'animated_data.g.dart';

AnimatedData animatedDataFromJson(String str) =>
    AnimatedData.fromJson(json.decode(str));

String animatedDataToJson(AnimatedData data) => json.encode(data.toJson());

@freezed
class AnimatedData with _$AnimatedData {
  const factory AnimatedData({
    @JsonKey(name: "top_height") required double topHeight,
    @JsonKey(name: "pos_left") required double posLeft,
    @JsonKey(name: "pos_right") required double posRight,
    @JsonKey(name: "text_opacity") required double textOpacity,
    @JsonKey(name: "list_pad") required double listPad,
    @JsonKey(name: "card_opacity") required double cardOpacity,
  }) = _AnimatedData;

  factory AnimatedData.fromJson(Map<String, dynamic> json) =>
      _$AnimatedDataFromJson(json);
}
