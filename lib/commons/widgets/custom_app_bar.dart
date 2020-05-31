import 'package:flutter/material.dart';
import 'package:jober/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final Color backIconColor;
  final bool finderWhite;

  CustomAppBar(
      {Key key, this.title, this.appBar, this.backIconColor, this.finderWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),
          children: <TextSpan>[
            new TextSpan(
              text: 'JOBER',
              style: TextStyle(color: kBlueDefaultColor),
            ),
            new TextSpan(
                text: 'FINDER',
                style: TextStyle(
                    color: finderWhite != null
                        ? Colors.white
                        : kPurpleDefaultColor)),
          ],
        ),
      ),
      elevation: 0,
      centerTitle: true,
      leading: new IconButton(
        icon: RawMaterialButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: backIconColor,
            size: 35.0,
          ),
          shape: CircleBorder(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
