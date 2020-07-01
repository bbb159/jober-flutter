import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/shared/stores/auth/auth_store.dart';
import 'package:jober/app/modules/sign_in/controller/sign_in_controller.dart';
import 'package:jober/app/modules/sign_in/pages/sign_in_page.dart';
import 'package:jober/app/modules/sign_in/repositories/sign_in_repository.dart';

class SignInModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignInController(i.get<AuthStore>())),
        Bind<SignInRepository>((i) => SignInRepository()),

        //stores
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SignInPage()),
      ];

  static Inject get to => Inject<SignInModule>.of();
}
