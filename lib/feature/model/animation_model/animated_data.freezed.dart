// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animated_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnimatedData _$AnimatedDataFromJson(Map<String, dynamic> json) {
  return _AnimatedData.fromJson(json);
}

/// @nodoc
mixin _$AnimatedData {
  @JsonKey(name: "top_height")
  double get topHeight => throw _privateConstructorUsedError;
  @JsonKey(name: "pos_left")
  double get posLeft => throw _privateConstructorUsedError;
  @JsonKey(name: "pos_right")
  double get posRight => throw _privateConstructorUsedError;
  @JsonKey(name: "text_opacity")
  double get textOpacity => throw _privateConstructorUsedError;
  @JsonKey(name: "list_pad")
  double get listPad => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimatedDataCopyWith<AnimatedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimatedDataCopyWith<$Res> {
  factory $AnimatedDataCopyWith(
          AnimatedData value, $Res Function(AnimatedData) then) =
      _$AnimatedDataCopyWithImpl<$Res, AnimatedData>;
  @useResult
  $Res call(
      {@JsonKey(name: "top_height") double topHeight,
      @JsonKey(name: "pos_left") double posLeft,
      @JsonKey(name: "pos_right") double posRight,
      @JsonKey(name: "text_opacity") double textOpacity,
      @JsonKey(name: "list_pad") double listPad});
}

/// @nodoc
class _$AnimatedDataCopyWithImpl<$Res, $Val extends AnimatedData>
    implements $AnimatedDataCopyWith<$Res> {
  _$AnimatedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topHeight = null,
    Object? posLeft = null,
    Object? posRight = null,
    Object? textOpacity = null,
    Object? listPad = null,
  }) {
    return _then(_value.copyWith(
      topHeight: null == topHeight
          ? _value.topHeight
          : topHeight // ignore: cast_nullable_to_non_nullable
              as double,
      posLeft: null == posLeft
          ? _value.posLeft
          : posLeft // ignore: cast_nullable_to_non_nullable
              as double,
      posRight: null == posRight
          ? _value.posRight
          : posRight // ignore: cast_nullable_to_non_nullable
              as double,
      textOpacity: null == textOpacity
          ? _value.textOpacity
          : textOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      listPad: null == listPad
          ? _value.listPad
          : listPad // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimatedDataImplCopyWith<$Res>
    implements $AnimatedDataCopyWith<$Res> {
  factory _$$AnimatedDataImplCopyWith(
          _$AnimatedDataImpl value, $Res Function(_$AnimatedDataImpl) then) =
      __$$AnimatedDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "top_height") double topHeight,
      @JsonKey(name: "pos_left") double posLeft,
      @JsonKey(name: "pos_right") double posRight,
      @JsonKey(name: "text_opacity") double textOpacity,
      @JsonKey(name: "list_pad") double listPad});
}

/// @nodoc
class __$$AnimatedDataImplCopyWithImpl<$Res>
    extends _$AnimatedDataCopyWithImpl<$Res, _$AnimatedDataImpl>
    implements _$$AnimatedDataImplCopyWith<$Res> {
  __$$AnimatedDataImplCopyWithImpl(
      _$AnimatedDataImpl _value, $Res Function(_$AnimatedDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topHeight = null,
    Object? posLeft = null,
    Object? posRight = null,
    Object? textOpacity = null,
    Object? listPad = null,
  }) {
    return _then(_$AnimatedDataImpl(
      topHeight: null == topHeight
          ? _value.topHeight
          : topHeight // ignore: cast_nullable_to_non_nullable
              as double,
      posLeft: null == posLeft
          ? _value.posLeft
          : posLeft // ignore: cast_nullable_to_non_nullable
              as double,
      posRight: null == posRight
          ? _value.posRight
          : posRight // ignore: cast_nullable_to_non_nullable
              as double,
      textOpacity: null == textOpacity
          ? _value.textOpacity
          : textOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      listPad: null == listPad
          ? _value.listPad
          : listPad // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimatedDataImpl implements _AnimatedData {
  const _$AnimatedDataImpl(
      {@JsonKey(name: "top_height") required this.topHeight,
      @JsonKey(name: "pos_left") required this.posLeft,
      @JsonKey(name: "pos_right") required this.posRight,
      @JsonKey(name: "text_opacity") required this.textOpacity,
      @JsonKey(name: "list_pad") required this.listPad});

  factory _$AnimatedDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimatedDataImplFromJson(json);

  @override
  @JsonKey(name: "top_height")
  final double topHeight;
  @override
  @JsonKey(name: "pos_left")
  final double posLeft;
  @override
  @JsonKey(name: "pos_right")
  final double posRight;
  @override
  @JsonKey(name: "text_opacity")
  final double textOpacity;
  @override
  @JsonKey(name: "list_pad")
  final double listPad;

  @override
  String toString() {
    return 'AnimatedData(topHeight: $topHeight, posLeft: $posLeft, posRight: $posRight, textOpacity: $textOpacity, listPad: $listPad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimatedDataImpl &&
            (identical(other.topHeight, topHeight) ||
                other.topHeight == topHeight) &&
            (identical(other.posLeft, posLeft) || other.posLeft == posLeft) &&
            (identical(other.posRight, posRight) ||
                other.posRight == posRight) &&
            (identical(other.textOpacity, textOpacity) ||
                other.textOpacity == textOpacity) &&
            (identical(other.listPad, listPad) || other.listPad == listPad));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, topHeight, posLeft, posRight, textOpacity, listPad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimatedDataImplCopyWith<_$AnimatedDataImpl> get copyWith =>
      __$$AnimatedDataImplCopyWithImpl<_$AnimatedDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimatedDataImplToJson(
      this,
    );
  }
}

abstract class _AnimatedData implements AnimatedData {
  const factory _AnimatedData(
          {@JsonKey(name: "top_height") required final double topHeight,
          @JsonKey(name: "pos_left") required final double posLeft,
          @JsonKey(name: "pos_right") required final double posRight,
          @JsonKey(name: "text_opacity") required final double textOpacity,
          @JsonKey(name: "list_pad") required final double listPad}) =
      _$AnimatedDataImpl;

  factory _AnimatedData.fromJson(Map<String, dynamic> json) =
      _$AnimatedDataImpl.fromJson;

  @override
  @JsonKey(name: "top_height")
  double get topHeight;
  @override
  @JsonKey(name: "pos_left")
  double get posLeft;
  @override
  @JsonKey(name: "pos_right")
  double get posRight;
  @override
  @JsonKey(name: "text_opacity")
  double get textOpacity;
  @override
  @JsonKey(name: "list_pad")
  double get listPad;
  @override
  @JsonKey(ignore: true)
  _$$AnimatedDataImplCopyWith<_$AnimatedDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
