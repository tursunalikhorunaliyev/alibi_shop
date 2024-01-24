import 'package:alibi_shop/service/navigation/add_to_cart.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setup() {
  locator.registerSingleton<AddToCart>(AddToCart());
}
