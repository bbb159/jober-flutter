import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/shared/utils/constants.dart';
import 'package:jober/app/shared/utils/enums.dart';
import 'package:jober/app/shared/widgets/custom_app_bar.dart';
import 'package:jober/app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:jober/app/modules/sign_up/pages/use_terms_page.dart';
import 'package:jober/app/modules/sign_up/widgets/next_button.dart';
import 'package:jober/app/modules/sign_up/widgets/text_form_field.dart';

class EmailPasswordPage extends StatefulWidget {
  @override
  _EmailPasswordPageState createState() => _EmailPasswordPageState();
}

class _EmailPasswordPageState
    extends ModularState<EmailPasswordPage, SignUpController> {
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
              Column(
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
                            text:
                                'Para finalizar, informe seu e-mail e cria uma ',
                          ),
                          new TextSpan(
                              text: 'senha de acesso.',
                              style: TextStyle(color: kBlueDefaultColor)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: controller.emailPasswordFormKey,
                    autovalidate: controller.emailPasswordAutoValidate,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            controller: controller.emailController,
                            validationText: 'E-mail inválido',
                            hintText: 'E-mail',
                            labelBorderText: 'E-mail',
                            colorPattern: ColorPattern.PURPLE,
                            textInputType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            controller: controller.passwordController,
                            validationText: 'Senha inválida',
                            hintText: 'Crie uma senha',
                            labelBorderText: 'Crie uma senha',
                            colorPattern: ColorPattern.PURPLE,
                            obscureText: true,
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Observer(builder: (_) {
                            return CustomTextFormField(
                              controller: controller.confirmPasswordController,
                              validationText: 'Confirmação de senha inválida',
                              hintText: 'Repita sua senha',
                              labelBorderText: 'Repita sua senha',
                              colorPattern: ColorPattern.PURPLE,
                              obscureText: true,
                              errorValidation: controller.passwordValidation,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 55),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                            text:
                                'Ao tocar no botão "Finalizar", você aceita e concorda com os ',
                          ),
                          new TextSpan(
                              text: 'Termos de Uso ',
                              style: TextStyle(
                                  color: kBlueDefaultColor,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => UseTermsPage()))),
                          new TextSpan(
                            text: 'do aplicativo JOBFINDER.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NextButton(
        text: 'Finalizar',
        callback: () {
          if (controller.emailPasswordFormKey.currentState.validate()) {
            controller.fillAuthInfo();
          } else {
            setState(() {
              controller.emailPasswordAutoValidate = true;
            });
          }
        },
      ),
    );
  }
}
