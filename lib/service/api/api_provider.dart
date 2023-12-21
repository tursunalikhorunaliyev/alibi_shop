
import 'package:alibi_shop/service/dio/cutom_dio.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final _dio = CustomDio().get;

  ///POST
  Future<Response> updateUserData() async {
    return await _dio.post('/accounts/user/register/');
  }

  ///DELETE

  ///GET
  Future<Response> getMe() async {
    return await _dio.get('/accounts/user/retrieve/');
  }
}
