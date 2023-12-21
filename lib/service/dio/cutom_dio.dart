import 'package:alibi_shop/service/dialogs/custom_snack_bar.dart';
import 'package:alibi_shop/service/dio/secure_storage.dart';
import 'package:dio/dio.dart';


class CustomDio {
  static Dio _dio = Dio();
  static final CustomSnackBar _snackBar = CustomSnackBar();

  static Dio create() {
    final token = SecureStorage().getAccess();
    final locale = SecureStorage().getLocale();

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
        baseUrl: 'https://I8speak.ucoders.uz',
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
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI4OTY4MjIwLCJpYXQiOjE2OTc0MzIyMjAsImp0aSI6ImRhYTFhNWRjNTZiMDQ0NmZhMmFlNjZmNWE5M2YxYjYyIiwidXNlcl9pZCI6MX0.w2-2YFKuRtRXqk4Y9cJg-HHzfAnTELOgx9E-nLTVJyg';

          if (options.headers.containsKey('Accept-Language') == false) {
            options.headers['Accept-Language'] = locale;
          }

          return handler.next(options);
        },
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

    return _dio;
  }

  Dio get get => _dio;
}
