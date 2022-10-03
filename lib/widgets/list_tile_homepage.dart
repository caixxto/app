import 'package:app/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  final String title;
  final IconData icon;
  final int num;
  final Color iconColor;
  final double topRadius;
  final double bottomRadius;

  CustomListTile({
    required this.title,
    required this.icon,
    required this.num,
    required this.iconColor,
    this.topRadius = 12,
    this.bottomRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(topRadius),
            bottom: Radius.circular(bottomRadius),
          ),
        ),
        tileColor: CustomColors.listTile,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProTextRegular'),
        ),
        trailing: Text(
          '$num',
          style: const TextStyle(color: Color.fromRGBO(235, 235, 245, 0.6),
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'SFProTextRegular'),
        ),
        leading: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}