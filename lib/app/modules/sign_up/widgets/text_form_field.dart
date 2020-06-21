import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jober/app/core/utils/constants.dart';
import 'package:jober/app/core/utils/enums.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String validationText;
  final String labelBorderText;
  final TextInputType textInputType;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;
  final ColorPattern colorPattern;

  CustomTextFormField(
      {@required this.controller,
      this.hintText,
      this.labelBorderText,
      this.validationText,
      this.textInputType,
      this.inputFormatters,
      this.obscureText,
      this.colorPattern});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  Color _hintTextColor = Colors.white;
  Color _fillColor = Colors.transparent;
  Color _textColor = Colors.white;
  Color _borderColor = Colors.white;
  Color _errorColor = Colors.red;

  @override
  void initState() {
    super.initState();
    defineColors();
  }

  defineColors() {
    switch (widget.colorPattern) {
      case ColorPattern.WHITE:
        _hintTextColor = kPurpleDefaultColor;
        _fillColor = Colors.white;
        _textColor = kPurpleDefaultColor;
        _borderColor = kPurpleDefaultColor;
        break;

      case ColorPattern.PURPLE:
        _hintTextColor = Colors.white;
        _fillColor = Colors.transparent;
        _textColor = Colors.white;
        _borderColor = Colors.white;
        _errorColor = kBlueDefaultColor;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelBorderText,
        labelStyle: TextStyle(color: _hintTextColor),
        errorStyle: TextStyle(color: _errorColor),
        hintText: widget.hintText,
        hintStyle:
            TextStyle(color: _hintTextColor, fontWeight: FontWeight.w300),
        fillColor: _fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _borderColor),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _borderColor),
          borderRadius: BorderRadius.circular(50.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _errorColor),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _borderColor),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      keyboardType: widget.textInputType ?? TextInputType.text,
      style: TextStyle(color: _textColor),
      validator: widget.validationText != null
          ? (text) {
              if (text.isEmpty) {
                return widget.validationText ?? 'Campo inválido';
              }
              return null;
            }
          : (text) {
              return null;
            },
      inputFormatters: widget.inputFormatters ?? [],
      obscureText: widget.obscureText ?? false,
    );
  }
}
