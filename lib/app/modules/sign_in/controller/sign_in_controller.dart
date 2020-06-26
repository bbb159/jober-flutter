import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/modules/shared/auth/auth_store.dart';
import 'package:jober/app/modules/shared/models/auth_model.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_request.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_response.dart';
import 'package:jober/app/modules/sign_in/services/sign_in_service.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase with Store {
  final AuthStore _authStore;
  _SignInControllerBase(this._authStore);

  final service = SignInService();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool autoValidate = false;

  @observable
  bool isLoading = false;

  @observable
  bool showError = false;

  String errorText = '*Usuário e/ou senha inválido';

  Future<SignInResponse> signIn() async {
    isLoading = true;
    showError = false;
    try {
      SignInRequest signInRequest = SignInRequest(
          email: emailController.text, password: passwordController.text);
      SignInResponse response = await service.signIn(signInRequest);
      updateAuthStore(signInRequest.email, response.jwt);
      Modular.to.pushNamed('/dashboard');
    } catch (e) {
      showError = true;
    } finally {
      isLoading = false;
    }
  }

  void updateAuthStore(String email, String jwt) {
    _authStore.setAuth(AuthModel(email, jwt));
  }
}
