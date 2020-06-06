import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_raised_button.dart';
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
                CustomRaisedButton(
                  width: 200,
                  height: 60,
                  bgColor: kBlueDefaultColor,
                  callback: () {},
                  text: 'Continuar para o aplicativo',
                  textColor: Colors.white,
                  textSize: 18,
                  textWeigth: FontWeight.w300,
                  borderRadius: 50,
                ),
                SizedBox(height: 15),
                CustomRaisedButton(
                  width: 200,
                  height: 60,
                  bgColor: Colors.white,
                  callback: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen()));
                  },
                  text: 'Fazer Login',
                  textColor: kPurpleDefaultColor,
                  textSize: 18,
                  textWeigth: FontWeight.w300,
                  borderColor: kPurpleDefaultColor,
                  borderRadius: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
