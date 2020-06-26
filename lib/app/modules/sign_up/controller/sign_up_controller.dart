import 'package:flutter/cupertino.dart';
import 'package:jober/app/modules/shared/auth/auth_store.dart';
import 'package:jober/app/modules/sign_up/models/user_type_enum.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final AuthStore _authStore;
  _SignUpControllerBase(this._authStore);

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

  ObservableList<String> areas = ObservableList<String>.of([
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
  ]);

  ObservableList<String> areasFiltered = ObservableList<String>.of([
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
  ]);

  @observable
  String radioValue = 'Administração';

  @action
  handleRadioValueChange(value) {
    radioValue = value;
  }

  @action
  filterJobArea(String value) {
    print(_authStore.isLogged);
    print(_authStore.authModel);
    if (value != '') {
      areasFiltered.clear();
      areas
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList()
          .forEach((element) {
        areasFiltered.add(element);
      });
    } else {
      areasFiltered.clear();
      areas.forEach((element) {
        areasFiltered.add(element);
      });
    }
  }

  final emailPasswordFormKey = GlobalKey<FormState>();
  final emailPasswordController = TextEditingController();
  final emailPassword2Controller = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool emailPasswordAutoValidate = false;
}
