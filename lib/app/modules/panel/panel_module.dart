import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/modules/panel/controller/panel_controller.dart';
import 'package:jober/app/modules/panel/page/panel_page.dart';

class PanelModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PanelController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PanelPage()),
      ];

  static Inject get to => Inject<PanelModule>.of();
}
