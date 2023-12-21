
import 'package:alibi_shop/service/dialogs/custom_snack_bar.dart';
import 'package:dio/dio.dart';

class AuthDio {
  late final Dio _dio;
  static final CustomSnackBar _snackBar = CustomSnackBar();

  AuthDio() {
    _dio = Dio(
      BaseOptions(
        validateStatus: (statusCode) {
          if (statusCode == null) {
            return false;
          }
          if (statusCode == 404) {
            return true;
          }
          if (statusCode == 422) {
            return true;
          } else {
            return statusCode >= 200 && statusCode < 300;
          }
        },
        baseUrl: 'https://lordstormrage.pythonanywhere.com/en/api/v1',
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json; charset=utf-8',
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) {
          switch (response.statusCode) {
            case 422:
              {

              }
              break;
          }
          handler.next(response);
        },
        onError: (DioException e, handler) async {
          _snackBar.showError('Error occurred!');
          handler.next(e);
        },
      ),
    );

  }

  Dio get get => _dio;
}
