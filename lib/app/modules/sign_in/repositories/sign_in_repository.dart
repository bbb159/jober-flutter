import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_request.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_response.dart';
import 'package:jober/app/shared/services/client_http_service.dart';

class SignInRepository {
  ClientHttpService clientHttpService = Modular.get<ClientHttpService>();

  Future<SignInResponse> signIn(SignInRequest request) async {
    print("Signing in...");
    String path = '/authenticate';
    var response =
        await clientHttpService.post(url: path, body: request.toJson());
    return SignInResponse.fromJson(response.data);
  }
}
