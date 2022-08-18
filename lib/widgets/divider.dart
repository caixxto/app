import 'package:app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: CustomColors.divider,
      indent: 52,
      height: 1,
    );
  }
}