import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/screens/sign_up/widgets/text_form_field.dart';
import 'package:jober/utils/constants.dart';
import 'package:jober/utils/enums.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                              Container(
                                width: 280,
                                height: 50,
                                child: RaisedButton(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  color: kBlueDefaultColor,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen()));
                                  },
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
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