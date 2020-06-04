import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/screens/sign_up/person_identifier_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/utils/constants.dart';

class PersonTypeScreen extends StatefulWidget {
  @override
  _PersonTypeScreenState createState() => _PersonTypeScreenState();
}

class _PersonTypeScreenState extends State<PersonTypeScreen> {
  String personChoosed;

  setPersonChoosed(String person) {
    setState(() {
      this.personChoosed = person;
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
            GestureDetector(
              onPanUpdate: (dis) {
                if (dis.delta.dx > 20) {
                  setState(() {
                    this.personChoosed =
                        personChoosed == 'PHYSICAL' ? 'COMPANY' : 'PHYSICAL';
                  });
                }
                if (dis.delta.dx < -20) {
                  setState(() {
                    this.personChoosed =
                        personChoosed == 'PHYSICAL' ? 'COMPANY' : 'PHYSICAL';
                  });
                }
              },
              child: Column(
                children: <Widget>[
                  Container(
                    height: 320,
                    child: Stack(
                      children: buildStack(),
                    ),
                  ),
                  SizedBox(height: 30),
                  ButtonTheme(
                    height: 40,
                    minWidth: 220,
                    child: RaisedButton(
                      onPressed: () {},
                      color: kPurpleDefaultColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        personChoosed == 'PHYSICAL'
                            ? 'Sou Pessoa Física'
                            : 'Sou Pessoa Jurídica',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
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

  Widget buildPersonTypeContainer({String imagePath, String personType}) {
    return Container(
      width: 230,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }

  List<Widget> buildStack() {
    Widget physicalType = Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: buildPersonTypeContainer(
        imagePath: 'images/signup/company_person.png',
        personType: "COMPANY",
      ),
    );
    Widget companyType = Container(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: buildPersonTypeContainer(
        imagePath: 'images/signup/physical_person.png',
        personType: "PERSON",
      ),
    );
    return [
      Positioned(
        right: 30,
        top: 30,
        child: personChoosed == 'PHYSICAL' ? physicalType : companyType,
      ),
      personChoosed == 'PHYSICAL' ? companyType : physicalType,
    ];
  }
}
