import 'package:app/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  VoidCallback? onPressed;
  //ButtonStyle? style;
  //Widget? child;
  String text;


  ButtonWidget({
    required this.onPressed,
    //required this.style,
    //required this.child,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CustomColors.yellow,
        fixedSize: const Size.fromHeight(40),
    ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'SFProTextRegular'),
      ),
    );
  }

  }
