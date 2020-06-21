import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/core/utils/constants.dart';
import 'package:jober/app/core/widgets/custom_app_bar.dart';
import 'package:jober/app/core/widgets/custom_raised_button.dart';
import 'package:jober/app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:jober/app/modules/sign_up/models/user_type_enum.dart';
import 'package:jober/app/modules/sign_up/pages/person_identifier_page.dart';
import 'package:jober/app/modules/sign_up/widgets/next_button.dart';

class PersonTypePage extends StatefulWidget {
  @override
  _PersonTypePageState createState() => _PersonTypePageState();
}

class _PersonTypePageState extends State<PersonTypePage> {
  SignUpController signUpController = Modular.get<SignUpController>();

  _setPersonChoosed(index, _) {
    setState(() {
      signUpController.userType =
          index == 0 ? UserType.PERSON : UserType.COMPANY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        backIconColor: kPurpleDefaultColor,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 20, color: kPurpleDefaultColor),
                  children: <TextSpan>[
                    new TextSpan(text: 'Escolha a forma do seu cadastro, '),
                    new TextSpan(
                        text: 'Pessoa Física ',
                        style: TextStyle(color: kBlueDefaultColor)),
                    new TextSpan(text: 'ou '),
                    new TextSpan(
                      text: 'Pessoa Jurídica',
                      style: TextStyle(color: kBlueDefaultColor),
                    ),
                    new TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(onPageChanged: _setPersonChoosed),
              items: <Widget>[
                Container(
                  width: 230,
                  height: 300,
                  child: Image.asset(
                    'images/signup/physical_person.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: 230,
                  height: 300,
                  child: Image.asset(
                    'images/signup/company_person.png',
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            CustomRaisedButton(
              width: 220,
              height: 40,
              bgColor: kPurpleDefaultColor,
              callback: () {},
              text: signUpController.userType == UserType.PERSON
                  ? 'Sou Pessoa Física'
                  : 'Sou Pessoa Jurídica',
              textColor: Colors.white,
              textSize: 16,
              borderRadius: 50,
            ),
            SizedBox(height: 20),
            Container(
              child: Image.asset(
                'images/signup/swipe_hand.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NextButton(
        callback: () {
          String route = signUpController.userType == UserType.PERSON
              ? '/person-identifier'
              : '/company-identifier';
          Modular.link.pushNamed(route);
        },
      ),
    );
  }
}
