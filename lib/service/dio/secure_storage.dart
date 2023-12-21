
import 'package:shared_preferences/shared_preferences.dart';


class SecureStorage {
  static late final SharedPreferences _instance;

  static Future<void> initSharedPref() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future<void> setRefresh(String refresh) async {
    await _instance.setString('refresh', refresh);
  }

  String? getRefresh()  {
    return _instance.getString('refresh');
  }

  Future<void> setAccess(String access) async {
    await _instance.setString('access', access);
  }

  String getAccess()  {
    return _instance.getString('access') ?? '';
  }

  bool isRegistered()  {
    final res = _instance.getString('access');
    return res != null;
  }

  Future<void> setLocale(String locale) async {
    await _instance.setString('locale', locale);
  }

  String getLocale()  {
    return _instance.getString('locale') ?? 'uz';
  }

  Future<bool> clear() async {
    return await _instance.clear();
  }
}
