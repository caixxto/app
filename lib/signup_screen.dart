
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SighUpScreen extends StatefulWidget {
  const SighUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SighUpScreenState();
}

class _SighUpScreenState extends State<StatefulWidget> {
  var widgetWidth;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    widgetWidth = size.width;

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellow), //?
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 214, 10),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ), onPressed: () {
            //tap
          },
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 28, 28, 30),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  children: [
                    const Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 0, 8),
                        child: Text(
                          'NAME',
                          style: TextStyle(color: Color.fromRGBO(235, 235, 245, 0.6), fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
                        )
                    ),
                    SizedBox(
                      height: 40,
                      child: nameTextField(),
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
                        child: Text(
                          'EMAIL',
                          style: TextStyle(color: Color.fromRGBO(235, 235, 245, 0.6), fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
                        )),
                    SizedBox(
                      height: 40,
                      child: emailTextField(),
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
                        child: Text(
                          'PASSWORD',
                          style: TextStyle(color: Color.fromRGBO(235, 235, 245, 0.6), fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
                        )
                    ),
                    SizedBox(
                      height: 40,
                      child: passwordTextField(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: signInButton()
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget emailTextField() => TextField(
    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFProTextRegular'),
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none
          )
      ),

      filled: true,
      fillColor: const Color.fromARGB(255, 44, 44, 46),
    ),
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.done,
  );

  Widget passwordTextField() => TextField(
    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFProTextRegular'),
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none
          )
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 44, 44, 46),
    ),
    textInputAction: TextInputAction.done,
    obscureText: true,
  );

  Widget nameTextField() => TextField(
    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFProTextRegular'),
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none
          )
      ),

      filled: true,
      fillColor: const Color.fromARGB(255, 44, 44, 46),
    ),
    textInputAction: TextInputAction.done,
  );

  Widget signInButton() => ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: const Color.fromARGB(255, 255, 214, 10),
      fixedSize: Size(widgetWidth, 40),
    ),
    onPressed: tap,
    child: const Text(
      'SIGH IN',
      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
    ),
  );

  void tap() {

  }

}