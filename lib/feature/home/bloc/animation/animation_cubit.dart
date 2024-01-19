import 'dart:async';

import 'package:alibi_shop/feature/model/animation_model/animated_data.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animation_cubit.freezed.dart';
part 'animation_state.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit()
      : super(
          const AnimationState.animating(
            AnimatedData(
              topHeight: 0,
              posLeft: 400,
              posRight: -200,
              textOpacity: 0,
              listPad: 400,
            ),
          ),
        );

  startAnimation() {
    Timer(const Duration(milliseconds: 800), () {
      emit(
        state.copyWith(
          animatedData: state.animatedData.copyWith(
            topHeight: 480,
          ),
        ),
      );
    });

    Timer(const Duration(milliseconds: 1400), () {
      emit(
        state.copyWith(
          animatedData: state.animatedData.copyWith(
            posLeft: 24,
            posRight: 24,
          ),
        ),
      );
    });

    Timer(const Duration(milliseconds: 1600), () {
      emit(
        state.copyWith(
          animatedData: state.animatedData.copyWith(
            listPad: 0,
          ),
        ),
      );
    });
    Timer(const Duration(milliseconds: 1800), () {
      emit(
        state.copyWith(
          animatedData: state.animatedData.copyWith(textOpacity: 1),
        ),
      );
    });
  }
}
