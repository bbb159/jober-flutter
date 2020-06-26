import 'package:jober/app/modules/dashboard/dashboard_module.dart';
import 'package:jober/app/modules/shared/auth/auth_store.dart';
import 'package:jober/app/modules/sign_in/sign_in_module.dart';
import 'package:jober/app/modules/sign_up/sign_up_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:jober/app/app_widget.dart';
import 'package:jober/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthStore()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/sign-in', module: SignInModule()),
        Router('/sign-up', module: SignUpModule()),
        Router('/dashboard', module: DashboardModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
