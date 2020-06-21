import 'package:flutter/material.dart';
import 'package:jober/app/core/utils/constants.dart';
import 'package:jober/app/core/utils/enums.dart';
import 'package:jober/app/core/widgets/custom_app_bar.dart';
import 'package:jober/app/modules/sign_up/pages/job_area_page.dart';
import 'package:jober/app/modules/sign_up/widgets/next_button.dart';
import 'package:jober/app/modules/sign_up/widgets/text_form_field.dart';

class PersonIdentifierPage extends StatefulWidget {
  @override
  _PersonIdentifierPageState createState() => _PersonIdentifierPageState();
}

class _PersonIdentifierPageState extends State<PersonIdentifierPage> {
  final _formKey = GlobalKey<FormState>();
  final _personIdentifierController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  bool _autoValidate = false;

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
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        controller: _personIdentifierController,
                        validationText: 'CPF inválido',
                        hintText: 'CPF',
                        labelBorderText: 'CPF',
                        textInputType: TextInputType.number,
                        colorPattern: ColorPattern.PURPLE,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        controller: _nameController,
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
                        controller: _lastNameController,
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
          if (_formKey.currentState.validate()) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => JobAreaPage()));
          } else {
            setState(() {
              _autoValidate = true;
            });
          }
        },
      ),
    );
  }
}
