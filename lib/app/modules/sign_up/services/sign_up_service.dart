import 'package:dio/dio.dart';
import 'package:jober/app/modules/sign_up/models/sign_up_request_model.dart';
import 'package:jober/app/modules/sign_up/models/user_type_enum.dart';

class SignUpService {
  final Dio dio = Dio();
  final String url = 'https://warm-retreat-54583.herokuapp.com';

  Future<void> signUp(SignUpRequestModel request, UserType userType) async {
    String path = url +
        (userType == UserType.COMPANY
            ? '/company-profile/register'
            : '/person-profile/register');
    await dio.post(path, data: request.toJson());
  }
}
