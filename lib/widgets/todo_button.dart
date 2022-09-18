import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';

class ToDoButton extends StatelessWidget {

  final IconData? icon;
  final Color? iconColor;
  final String title;
  final Color? textColor;
  final VoidCallback? onTap;

  const ToDoButton({Key? key,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.textColor,
    required this.onTap,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 32,
        child: InkWell(
          onTap: onTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: CustomColors.darkGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8, right: 12, bottom: 8, left: 8),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    title,
                    style: TextStyle(color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'SFProTextRegular'),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}