import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AutoScreen extends StatefulWidget {
  const AutoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AutoScreenState();
}

class _AutoScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double widgetHeight = size.height/2;
    final widgetWidth = size.width;
    return Container(
      color: const Color.fromARGB(255, 28, 28, 30),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: widgetHeight,
                child: Center(
                    child: Image.asset('assets/images/logo.png'))
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign_in');
                      },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 214, 10),
                      textStyle: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
                      fixedSize: Size(widgetWidth, 40)
                    ),
                    child: const Text('SIGN IN'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 44, 44, 46),
                            textStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
                            fixedSize: Size(widgetWidth, 40)
                        ),
                        child: const Text('SIGN UP')
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
                    child: Divider(
                      color: Color.fromARGB(255, 56, 56, 58),
                      height: 1,
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: tap,
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 44, 44, 46),
                          textStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
                          fixedSize: Size(widgetWidth, 40)
                      ),
                      label: const Text('CONTINUE WITH GOOGLE'),
                      icon: Image.asset('assets/images/google_logo.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: ElevatedButton.icon(
                        onPressed: tap,
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 44, 44, 46),
                            textStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
                            fixedSize: Size(widgetWidth, 40)
                        ),
                        label: Text('CONTINUE WITH APPLE'),
                      icon: Image.asset('assets/images/apple_logo.png'),
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: tap,
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 44, 44, 46),
                          textStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
                          fixedSize: Size(widgetWidth, 40)
                      ),
                      label: const Text('CONTINUE WITH FACEBOOK'),
                      icon: Image.asset('assets/images/facebook_logo.png'),
                      //child: const Text('CONTINUE WITH FACEBOOK')
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

  }

  void tap() {
  }

}