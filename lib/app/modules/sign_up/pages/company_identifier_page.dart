import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/shared/utils/constants.dart';
import 'package:jober/app/shared/utils/enums.dart';
import 'package:jober/app/shared/widgets/custom_app_bar.dart';
import 'package:jober/app/modules/sign_up/controller/sign_up_controller.dart';
import 'package:jober/app/modules/sign_up/widgets/next_button.dart';
import 'package:jober/app/modules/sign_up/widgets/text_form_field.dart';

class CompanyIdentifierPage extends StatefulWidget {
  @override
  _CompanyIdentifierPageState createState() => _CompanyIdentifierPageState();
}

class _CompanyIdentifierPageState
    extends ModularState<CompanyIdentifierPage, SignUpController> {
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
                        text: 'CNPJ, Razão Social e Nome Fantasia ',
                        style: TextStyle(color: kBlueDefaultColor),
                      ),
                      new TextSpan(
                        text: 'da sua empresa.',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Form(
                key: controller.companyIdentifierFormKey,
                autovalidate: controller.companyIdentifierAutoValidate,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        controller: controller.companyRegisterNumberController,
                        validationText: 'CNPJ inválido',
                        hintText: 'CNPJ',
                        labelBorderText: 'CNPJ',
                        textInputType: TextInputType.number,
                        colorPattern: ColorPattern.PURPLE,
                        inputFormatters: [controller.cnpjFormatter],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        controller: controller.companyNameController,
                        validationText: 'Razão Social inválida',
                        hintText: 'Razão Social',
                        labelBorderText: 'Razão Social',
                        colorPattern: ColorPattern.PURPLE,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        controller: controller.companyTradingNameController,
                        validationText: 'Nome Fantasia inválido',
                        hintText: 'Nome Fantasia',
                        labelBorderText: 'Nome Fantasia',
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
          if (controller.companyIdentifierFormKey.currentState.validate()) {
            controller.fillIdentifier();
          } else {
            setState(() {
              controller.companyIdentifierAutoValidate = true;
            });
          }
        },
      ),
    );
  }
}
