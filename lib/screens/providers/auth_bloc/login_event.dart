import 'package:app/styles/custom_theme.dart';

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

