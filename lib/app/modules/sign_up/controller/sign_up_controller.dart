import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jober/app/shared/stores/auth/auth_store.dart';
import 'package:jober/app/modules/sign_up/models/user_type_enum.dart';
import 'package:jober/app/modules/sign_up/services/sign_up_service.dart';
import 'package:jober/app/modules/sign_up/stores/sign_up_store.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase extends Disposable with Store {
  final AuthStore _authStore;
  final SignUpStore _signUpStore;
  final SignUpService _signUpService;
  _SignUpControllerBase(
      this._authStore, this._signUpStore, this._signUpService);

  final personIdentifierFormKey = GlobalKey<FormState>();
  final personIdentifierController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  bool personIdentifierAutoValidate = false;

  final companyIdentifierFormKey = GlobalKey<FormState>();
  final companyRegisterNumberController = TextEditingController();
  final companyNameController = TextEditingController();
  final companyTradingNameController = TextEditingController();
  bool companyIdentifierAutoValidate = false;

  final emailPasswordFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool emailPasswordAutoValidate = false;

  final searchAreaController = TextEditingController();

  var cpfFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var cnpjFormatter = new MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});

  @observable
  String passwordValidation;

  get userType => _signUpStore.userType;
  set userType(UserType value) => _signUpStore.userType = value;

  get areasFiltered => _signUpStore.areasFiltered;
  get radioValue => _signUpStore.radioValue;

  get signUpRequest => _signUpStore.signUpRequest;

  @action
  handleRadioValueChange(value) {
    _signUpStore.radioValue = value;
  }

  @action
  filterJobArea(String value) {
    print(_authStore.isLogged);
    print(_authStore.authModel);
    if (value != '') {
      _signUpStore.areasFiltered.clear();
      _signUpStore.areas
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList()
          .forEach((element) {
        _signUpStore.areasFiltered.add(element);
      });
    } else {
      _signUpStore.areasFiltered.clear();
      _signUpStore.areas.forEach((element) {
        _signUpStore.areasFiltered.add(element);
      });
    }
  }

  fillIdentifier() {
    if (userType == UserType.PERSON) {
      signUpRequest.federalId = personIdentifierController.text;
      signUpRequest.firstName = nameController.text;
      signUpRequest.lastName = lastNameController.text;
    } else if (userType == UserType.COMPANY) {
      signUpRequest.companyRegisterNumber =
          companyRegisterNumberController.text;
      signUpRequest.companyName = companyNameController.text;
      signUpRequest.companyTradingName = companyTradingNameController.text;
    }
    Modular.link.pushNamed('/job-area');
  }

  fillJobArea() {
    signUpRequest.jobArea = _signUpStore.radioValue;
    Modular.link.pushNamed('/email-password');
  }

  fillAuthInfo() {
    if (passwordController.text != confirmPasswordController.text) {
      passwordValidation = 'Confirmação de senha inválida.';
    } else {
      passwordValidation = null;
      signUpRequest.email = emailController.text;
      signUpRequest.password = passwordController.text;
      confirmSignUp();
    }
  }

  confirmSignUp() async {
    //await _signUpService.signUp(signUpRequest, userType);
    Modular.link.pushNamedAndRemoveUntil(
        '/sign-up-sucessfull', ModalRoute.withName('/'));
  }

  @override
  void dispose() {
    personIdentifierController.dispose();
    nameController.dispose();
    lastNameController.dispose();
    companyRegisterNumberController.dispose();
    companyNameController.dispose();
    companyTradingNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    searchAreaController.dispose();
  }
}
