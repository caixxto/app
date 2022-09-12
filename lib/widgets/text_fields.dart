import 'package:app/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/providers/auth_bloc/login_state.dart';

class TextFieldWidget extends StatelessWidget {

  TextInputType keyboardType;
  bool obscureText;
  TextInputAction? textInputAction;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;


  TextFieldWidget({
    required this.keyboardType,
    this.obscureText = false,
    required this.textInputAction,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
      return TextFormField(
        style: const TextStyle(color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'SFProTextRegular'),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none
              )
          ),
          filled: true,
          fillColor: CustomColors.darkGrey,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        textInputAction: textInputAction,
        onChanged: onChanged,
        validator: validator,
      );
  }
}