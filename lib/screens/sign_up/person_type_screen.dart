import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/commons/widgets/custom_raised_button.dart';
import 'package:jober/screens/sign_up/person_identifier_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/utils/constants.dart';

class PersonTypeScreen extends StatefulWidget {
  @override
  _PersonTypeScreenState createState() => _PersonTypeScreenState();
}

class _PersonTypeScreenState extends State<PersonTypeScreen> {
  String personChoosed = 'PHYSICAL';

  _setPersonChoosed(index, reason) {
    setState(() {
      this.personChoosed = index == 0 ? 'PHYSICAL' : 'COMPANY';
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
              text: personChoosed == 'PHYSICAL'
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PersonIdentifierScreen()));
        },
      ),
    );
  }
}
