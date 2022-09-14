import 'package:app/styles/custom_theme.dart';
import 'package:app/screens/providers/auth_bloc/form_submission_status.dart';
import 'package:flutter/material.dart';

class LoginState  {

  final String username;
  bool get isValidUsername {
   return username.length > 3 ? true : false;
  }
  bool get isEmptyUsername {
    return username.isEmpty ? true : false;
  }

  final String password;
  bool get isValidPassword {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{10,16}$');
   return regex.hasMatch(password) ? true : false;
   }
   bool get isEmptyPassword {
    return password.isEmpty ? true : false;
   }

  final String email;
  bool get isValidEmail {
    RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email) ? true : false;
  }
  bool get isEmptyEmail {
    return email.isEmpty ? true : false;
  }

  final FormSubmissionStatus formStatus;

  LoginState({
    this.username = '',
    this.password = '',
    this.email = '',
    this.formStatus = const InitialFormStatus(),
  });



  LoginState copyWith({
    String? username,
    String? password,
    String? email,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}






