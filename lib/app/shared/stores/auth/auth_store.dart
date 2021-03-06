import 'package:jober/app/shared/models/auth_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  AuthModel authModel;

  @action
  setAuth(AuthModel value) => authModel = value;

  @computed
  bool get isLogged =>
      authModel != null && authModel.email != null && authModel.jwt != null;

  String get jwt => authModel != null ? authModel.jwt : '';
}
