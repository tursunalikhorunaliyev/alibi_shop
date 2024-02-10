import 'package:bloc/bloc.dart';

class ShopItemCounter extends Cubit<int> {
  ShopItemCounter(super.initialState);

  increase() {
    emit(state + 1);
  }

  decrease() {
    if (state != 0) {
      emit(state - 1);
    }
  }
}
