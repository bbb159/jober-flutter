import 'package:flutter/material.dart';
import 'package:jober/app/core/utils/constants.dart';

class DrawerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final Color backgroundColor;

  DrawerAppBar({Key key, this.appBar, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: new IconThemeData(color: Colors.white),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10, top: 10),
          child: InkWell(
            onTap: () {},
            child: new Container(
              width: 45,
              height: 45,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: kBlueDefaultColor,
              ),
              child: new Icon(Icons.person_outline,
                  size: 40.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
