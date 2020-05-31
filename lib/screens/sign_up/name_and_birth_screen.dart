import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/screens/sign_in/sign_in.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/screens/sign_up/widgets/text_form_field.dart';
import 'package:jober/screens/sign_up/zip_code_screen.dart';
import 'package:jober/utils/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameBirthScreen extends StatefulWidget {
  @override
  _NameBirthScreenState createState() => _NameBirthScreenState();
}

class _NameBirthScreenState extends State<NameBirthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();

  var dateFormatter = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Digite seu nome completo e sua data de nascimento',
        appBar: AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 9,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    CustomTextFormField(
                      controller: _nameController,
                      labelBorderText: 'Nome Completo',
                      hintText: 'Seu nome completo',
                      validationText: 'Nome inválidio',
                    ),
                    SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: _birthDateController,
                      labelBorderText: 'Data de Nascimento',
                      hintText: 'Sua data de nascimento',
                      textInputType: TextInputType.number,
                      validationText: 'Data de nascimento inválida',
                      inputFormatters: [dateFormatter],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: NextButton(
                callback: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ZipCodeScreen()));
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
