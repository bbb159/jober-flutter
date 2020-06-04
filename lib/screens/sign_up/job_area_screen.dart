import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/screens/sign_up/email_password_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/utils/constants.dart';

class JobAreaScreen extends StatefulWidget {
  @override
  _JobAreaScreenState createState() => _JobAreaScreenState();
}

class _JobAreaScreenState extends State<JobAreaScreen> {
  List<String> areas = [
    'Administração',
    'Direito',
    'Construção Civil',
    'Engenheria e Arquitetura',
    'Design',
    'Gastronomia',
    'Desenho Técnico',
    'Padeiro',
    'Pedreiro',
    'Faxineira',
    'Porteiro'
  ];

  String _radioValue = 'Administração';

  final _searchAreaController = TextEditingController();

  _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        finderWhite: true,
        backIconColor: Colors.white,
        backgroundColor: kPurpleDefaultColor,
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPurpleDefaultColor, kPurpleLightDefaultColor],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 55),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'Agora selecione sua ',
                      ),
                      new TextSpan(
                        text: 'área de trabalho.',
                        style: TextStyle(color: kBlueDefaultColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: new Card(
                  color: Color.fromRGBO(91, 0, 183, 1),
                  child: new ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.search,
                      color: Colors.white70,
                    ),
                    title: new TextField(
                      controller: _searchAreaController,
                      decoration: new InputDecoration(
                        hintText: 'Filtre por área',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.white70),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(91, 0, 183, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: SizedBox(
                    height: 350,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: buildItems(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NextButton(
        callback: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EmailPasswordScreen()));
        },
      ),
    );
  }

  List<Widget> buildItems() {
    return areas
        .map((area) => new RadioListTile(
              activeColor: Colors.white,
              groupValue: _radioValue,
              title: Text(
                area,
                style: TextStyle(
                  color: area == _radioValue ? Colors.white70 : Colors.white30,
                ),
              ),
              value: area,
              onChanged: _handleRadioValueChange,
            ))
        .toList();
  }
}
