import 'package:app/screens/home_screen.dart';
import 'package:app/screens/providers/sign_in_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class SighInScreen extends StatefulWidget {
//   const SighInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _SighInScreenState();
// }

class SighInScreen extends StatelessWidget {
  var widgetWidth;
  final _emailText = TextEditingController();
  final _passwordText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool emailEmpty = true;
  bool passwordEmpty = true;
  bool isButtonActive = false;
  final String _password = 'qazwsxedcrfv';
  final String _email = 'name@email.com';

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    widgetWidth = size.width;

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellow), //?
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 214, 10),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
          leading: IconButton(
              icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
              ), onPressed: () {
                Navigator.pop(context);
                //tap
            },
            ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(
          //       Icons.arrow_back,
          //       color: Colors.black,
          //     ),
          //     onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   ),
          // ],
        ),
        body: Container(
          color: const Color.fromARGB(255, 28, 28, 30),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    children: [
                      const Padding(
                          padding: EdgeInsets.fromLTRB(16, 32, 0, 8),
                          child: Text(
                              'EMAIL',
                          style: TextStyle(color: Color.fromRGBO(235, 235, 245, 0.6), fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
                          )),
                      SizedBox(
                        height: 40,
                          child: emailTextField(context),
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
                        child: passwordTextField(context),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                      child: signInButton(context),
                      ),
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }

  Widget emailTextField(BuildContext context) => TextFormField(
    validator: (value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter your email address';
      }
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      if (value != _email) {
        return 'Wrong email';
      }
      return null;
    },
    controller: _emailText,
    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFProTextRegular'),
    onChanged: (text) {
     emailEmpty = _emailText.text.isEmpty;
      checkTextFields(context);
    },
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

  Widget passwordTextField(BuildContext context) => TextFormField(
    controller: _passwordText,
    validator: (text) {
      if (text == null || text.trim().isEmpty) {
        return 'Please enter your password';
      }
      if (text.trim().length < 10 || text.trim().length > 16) {
        return 'Password must be at least 10 characters in length';
      }
      if (text != _password) {
        return 'Wrong password';
      }
      return null;
    },
    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFProTextRegular'),
    onChanged: (text) {
      passwordEmpty = _passwordText.text.isEmpty;
      checkTextFields(context);
    },
    decoration: InputDecoration(
      //errorText: '${context.watch<SignInProvider>().password}',
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

  Widget signInButton(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: context.watch<SignInProvider>().color,
      fixedSize: Size(widgetWidth, 40),
    ),
      onPressed: isButtonActive ? () {
        final bool? isValid = _formKey.currentState?.validate();
        if (isValid == true) {
          goToHomePage(context);
        } else {
          return null;
         // context.read<SignInProvider>().wrongPassword();
        }
      }
      : null,
      child: const Text(
        'SIGN IN',
        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
      ),
  );


  void checkTextFields(BuildContext context) {
    if (!emailEmpty && !passwordEmpty) {
      isButtonActive = true;
      context.read<SignInProvider>().buttonOn();
    } else {
      isButtonActive = false;
      context.read<SignInProvider>().buttonOff();
    }
  }

  void goToHomePage(BuildContext context) {
    Navigator.of(context).push (
      MaterialPageRoute(builder: (_) => const HomeScreen(),
      )
    );
  }


}