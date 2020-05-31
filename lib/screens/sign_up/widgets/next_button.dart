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
              height: 65,
              minWidth: 330,
              child: RaisedButton(
                onPressed: callback,
                color: kBlueDefaultColor,
                child: Text(
                  "Próximo",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
