import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/screens/sign_up/email_password_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/screens/sign_up/widgets/text_form_field.dart';
import 'package:jober/bkp/zip_code_screen.dart';
import 'package:jober/utils/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cellPhoneController = TextEditingController();
  final _phoneController = TextEditingController();
  final _webSiteController = TextEditingController();

  var cellPhoneFormatter = new MaskTextInputFormatter(
      mask: '(##) # ####-####', filter: {"#": RegExp(r'[0-9]')});

  var phoneFormatter = new MaskTextInputFormatter(
      mask: '(##) ####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Informe seus contatos',
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
                      controller: _cellPhoneController,
                      hintText: 'Telefone celular',
                      labelBorderText: 'Telefone celular',
                      validationText: 'Telefone inválido',
                      textInputType: TextInputType.number,
                      inputFormatters: [cellPhoneFormatter],
                    ),
                    SizedBox(height: 15),
                    CustomTextFormField(
                      controller: _phoneController,
                      hintText: 'Telefone fixo (Opcional)',
                      labelBorderText: 'Telefone fixo',
                      textInputType: TextInputType.number,
                      inputFormatters: [phoneFormatter],
                    ),
                    SizedBox(height: 15),
                    CustomTextFormField(
                      controller: _webSiteController,
                      hintText: 'WebSite (Opcional)',
                      labelBorderText: 'WebSite',
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
                        builder: (context) => EmailPasswordScreen()));
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
