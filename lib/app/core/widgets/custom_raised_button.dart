import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final double width;
  final double height;
  final Color bgColor;
  final VoidCallback callback;
  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight textWeigth;
  final double borderRadius;
  final Color borderColor;

  const CustomRaisedButton(
      {Key key,
      this.width,
      this.height,
      this.bgColor,
      this.callback,
      this.text,
      this.textColor,
      this.textSize,
      this.textWeigth,
      this.borderRadius,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        color: bgColor,
        onPressed: callback,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight: textWeigth,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      ),
    );
  }
}
