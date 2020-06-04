import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jober/screens/sign_in/sign_in.dart';
import 'package:jober/utils/constants.dart';

class SignUpSucessfulScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Cadastro realizado com sucesso!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                color: kPurpleDefaultColor,
              ),
            ),
            Image.asset(
              'images/signup/sign_up_successfull.png',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ButtonTheme(
                  height: 60,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {},
                    color: kBlueDefaultColor,
                    child: Text(
                      "Continuar para o aplicativo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ButtonTheme(
                  height: 60,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: kPurpleDefaultColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInScreen()));
                    },
                    color: Colors.white,
                    child: Text(
                      "Fazer Login",
                      style: TextStyle(
                          color: kPurpleDefaultColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
