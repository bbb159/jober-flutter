import 'package:flutter/material.dart';
import 'package:jober/utils/constants.dart';

class NextButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  NextButton({@required this.callback, this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 65,
      minWidth: 330,
      child: RaisedButton(
        onPressed: callback,
        color: kBlueDefaultColor,
        child: Text(
          text ?? 'Próximo',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
