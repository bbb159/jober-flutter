import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jober/app/core/utils/constants.dart';
import 'package:jober/app/core/utils/enums.dart';
import 'package:jober/app/core/widgets/custom_app_bar.dart';
import 'package:jober/app/core/widgets/custom_raised_button.dart';
import 'package:jober/app/modules/dashboard/pages/dashboard_page.dart';
import 'package:jober/app/modules/sign_in/controller/sign_in_controller.dart';
import 'package:jober/app/modules/sign_in/model/sign_in_request.dart';
import 'package:jober/app/modules/sign_up/widgets/text_form_field.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final controller = SignInController();

  bool _autoValidate = false;

  buildRequest() {
    return SignInRequest(
        email: _emailController.text, password: _passwordController.text);
  }

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
                          key: _formKey,
                          autovalidate: _autoValidate,
                          child: Column(
                            children: <Widget>[
                              CustomTextFormField(
                                controller: _emailController,
                                hintText: 'E-mail',
                                labelBorderText: 'E-mail',
                                colorPattern: ColorPattern.WHITE,
                                validationText: 'E-mail inválido',
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 30),
                              CustomTextFormField(
                                controller: _passwordController,
                                hintText: 'Senha de acesso',
                                labelBorderText: 'Senha de acesso',
                                colorPattern: ColorPattern.WHITE,
                                validationText: 'Senha inválida',
                                obscureText: true,
                              ),
                              SizedBox(height: 30),
                              controller.showError
                                  ? Text(
                                      controller.errorText,
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 16),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
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
                                  child: controller.isLoading != null &&
                                          controller.isLoading == true
                                      ? CircularProgressIndicator()
                                      : CustomRaisedButton(
                                          width: 280,
                                          height: 50,
                                          bgColor: kBlueDefaultColor,
                                          callback: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              try {
                                                controller
                                                    .changeShowError(false);
                                                controller
                                                    .toggleIsLoading(true);
                                                await controller
                                                    .signIn(buildRequest());
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DashboardPage()));
                                              } catch (e) {
                                                controller
                                                    .changeShowError(true);
                                              } finally {
                                                controller
                                                    .toggleIsLoading(false);
                                              }
                                            } else {
                                              setState(() {
                                                _autoValidate = true;
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
