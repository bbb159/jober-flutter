import 'package:flutter/material.dart';
import 'package:jober/utils/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final controller;
  final hintText;
  final hintTextColor;
  final validationText;
  final labelBorderText;
  final textInputType;
  final inputFormatters;
  final obscureText;
  final fillColor;
  final textColor;

  CustomTextFormField({
    @required this.controller,
    this.hintText,
    this.hintTextColor,
    this.fillColor,
    this.labelBorderText,
    this.validationText,
    this.textInputType,
    this.inputFormatters,
    this.obscureText,
    this.textColor,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelBorderText,
        hintText: widget.hintText,
        hintStyle:
            TextStyle(color: widget.hintTextColor, fontWeight: FontWeight.w300),
        fillColor: widget.fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPurpleDefaultColor),
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPurpleDefaultColor),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      keyboardType: widget.textInputType ?? TextInputType.text,
      style: TextStyle(color: widget.textColor),
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
