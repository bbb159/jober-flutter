import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/shared/utils/constants.dart';
import 'package:jober/app/shared/utils/enums.dart';
import 'package:jober/app/shared/widgets/custom_app_bar.dart';
import 'package:jober/app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:jober/app/modules/sign_up/widgets/next_button.dart';
import 'package:jober/app/modules/sign_up/widgets/text_form_field.dart';

class PersonIdentifierPage extends StatefulWidget {
  @override
  _PersonIdentifierPageState createState() => _PersonIdentifierPageState();
}

class _PersonIdentifierPageState
    extends ModularState<PersonIdentifierPage, SignUpController> {
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
                        text: 'Para começar, nos informe seu ',
                      ),
                      new TextSpan(
                        text: 'CPF, nome e sobrenome.',
                        style: TextStyle(color: kBlueDefaultColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Form(
                key: controller.personIdentifierFormKey,
                autovalidate: controller.personIdentifierAutoValidate,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        controller: controller.personIdentifierController,
                        validationText: 'CPF inválido',
                        hintText: 'CPF',
                        labelBorderText: 'CPF',
                        textInputType: TextInputType.number,
                        colorPattern: ColorPattern.PURPLE,
                        inputFormatters: [controller.cpfFormatter],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        controller: controller.nameController,
                        validationText: 'Nome inválido',
                        hintText: 'Nome',
                        labelBorderText: 'Nome',
                        colorPattern: ColorPattern.PURPLE,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        controller: controller.lastNameController,
                        validationText: 'Sobrenome inválido',
                        hintText: 'Sobrenome',
                        labelBorderText: 'Sobrenome',
                        colorPattern: ColorPattern.PURPLE,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NextButton(
        callback: () {
          if (controller.personIdentifierFormKey.currentState.validate()) {
            controller.fillIdentifier();
          } else {
            setState(() {
              controller.personIdentifierAutoValidate = true;
            });
          }
        },
      ),
    );
  }
}
