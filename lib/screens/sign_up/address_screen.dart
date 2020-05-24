import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/screens/sign_up/contacts_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/screens/sign_up/widgets/text_form_field.dart';
import 'package:jober/screens/sign_up/zip_code_screen.dart';
import 'package:jober/utils/constants.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _numberController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Confirme seu endereço e corrija caso estiver errado',
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
                          controller: _addressController,
                          hintText: 'Endereço',
                          labelBorderText: 'Endereço',
                        ),
                        SizedBox(height: 15),
                        CustomTextFormField(
                          controller: _numberController,
                          hintText: 'Número',
                          labelBorderText: 'Número',
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(height: 15),
                        CustomTextFormField(
                          controller: _neighborhoodController,
                          hintText: 'Bairro',
                          labelBorderText: 'Bairro',
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 7,
                              child: CustomTextFormField(
                                controller: _cityController,
                                hintText: 'Cidade',
                                labelBorderText: 'Cidade',
                              ),
                            ),
                            SizedBox(width: 15),
                            Flexible(
                              flex: 3,
                              child: CustomTextFormField(
                                controller: _stateController,
                                hintText: 'Estado',
                                labelBorderText: 'Estado',
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              Flexible(
                flex: 1,
                child: NextButton(
                  callback: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContactsScreen()));
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
