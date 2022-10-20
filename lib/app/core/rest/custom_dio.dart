import 'package:dart_week_copa/app/core/rest/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../config/env/env.dart';

class CustomDio extends DioForNative {
  final _authInteceptor = AuthInterceptor();
  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.i['backend_base_url'] ?? '',
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  CustomDio auth() {
    interceptors.add(_authInteceptor);
    return this;
  }

  CustomDio unAuth() {
    interceptors.remove(_authInteceptor);
    return this;
  }
}
