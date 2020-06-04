import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jober/utils/constants.dart';
import 'package:jober/utils/enums.dart';

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
