part of 'button_sheet_cubit.dart';

@immutable
abstract class ButtonSheetState {
  final bool isTapped;
  const ButtonSheetState({required this.isTapped});
}

class ButtonSheetInitial extends ButtonSheetState {
  const ButtonSheetInitial({required super.isTapped});
}

class ButtonSheetData extends ButtonSheetState {
  const ButtonSheetData({required super.isTapped});
}
