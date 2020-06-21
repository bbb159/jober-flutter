import 'package:jober/app/modules/sign_in/model/sign_in_request.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_response.dart';
import 'package:jober/app/modules/sign_in/services/sign_in_service.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase with Store {
  final service = SignInService();

  @observable
  bool _isLoading = false;
  get isLoading => _isLoading;

  @observable
  bool _showError = false;
  get showError => _showError;
  @action
  changeShowError(bool value) => _showError = value;

  String errorText = 'Usuário ou senha inválido';

  @action
  toggleIsLoading(bool value) => _isLoading = value;

  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    SignInResponse response = await service.signIn(signInRequest);
    print(response.toJson());
    return response;
  }
}
