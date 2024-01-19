import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animation_state.dart';
part 'animation_cubit.freezed.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit() : super(const AnimationState.initial());


}
