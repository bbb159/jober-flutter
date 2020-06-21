import 'package:flutter/cupertino.dart';
import 'package:jober/app/modules/sign_up/models/user_type_enum.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final personIdentifierFormKey = GlobalKey<FormState>();
  final personIdentifierController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();

  final companyIdentifierFormKey = GlobalKey<FormState>();
  final companyRegisterNumberController = TextEditingController();
  final companyNameController = TextEditingController();
  final companTradingNameController = TextEditingController();

  final searchAreaController = TextEditingController();

  bool personIdentifierAutoValidate = false;

  var cpfFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var cnpjFormatter = new MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});

  UserType userType = UserType.PERSON;

  List<String> areas = [
    'Administração',
    'Direito',
    'Construção Civil',
    'Engenheria e Arquitetura',
    'Design',
    'Gastronomia',
    'Desenho Técnico',
    'Padeiro',
    'Pedreiro',
    'Faxineira',
    'Porteiro'
  ];

  List<String> areasFiltered = [
    'Administração',
    'Direito',
    'Construção Civil',
    'Engenheria e Arquitetura',
    'Design',
    'Gastronomia',
    'Desenho Técnico',
    'Padeiro',
    'Pedreiro',
    'Faxineira',
    'Porteiro'
  ];

  String radioValue = 'Administração';

  handleRadioValueChange(value) {
    radioValue = value;
  }

  filterJobArea(String value) {
    if (value != '') {
      areasFiltered = areas
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      areasFiltered = areas;
    }
  }
}
