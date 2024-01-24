import 'package:alibi_shop/service/dio/secure_storage.dart';
import 'package:alibi_shop/service/locator/service_locator.dart';

init() async {
  await SecureStorage.initSharedPref();
  setup();
}
