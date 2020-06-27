// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpController on _SignUpControllerBase, Store {
  final _$passwordValidationAtom =
      Atom(name: '_SignUpControllerBase.passwordValidation');

  @override
  String get passwordValidation {
    _$passwordValidationAtom.reportRead();
    return super.passwordValidation;
  }

  @override
  set passwordValidation(String value) {
    _$passwordValidationAtom.reportWrite(value, super.passwordValidation, () {
      super.passwordValidation = value;
    });
  }

  final _$_SignUpControllerBaseActionController =
      ActionController(name: '_SignUpControllerBase');

  @override
  dynamic handleRadioValueChange(dynamic value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.handleRadioValueChange');
    try {
      return super.handleRadioValueChange(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterJobArea(String value) {
    final _$actionInfo = _$_SignUpControllerBaseActionController.startAction(
        name: '_SignUpControllerBase.filterJobArea');
    try {
      return super.filterJobArea(value);
    } finally {
      _$_SignUpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordValidation: ${passwordValidation}
    ''';
  }
}
