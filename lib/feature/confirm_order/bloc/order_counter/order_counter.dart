import 'package:bloc/bloc.dart';

class OrderCounter extends Cubit<int> {
  OrderCounter(super.initialState);

  increase() {
    emit(state + 1);
  }

  decrease() {
    if (state != 0) {
      emit(state - 1);
    }
  }
}
