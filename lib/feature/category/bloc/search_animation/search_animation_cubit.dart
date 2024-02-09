import 'package:bloc/bloc.dart';

class SearchAnimationCubit extends Cubit<bool> {
  SearchAnimationCubit(super.initialState);
  changeStatus(bool isAnimation) {
    emit(isAnimation);
  }
}
