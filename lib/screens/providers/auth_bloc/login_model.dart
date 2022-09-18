import 'package:app/styles/custom_theme.dart';
import 'package:app/screens/providers/auth_bloc/auth_repository.dart';
import 'package:app/screens/providers/auth_bloc/form_submission_status.dart';
import 'package:app/screens/providers/auth_bloc/login_event.dart';
import 'package:app/screens/providers/auth_bloc/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/screens/providers/auth_bloc/auth_repository.dart';

import 'auth_repository.dart';
import 'form_submission_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  LoginBloc({required this.authRepo}) : super(LoginState()) {


    on<LoginUsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<LoginSubmitted>((event, emit) {
      emit(state.copyWith(formStatus: FormSubmitting()));
    });
  }
  }




