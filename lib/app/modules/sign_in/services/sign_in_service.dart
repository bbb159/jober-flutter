import 'package:dio/dio.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_request.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_response.dart';

class SignInService {
  final Dio dio = Dio();
  final String url = 'https://warm-retreat-54583.herokuapp.com';

  Future<SignInResponse> signIn(SignInRequest request) async {
    String path = url + '/authenticate';
    //try {
    var response = await dio.post(path, data: request.toJson());
    return SignInResponse.fromJson(response.data);
    //} catch (e) {
    //throw new Exception(e);
    //}
  }
}
