import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rekvizits_cubit.freezed.dart';
part 'rekvizits_state.dart';

class RekvizitsCubit extends Cubit<RekvizitsState> {
  RekvizitsCubit()
      : super(
          RekvizitsState.data("Choose street", "No Address",
              DateTime.now().toString(), "By Card"),
        );
  changeData(
      String street, String address, String datetime, String paymentType) {
    emit(RekvizitsState.data(street, address, datetime, paymentType));
  }
}
