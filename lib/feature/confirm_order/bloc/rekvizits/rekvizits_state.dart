part of 'rekvizits_cubit.dart';

@freezed
class RekvizitsState with _$RekvizitsState {
  const factory RekvizitsState.data(
          String street, String address, String datetime, String paymentType) =
      _Data;
}
