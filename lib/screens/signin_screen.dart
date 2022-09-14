import 'package:app/styles/colors.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/providers/auth_bloc/auth_repository.dart';
import 'package:app/screens/providers/auth_bloc/login_event.dart';
import 'package:app/screens/providers/auth_bloc/login_model.dart';
import 'package:app/screens/providers/auth_bloc/login_state.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignInScreen({Key? key}) : super(key: key);

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
        body:  BlocProvider(
          create: (context) =>
              LoginBloc(authRepo: context.read<AuthRepository>()),
          child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Container(
                  color: CustomColors.darkGreyBackground,
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                  child: Stack(
                    children: [Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
                              child: Text(
                                'EMAIL',
                                style: CustomStyles.grey14,
                              )),
                          BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return TextFieldWidget(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) =>
                                  state.isValidEmail ? null : 'Email is invalid',
                                  onChanged: (value) =>
                                      context.read<LoginBloc>().add(
                                        LoginEmailChanged(email: value),
                                      ),
                                );
                              }),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
                              child: Text(
                                'PASSWORD',
                                style: CustomStyles.grey14,
                              )),
                          BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                return TextFieldWidget(
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) =>
                                  state.isValidPassword
                                      ? null
                                      : 'Password is invalid',
                                  onChanged: (value) =>
                                      context.read<LoginBloc>().add(
                                        LoginPasswordChanged(password: value),
                                      ),
                                );
                              }),
                        ],
                      ),
                    ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          child: ButtonWidget(
                            onPressed: (state.isEmptyPassword || state.isEmptyEmail) ? null : () {
                              if (_formKey.currentState!.validate()) {
                                //context.read<LoginBloc>().add(LoginSubmitted());
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                              }
                            },
                            text: 'SIGN UP',
                          ),
                          width: double.infinity,
                        ),
                      )
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}
