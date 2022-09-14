import 'package:app/styles/custom_theme.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent {}

class LoginUsernameChanged extends LoginEvent {
  final String username;

  LoginUsernameChanged({required this.username});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  LoginEmailChanged({required this.email});
}

class LoginSubmitted extends LoginEvent {}

abstract class TextFieldEvent {}

class TextFieldChanged extends TextFieldEvent {
  final String password;

  TextFieldChanged({required this.password});
}


