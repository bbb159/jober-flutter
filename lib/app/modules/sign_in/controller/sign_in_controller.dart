import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/shared/services/exceptions/app_exception.dart';
import 'package:jober/app/shared/stores/auth/auth_store.dart';
import 'package:jober/app/shared/models/auth_model.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_request.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_response.dart';
import 'package:jober/app/modules/sign_in/repositories/sign_in_repository.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase extends Disposable with Store {
  final AuthStore _authStore;
  _SignInControllerBase(this._authStore);

  final repository = SignInRepository();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool autoValidate = false;

  @observable
  bool isLoading = false;

  @observable
  bool showError = false;

  String errorText;

  Future<SignInResponse> signIn() async {
    isLoading = true;
    showError = false;
    try {
      SignInRequest signInRequest = SignInRequest(
          email: emailController.text, password: passwordController.text);
      SignInResponse response = await repository.signIn(signInRequest);
      updateAuthStore(signInRequest.email, response.jwt);
      Modular.to.pushReplacementNamed('/dashboard');
    } on AppException catch (e) {
      showError = true;
      errorText = e.toString();
    } finally {
      isLoading = false;
    }
  }

  void updateAuthStore(String email, String jwt) {
    _authStore.setAuth(AuthModel(email, jwt));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
