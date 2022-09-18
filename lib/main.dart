import 'package:app/screens/add_project/add_project_screen.dart';
import 'package:app/screens/providers/auth_bloc/auth_repository.dart';
import 'package:app/screens/providers/auth_bloc/login_model.dart';
import 'package:app/screens/providers/bloc/text_model.dart';
import 'package:app/screens/providers/todo_bloc/todo_bloc.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/authorization_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/new_todo_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TextModel(),
        ),
        BlocProvider(
          create: (_) => ToDoBloc(),
        ),
        BlocProvider(
          create: (_) => LoginBloc(authRepo: AuthRepository()),
          child: SignUpScreen(),
        ),
        BlocProvider(
          create: (_) => LoginBloc(authRepo: AuthRepository()),
          child: SignInScreen(),
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
      initialRoute: '/new_project',
      routes: {
        '/home': (context) => HomeScreen(),
        '/start': (context) => AutoScreen(),
        '/sign_in': (context) => RepositoryProvider(
          create: (context) => AuthRepository(),
          child: SignInScreen(),
        ),
        '/sign_up': (context) => RepositoryProvider(
              create: (context) => AuthRepository(),
              child: SignUpScreen(),
        ),
        '/todo': (context) => NewToDo(),
        '/new_project': (context) => AddNewProject(),
      },
    );
  }
}

