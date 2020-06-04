import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/bkp/address_screen.dart';
import 'package:jober/screens/sign_up/use_terms_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/screens/sign_up/widgets/text_form_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Crie uma senha de no mínimo 6 dígitos',
        appBar: AppBar(),
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
                    CustomTextFormField(
                      controller: _passwordController,
                      textInputType: TextInputType.visiblePassword,
                      labelBorderText: 'Crie uma senha',
                      hintText: 'Senha',
                      validationText: 'Senha inválida',
                      obscureText: true,
                    ),
                    SizedBox(height: 15),
                    CustomTextFormField(
                      controller: _passwordConfirmController,
                      textInputType: TextInputType.visiblePassword,
                      labelBorderText: 'Repita sua senha',
                      hintText: 'Repitir senha',
                      validationText: 'Confirmação de senha inválida',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Ao tocar no botão \"pronto\" você aceita e concorda com os Termos de Uso do aplicativo Meu Emprego!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      color: Color.fromRGBO(108, 108, 108, 1),
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Expanded(
              child: NextButton(
                callback: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UseTermsScreen()));
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
