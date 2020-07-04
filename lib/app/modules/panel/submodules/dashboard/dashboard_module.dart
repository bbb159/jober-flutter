import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/modules/panel/submodules/dashboard/dashboard_controller.dart';
import 'package:jober/app/modules/panel/submodules/dashboard/pages/dashboard_page.dart';

class DashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => DashboardController())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DashboardPage()),
      ];

  static Inject get to => Inject<DashboardModule>.of();
}
