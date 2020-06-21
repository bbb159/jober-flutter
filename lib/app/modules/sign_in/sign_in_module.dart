import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/modules/sign_in/controller/sign_in_controller.dart';
import 'package:jober/app/modules/sign_in/pages/sign_in_page.dart';
import 'package:jober/app/modules/sign_in/services/sign_in_service.dart';

class SignInModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignInController()),
        Bind<SignInService>((i) => SignInService())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SignInPage()),
      ];

  static Inject get to => Inject<SignInModule>.of();
}
