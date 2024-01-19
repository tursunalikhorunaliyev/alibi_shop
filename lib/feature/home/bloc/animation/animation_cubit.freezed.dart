// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimationState {
  AnimatedData get animatedData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimatedData animatedData) animating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AnimatedData animatedData)? animating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimatedData animatedData)? animating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Animating value) animating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Animating value)? animating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Animating value)? animating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimationStateCopyWith<AnimationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimationStateCopyWith<$Res> {
  factory $AnimationStateCopyWith(
          AnimationState value, $Res Function(AnimationState) then) =
      _$AnimationStateCopyWithImpl<$Res, AnimationState>;
  @useResult
  $Res call({AnimatedData animatedData});

  $AnimatedDataCopyWith<$Res> get animatedData;
}

/// @nodoc
class _$AnimationStateCopyWithImpl<$Res, $Val extends AnimationState>
    implements $AnimationStateCopyWith<$Res> {
  _$AnimationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animatedData = null,
  }) {
    return _then(_value.copyWith(
      animatedData: null == animatedData
          ? _value.animatedData
          : animatedData // ignore: cast_nullable_to_non_nullable
              as AnimatedData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimatedDataCopyWith<$Res> get animatedData {
    return $AnimatedDataCopyWith<$Res>(_value.animatedData, (value) {
      return _then(_value.copyWith(animatedData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimatingImplCopyWith<$Res>
    implements $AnimationStateCopyWith<$Res> {
  factory _$$AnimatingImplCopyWith(
          _$AnimatingImpl value, $Res Function(_$AnimatingImpl) then) =
      __$$AnimatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AnimatedData animatedData});

  @override
  $AnimatedDataCopyWith<$Res> get animatedData;
}

/// @nodoc
class __$$AnimatingImplCopyWithImpl<$Res>
    extends _$AnimationStateCopyWithImpl<$Res, _$AnimatingImpl>
    implements _$$AnimatingImplCopyWith<$Res> {
  __$$AnimatingImplCopyWithImpl(
      _$AnimatingImpl _value, $Res Function(_$AnimatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animatedData = null,
  }) {
    return _then(_$AnimatingImpl(
      null == animatedData
          ? _value.animatedData
          : animatedData // ignore: cast_nullable_to_non_nullable
              as AnimatedData,
    ));
  }
}

/// @nodoc

class _$AnimatingImpl implements _Animating {
  const _$AnimatingImpl(this.animatedData);

  @override
  final AnimatedData animatedData;

  @override
  String toString() {
    return 'AnimationState.animating(animatedData: $animatedData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimatingImpl &&
            (identical(other.animatedData, animatedData) ||
                other.animatedData == animatedData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, animatedData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimatingImplCopyWith<_$AnimatingImpl> get copyWith =>
      __$$AnimatingImplCopyWithImpl<_$AnimatingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimatedData animatedData) animating,
  }) {
    return animating(animatedData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AnimatedData animatedData)? animating,
  }) {
    return animating?.call(animatedData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimatedData animatedData)? animating,
    required TResult orElse(),
  }) {
    if (animating != null) {
      return animating(animatedData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Animating value) animating,
  }) {
    return animating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Animating value)? animating,
  }) {
    return animating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Animating value)? animating,
    required TResult orElse(),
  }) {
    if (animating != null) {
      return animating(this);
    }
    return orElse();
  }
}

abstract class _Animating implements AnimationState {
  const factory _Animating(final AnimatedData animatedData) = _$AnimatingImpl;

  @override
  AnimatedData get animatedData;
  @override
  @JsonKey(ignore: true)
  _$$AnimatingImplCopyWith<_$AnimatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
