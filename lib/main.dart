import 'package:app/screens/providers/auth_bloc/auth_repository.dart';
import 'package:app/screens/providers/auth_bloc/login_model.dart';
import 'package:app/screens/providers/bloc/text_model.dart';
import 'package:app/screens/providers/new_todo_bloc/todo_model.dart';
import 'package:app/screens/providers/sign_in_provider.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'screens/authorization_screen.dart';
import 'screens/home_screen.dart';
import 'screens/main_screen.dart';
import 'screens/new_todo_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TextModel(),
        ),
        BlocProvider(
          create: (_) => ToDoModel(),
        ),
        BlocProvider(
          create: (_) => LoginBloc(authRepo: AuthRepository()),
          child: SighUpScreen(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // home: RepositoryProvider(
      //   create: (context) => AuthRepository(),
      //   child: SighUpScreen(),
      // ),
      initialRoute: '/start',
      routes: {
        '/home': (context) => HomeScreen(),
        '/start': (context) => AutoScreen(),
        '/sign_in': (context) => SighInScreen(),
        '/sign_up': (context) => RepositoryProvider(
              create: (context) => AuthRepository(),
              child: SighUpScreen(),
        ),
        '/todo': (context) => NewToDo(),
      },
    );
  }
}

