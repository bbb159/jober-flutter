import 'package:flutter/material.dart';
import 'package:jober/screens/login_screen.dart';
import 'package:jober/screens/sign_up/name_and_birth_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/utils/constants.dart';

class PersonIdentifier extends StatefulWidget {
  @override
  _PersonIdentifierState createState() => _PersonIdentifierState();
}

class _PersonIdentifierState extends State<PersonIdentifier> {
  final _formKey = GlobalKey<FormState>();
  final _personIdentifierController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Digite o número do seu CPF",
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
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _personIdentifierController,
                  decoration: InputDecoration(
                    hintText: 'CPF',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: kPurpleDefaultColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (text) {
                    if (text.isEmpty) {
                      return 'Identificador inválido';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Expanded(
              child: NextButton(
                callback: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NameBirthScreen()));
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
