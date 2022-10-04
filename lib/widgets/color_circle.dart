import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorCircleWidget extends StatelessWidget {
  final Color color;
//  final IconData icon;
  int? index;
  GestureTapCallback? onTap;
  final bool isChecked;

  ColorCircleWidget({required this.color, required this.index, required this.onTap, required this.isChecked});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Icon(
          _isChecked(),
          color: color,
          size: 30,
        )
    );
  }

  IconData _isChecked() {
    if (isChecked) {
      return Icons.check_circle_rounded;
    } else {
      return Icons.circle_rounded;
    }
  }

}