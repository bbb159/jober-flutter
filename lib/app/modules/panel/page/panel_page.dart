import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/modules/panel/controller/panel_controller.dart';
import 'package:jober/app/modules/panel/submodules/dashboard/dashboard_module.dart';
import 'package:jober/app/shared/utils/constants.dart';

class PanelPage extends StatefulWidget {
  @override
  _PanelPageState createState() => _PanelPageState();
}

class _PanelPageState extends ModularState<PanelPage, PanelController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: <Widget>[
          RouterOutlet(
            module: DashboardModule(),
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.orange,
          ),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: controller.pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: controller.pageViewController?.page?.round() ?? 0,
              onTap: (index) {
                controller.pageViewController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                    backgroundColor: kBlueDefaultColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.content_paste),
                    title: Text('Abrir vaga'),
                    backgroundColor: kBlueDefaultColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.view_carousel),
                    title: Text('Vagas'),
                    backgroundColor: kBlueDefaultColor)
              ],
            );
          }),
    );
  }
}
