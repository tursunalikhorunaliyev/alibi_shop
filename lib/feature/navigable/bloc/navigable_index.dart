import 'package:bloc/bloc.dart';

class NavigableIndex extends Cubit<int> {
  NavigableIndex(super.initialState);

  changeIndex(int pageIndex) {
    emit(pageIndex);
  }
}
