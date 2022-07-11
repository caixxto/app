
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
    return Container(
      // height: screenHeight,
      // width: screenWidth,
      color: const Color.fromARGB(255, 255, 214, 10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/main_background.png'),
          Center(
              child: Image.asset('assets/images/logo.png')
          )
        ],
      ),
    );
  }

}
