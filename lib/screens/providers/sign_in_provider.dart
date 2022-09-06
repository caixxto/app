import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {

  Color _color = Colors.black;
  Color get color => _color;

  void buttonOn() {
    _color = Colors.yellow;
    notifyListeners();
  }

  void buttonOff() {
    _color = Colors.black;
    notifyListeners();
  }

  // String _password = '';
  // String get password => _password;
  //
  // void wrongPassword() {
  //   _password = 'Wrong password';
  //   notifyListeners();
  // }

}