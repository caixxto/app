import 'package:flutter/cupertino.dart';

class ColorCircleWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  int? index;
  GestureTapCallback? onTap;

  ColorCircleWidget({required this.color, required this.icon, required this.index, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: color,
          size: 30,
        )
    );
  }

}