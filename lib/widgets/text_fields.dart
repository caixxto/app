import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  TextInputType keyboardType;
  bool obscureText;
  TextInputAction? textInputAction;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;
  TextEditingController? controller;


  TextFieldWidget({
    required this.keyboardType,
    this.obscureText = false,
    required this.textInputAction,
    required this.onChanged,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFProTextRegular'),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none
            )
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 44, 44, 46),
      ),
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        textInputAction: textInputAction,
        onChanged: onChanged,
        validator: validator,

    );
  }

}