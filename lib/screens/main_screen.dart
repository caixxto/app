
import 'package:app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(
      backgroundColor: CustomColors.theme,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            child: Image.asset('assets/images/background.png',
            fit: BoxFit.cover,
              height: screenHeight,
              width: screenWidth,
            ),
          ),
         // Image.asset('assets/images/background.png'),
          Image.asset('assets/images/logo.png')
        ],
      ),
    );
  }

}
