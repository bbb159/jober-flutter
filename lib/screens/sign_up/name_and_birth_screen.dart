import 'package:flutter/material.dart';
import 'package:jober/screens/login_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/utils/constants.dart';

class NameBirthScreen extends StatefulWidget {
  @override
  _NameBirthScreenState createState() => _NameBirthScreenState();
}

class _NameBirthScreenState extends State<NameBirthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();

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
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Seu nome completo',
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
                      keyboardType: TextInputType.text,
                      validator: (text) {
                        if (text.isEmpty) {
                          return 'Nome inválido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _birthDateController,
                      decoration: InputDecoration(
                        hintText: 'Sua data de nascimento',
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
                      keyboardType: TextInputType.text,
                      validator: (text) {
                        if (text.isEmpty) {
                          return 'Data inválida';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: NextButton(
                callback: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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
