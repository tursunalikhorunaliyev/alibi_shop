import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'button_sheet_state.dart';

class ButtonSheetCubit extends Cubit<ButtonSheetState> {
  ButtonSheetCubit() : super(const ButtonSheetInitial(isTapped: false));
  void changeState(bool boolean) {
    emit(
      ButtonSheetData(isTapped: boolean),
    );
  }
}
