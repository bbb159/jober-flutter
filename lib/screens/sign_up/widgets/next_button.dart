import 'package:flutter/material.dart';
import 'package:jober/utils/constants.dart';

class NextButton extends StatelessWidget {
  final VoidCallback callback;

  NextButton({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ButtonTheme(
              height: 50,
              minWidth: 330,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: callback,
                color: kPurpleDefaultColor,
                child: Text(
                  "Próximo",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
