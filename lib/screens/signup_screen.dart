import 'package:app/styles/colors.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/providers/auth_bloc/auth_repository.dart';
import 'package:app/screens/providers/auth_bloc/form_submission_status.dart';
import 'package:app/screens/providers/auth_bloc/login_event.dart';
import 'package:app/screens/providers/auth_bloc/login_model.dart';
import 'package:app/screens/providers/auth_bloc/login_state.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/button.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellow), //?
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
          backgroundColor: CustomColors.yellow,
          titleTextStyle: CustomStyles.black16,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: CustomColors.darkGreyBackground,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          child: Stack(
            children: [
              BlocProvider(
                create: (context) => LoginBloc(
                    authRepo: context.read<AuthRepository>()),
                child: _form(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                 child: _loginButton(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _form() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.fromLTRB(16, 32, 0, 8),
                child: Text(
                  'NAME',
                  style: CustomStyles.grey14,
                )
            ),
            _usernameField(),
            const Padding(
                padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
                child: Text(
                  'EMAIL',
                  style: CustomStyles.grey14,
                )),
            _emailField(),
            const Padding(
                padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
                child: Text(
                  'PASSWORD',
                  style: CustomStyles.grey14,
                )),
            _passwordField(),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _emailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFieldWidget(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        validator: (value) =>
        state.isValidEmail ? null : 'Email is invalid',
        onChanged: (value) => context.read<LoginBloc>().add(
          LoginEmailChanged(email: value),
        ),
      );
    });
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFieldWidget(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          validator: (value) =>
    state.isValidUsername ? null : 'Username is too short',
          onChanged: (value) => context.read<LoginBloc>().add(
    LoginUsernameChanged(username: value),
    ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFieldWidget(
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        validator: (value) =>
        state.isValidPassword ? null : 'Password is invalid',
        onChanged: (value) => context.read<LoginBloc>().add(
          LoginPasswordChanged(password: value),
        ),
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? const CircularProgressIndicator()
          : ButtonWidget(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<LoginBloc>().add(LoginSubmitted());
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => HomeScreen(),
              )
          );
            //Navigator.pushNamed(context, '/home');
          }
        },
        text: 'SIGN UP',
      );
    });
  }
  }

