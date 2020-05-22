import 'package:flutter/material.dart';
import 'package:jober/screens/sign_up/person_identifier_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String personChoosed;

  setPersonChoosed(String person) {
    setState(() {
      this.personChoosed = person;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informe se você é Pessoa Física ou Jurídica",
          textAlign: TextAlign.left,
          style: TextStyle(color: Color.fromRGBO(63, 63, 63, 1), fontSize: 14),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: new IconButton(
          icon: RawMaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            fillColor: kPurpleDefaultColor,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buildPersonTypeContainer(
                      imagePath: 'images/signup/physical_person.png',
                      description: "Sou Pessoa Física",
                      personType: "PERSON",
                    ),
                    SizedBox(height: 25),
                    buildPersonTypeContainer(
                      imagePath: 'images/signup/company_person.png',
                      description: "Sou Pessoa Jurídica",
                      personType: "COMPANY",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: NextButton(
                  callback: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PersonIdentifier()));
                  },
                ),
              ),
            ],
          )),
    );
  }

  Widget buildPersonTypeContainer(
      {String imagePath, String description, String personType}) {
    return GestureDetector(
      onTap: () {
        setPersonChoosed(personType);
      },
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: personChoosed == personType
                  ? kPurpleDefaultColor
                  : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 7,
                offset: Offset(5, 3),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
