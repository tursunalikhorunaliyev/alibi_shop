import 'package:alibi_shop/service/dio/secure_storage.dart';


Future<void> init() async {
  await SecureStorage.initSharedPref();
}