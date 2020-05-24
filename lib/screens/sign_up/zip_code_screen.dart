import 'package:flutter/material.dart';
import 'package:jober/commons/widgets/custom_app_bar.dart';
import 'package:jober/screens/login_screen.dart';
import 'package:jober/screens/sign_up/address_screen.dart';
import 'package:jober/screens/sign_up/name_and_birth_screen.dart';
import 'package:jober/screens/sign_up/widgets/next_button.dart';
import 'package:jober/screens/sign_up/widgets/text_form_field.dart';
import 'package:jober/utils/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ZipCodeScreen extends StatefulWidget {
  @override
  _ZipCodeScreenState createState() => _ZipCodeScreenState();
}

class _ZipCodeScreenState extends State<ZipCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _zipCodeController = TextEditingController();

  var zipCodeFormatter = new MaskTextInputFormatter(
      mask: '##.###-###', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Informe seu CEP',
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
                      controller: _zipCodeController,
                      textInputType: TextInputType.number,
                      labelBorderText: 'CEP',
                      hintText: 'CEP',
                      validationText: 'CEP inválido',
                      inputFormatters: [zipCodeFormatter],
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
                        builder: (context) => AddressScreen()));
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
