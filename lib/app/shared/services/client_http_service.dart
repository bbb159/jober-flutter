import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/shared/services/exceptions/app_exception.dart';
import 'package:jober/app/shared/stores/auth/auth_store.dart';

class ClientHttpService {
  AuthStore authStore = Modular.get<AuthStore>();

  static BaseOptions options = new BaseOptions(
    baseUrl: "https://warm-retreat-54583.herokuapp.com",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = new Dio(options);

  Future<dynamic> post({String url, dynamic body}) async {
    try {
      return await dio.post(url,
          data: body,
          options:
              Options(headers: {'Authorization': 'Bearer ${authStore.jwt}'}));
    } on DioError catch (e) {
      _handleException(e);
    } catch (e) {
      throw BadRequestException();
    }
  }

  Future<dynamic> get({String url}) async {
    try {
      return await dio.get(url,
          options:
              Options(headers: {'Authorization': 'Bearer ${authStore.jwt}'}));
    } on DioError catch (e) {
      _handleException(e);
    } catch (e) {
      throw BadRequestException();
    }
  }

  _handleException(DioError e) {
    if (e.response != null) {
      print(e.response.data);
      if (e.response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw BadRequestException(message: e.response.data);
      }
    } else {
      print(e.message);
      throw BadRequestException();
    }
  }
}
