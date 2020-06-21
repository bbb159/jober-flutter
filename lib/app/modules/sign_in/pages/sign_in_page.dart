import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/core/utils/constants.dart';
import 'package:jober/app/core/utils/enums.dart';
import 'package:jober/app/core/widgets/custom_app_bar.dart';
import 'package:jober/app/core/widgets/custom_raised_button.dart';
import 'package:jober/app/modules/sign_in/controller/sign_in_controller.dart';
import 'package:jober/app/modules/sign_up/widgets/text_form_field.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInController signInController = Modular.get<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backIconColor: kPurpleDefaultColor,
      ),
      body: Container(
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/signup/home_image.png',
                        width: 273,
                        height: 245,
                      ),
                      SizedBox(height: 80),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Form(
                          key: signInController.formKey,
                          autovalidate: signInController.autoValidate,
                          child: Column(
                            children: <Widget>[
                              CustomTextFormField(
                                controller: signInController.emailController,
                                hintText: 'E-mail',
                                labelBorderText: 'E-mail',
                                colorPattern: ColorPattern.WHITE,
                                validationText: 'E-mail inválido',
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 30),
                              CustomTextFormField(
                                controller: signInController.passwordController,
                                hintText: 'Senha de acesso',
                                labelBorderText: 'Senha de acesso',
                                colorPattern: ColorPattern.WHITE,
                                validationText: 'Senha inválida',
                                obscureText: true,
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 20,
                                  child: signInController.showError
                                      ? Text(
                                          signInController.errorText,
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 16),
                                        )
                                      : Container(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                kPurpleDefaultColor,
                                kPurpleLightDefaultColor
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 60),
                              Observer(builder: (_) {
                                return Container(
                                  child: signInController.isLoading != null &&
                                          signInController.isLoading == true
                                      ? CircularProgressIndicator()
                                      : CustomRaisedButton(
                                          width: 280,
                                          height: 50,
                                          bgColor: kBlueDefaultColor,
                                          callback: () async {
                                            if (signInController
                                                .formKey.currentState
                                                .validate()) {
                                              await signInController.signIn();
                                            } else {
                                              setState(() {
                                                signInController.autoValidate =
                                                    true;
                                              });
                                            }
                                          },
                                          text: 'Entrar',
                                          textColor: Colors.white,
                                          textSize: 16,
                                          textWeigth: FontWeight.w300,
                                          borderRadius: 50,
                                        ),
                                );
                              }),
                              SizedBox(height: 20),
                              Container(
                                child: Text(
                                  'Problemas para acessar?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
