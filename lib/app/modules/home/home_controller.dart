import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/shared/stores/auth/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AuthStore _authStore;
  _HomeControllerBase(this._authStore);

  signIn() {
    if (_authStore.isLogged) {
      Modular.to.pushNamed('/dashboard');
    } else {
      Modular.to.pushNamed('/sign-in');
    }
  }
}
