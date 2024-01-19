part of 'animation_cubit.dart';

@freezed
class AnimationState with _$AnimationState {
  const factory AnimationState.animating(AnimatedData animatedData) =
      _Animating;
}
