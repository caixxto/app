import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoWidget extends StatelessWidget {
  //final Color iconColor;
  final VoidCallback? onPressed;
  final String toDoName;
  final IconData dateIcon;
  final String dateText;
  final IconData projectIcon;
  final String projectText;
  final Color dateIconColor;
  final Color projectIconColor;

  ToDoWidget({
    //required this.iconColor,
    required this.onPressed,
    required this.toDoName,
    required this.dateIcon,
    required this.dateText,
    required this.projectIcon,
    required this.projectText,
    required this.dateIconColor,
    required this.projectIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.darkGreyBackground,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.circle_outlined),
              ),
              Text(toDoName, style: CustomStyles.title),
            ],
          ),
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.only(left: 41),
            child: Row(
              children: [
                Icon(dateIcon, color: dateIconColor),
                const SizedBox(width: 9),
                Text(dateText, style: CustomStyles.white12),
                const SizedBox(width: 24),
                Icon(projectIcon, color: projectIconColor),
                const SizedBox(width: 10),
                Text(projectText, style: CustomStyles.grey12),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Color(0xFF38383A),
            height: 1,
          ),
        ],
      ),
    );
  }
}