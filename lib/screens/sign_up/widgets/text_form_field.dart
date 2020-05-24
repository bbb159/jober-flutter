import 'package:flutter/material.dart';
import 'package:jober/utils/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final controller;
  final hintText;
  final validationText;
  final labelBorderText;
  final textInputType;
  final inputFormatters;
  final obscureText;

  CustomTextFormField({
    @required this.controller,
    this.hintText,
    this.labelBorderText,
    this.validationText,
    this.textInputType,
    this.inputFormatters,
    this.obscureText,
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
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPurpleDefaultColor, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
      ),
      keyboardType: widget.textInputType ?? TextInputType.text,
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
