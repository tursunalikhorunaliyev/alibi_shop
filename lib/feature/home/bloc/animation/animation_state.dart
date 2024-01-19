part of 'animation_cubit.dart';

@freezed
class AnimationState with _$AnimationState {
  const factory AnimationState.initial() = _Initial;
  const factory AnimationState.data() = _Data;
}
