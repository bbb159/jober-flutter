import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_raised_button.dart';
import 'package:jober/screens/sign_in/sign_in.dart';
import 'package:jober/screens/sign_up/person_type_screen.dart';
import 'package:jober/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/signup/home_image.png',
              width: 273,
              height: 245,
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Text(
                    'Bem vindo ao JobFinder',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: kPurpleDefaultColor),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Encontre trabalhos temporários, ofereça seu serviço como moeda de troca e faça uma renda extra.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 140),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kPurpleDefaultColor, kPurpleLightDefaultColor],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    CustomRaisedButton(
                      width: 280,
                      height: 50,
                      bgColor: kBlueDefaultColor,
                      callback: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                      },
                      text: 'Entrar',
                      textColor: Colors.white,
                      textSize: 16,
                      textWeigth: FontWeight.w300,
                      borderRadius: 50,
                    ),
                    SizedBox(height: 15),
                    CustomRaisedButton(
                      width: 280,
                      height: 50,
                      bgColor: Colors.white,
                      callback: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PersonTypeScreen()));
                      },
                      text: 'Cadastrar',
                      textColor: Colors.black,
                      textSize: 16,
                      textWeigth: FontWeight.w300,
                      borderRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
