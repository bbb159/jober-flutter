import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/screens/sign_in/sign_in.dart';
import 'package:jober/screens/sign_up/name_and_birth_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/screens/sign_up/widgets/text_form_field.dart';
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
      appBar: CustomAppBar(
        appBar: AppBar(),
        backIconColor: Colors.white,
        finderWhite: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 6,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    CustomTextFormField(
                      controller: _personIdentifierController,
                      validationText: 'CPF inválido',
                      hintText: 'CPF',
                      labelBorderText: 'CPF',
                      textInputType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            NextButton(
              callback: () {
                if (_formKey.currentState.validate()) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NameBirthScreen()));
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
