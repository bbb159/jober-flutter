import 'package:flutter/material.dart';
import 'package:jober/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;

  CustomAppBar({Key key, this.title, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(color: Color.fromRGBO(63, 63, 63, 1), fontSize: 14),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      leading: new IconButton(
        icon: RawMaterialButton(
          onPressed: () => Navigator.of(context).pop(),
          fillColor: kPurpleDefaultColor,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
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
