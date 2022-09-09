import 'package:app/screens/providers/bloc/text_event.dart';
import 'package:app/screens/providers/bloc/text_model.dart';
import 'package:app/screens/providers/bloc/text_state.dart';
import 'package:app/widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SighUpScreen extends StatefulWidget {
  const SighUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SighUpScreenState();
}

class _SighUpScreenState extends State<StatefulWidget> {
  var widgetWidth;
  bool validation = false;
  final _emailText = TextEditingController();
  final _passwordText = TextEditingController();
  final _nameText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool emailEmpty = true;
  bool nameEmpty = true;
  bool passwordEmpty = true;
  bool isButtonActive = false;
  bool emailValidation = false;
  bool passwordValidation = false;
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
          title: const Text('Sign Up'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 214, 10),
          titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProTextRegular'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
              //tap
            },
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 28, 28, 30),
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  children: [
                    const Padding(
                        padding: EdgeInsets.fromLTRB(16, 32, 0, 8),
                        child: Text(
                          'NAME',
                          style: TextStyle(
                              color: Color.fromRGBO(235, 235, 245, 0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SFProTextRegular'),
                        )),
                    SizedBox(
                        height: 40,
                        child: TextFieldWidget(
                          onChanged: (text) {

                          },
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          controller: _nameText,
                            validator: (text) {
                              if (text == null) {
                                return 'Please enter your name';
                              }
                              return null;
                            }
                        ),
                              ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
                        child: Text(
                          'EMAIL',
                          style: TextStyle(
                              color: Color.fromRGBO(235, 235, 245, 0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SFProTextRegular'),
                        )),
                    SizedBox(
                        height: 40,
                        child: TextFieldWidget(
                          onChanged: (text) {

                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          controller: _emailText,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            emailValidation = true;
                           return null;
                          },
                        )),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
                        child: Text(
                          'PASSWORD',
                          style: TextStyle(
                              color: Color.fromRGBO(235, 235, 245, 0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SFProTextRegular'),
                        )),
                    SizedBox(
                        height: 40,
                        child: TextFieldWidget(
                          obscureText: true,
                          onChanged: (text) {

                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          controller: _passwordText,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter your password';
                            }
                            if (text.trim().length < 10 ||
                                text.trim().length > 16) {
                              return 'Password must be at least 10 characters in length';
                            }
                            passwordValidation = true;
                            return null;
                          },
                        )),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                  child: signInButton(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

   //Widget emailTextField() => TextField(
  //   style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFProTextRegular'),
  //   decoration: InputDecoration(
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //         borderSide: const BorderSide(
  //             width: 0,
  //             style: BorderStyle.none
  //         )
  //     ),
  //
  //     filled: true,
  //     fillColor: const Color.fromARGB(255, 44, 44, 46),
  //   ),
  //   keyboardType: TextInputType.emailAddress,
  //   textInputAction: TextInputAction.done,
  // );
  //
  // Widget emailTextField() => TextFieldWidget(
  //   keyboardType: TextInputType.emailAddress,
  // );

  // Widget passwordTextField() => TextField(
  //   style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFProTextRegular'),
  //   decoration: InputDecoration(
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //         borderSide: const BorderSide(
  //             width: 0,
  //             style: BorderStyle.none
  //         )
  //     ),
  //     filled: true,
  //     fillColor: const Color.fromARGB(255, 44, 44, 46),
  //   ),
  //   textInputAction: TextInputAction.done,
  //   obscureText: true,
  // );

  // Widget nameTextField() => TextField(
  //   style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFProTextRegular'),
  //   decoration: InputDecoration(
  //     border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //         borderSide: const BorderSide(
  //             width: 0,
  //             style: BorderStyle.none
  //         )
  //     ),
  //
  //     filled: true,
  //     fillColor: const Color.fromARGB(255, 44, 44, 46),
  //   ),
  //   textInputAction: TextInputAction.done,
  // );

  Widget signInButton(BuildContext context) =>
      BlocBuilder<TextModel, TextState>(builder: (context, state) {
        final newState = state as ChangedState;
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: newState.newState,
            fixedSize: Size(widgetWidth, 40),
          ),
          onPressed: isButtonActive
              ? () {
                  final bool? isValid = _formKey.currentState?.validate();
                  if (isValid == true) {
                  } else {
                    return null;
                    // context.read<SignInProvider>().wrongPassword();
                  }
                }
              : null,
          child: const Text(
            'SIGN IN',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'SFProTextRegular'),
          ),
        );
      });

  void checkTextFields(BuildContext context) {
    if (!emailEmpty && !passwordEmpty && !nameEmpty) {
      isButtonActive = true;
      context.read<TextModel>().add(ButtonOnEvent());
    } else {
      isButtonActive = false;
      context.read<TextModel>().add(ButtonOffEvent());
    }


    // if (_formKey.currentState!.validate()) {
    //   context.read<TextModel>().add(ButtonOnEvent());
    // }

    // if (_formKey.currentState!.validate()) {
    //   context.read<TextModel>().add(ButtonOnEvent());
    // } else {
    //   context.read<TextModel>().add(ButtonOffEvent());
    // }



  }
}
