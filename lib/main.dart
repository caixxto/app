import 'package:app/screens/add_project/add_project_screen.dart';
import 'package:app/screens/add_project/bloc/add_project_bloc.dart';
import 'package:app/screens/home/bloc/home_bloc.dart';
import 'package:app/screens/inbox_screen/bloc/inbox_bloc.dart';
import 'package:app/screens/inbox_screen/inbox_screen.dart';
import 'package:app/screens/new_todo/bloc/todo_bloc.dart';
import 'package:app/screens/projects/bloc/projects_screen_bloc.dart';
import 'package:app/screens/projects/projects_screen.dart';
import 'package:app/screens/providers/auth_bloc/auth_repository.dart';
import 'package:app/screens/providers/auth_bloc/login_model.dart';
import 'package:app/screens/providers/bloc/text_model.dart';
import 'package:app/screens/signin_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:app/screens/today_screen/bloc/today_bloc.dart';
import 'package:app/screens/today_screen/today_screen.dart';
import 'package:app/screens/upcoming_screen/bloc/upcoming_bloc.dart';
import 'package:app/screens/upcoming_screen/upcoming_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/authorization_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/new_todo/new_todo_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TextModel(),
        ),
        BlocProvider(
          create: (_) => ToDoBloc('', Colors.yellow, Colors.grey, 'No date', 'Inbox', Icons.inbox, Icons.access_time),
          child: NewToDo(),
        ),
        BlocProvider(
          create: (_) => LoginBloc(authRepo: AuthRepository()),
          child: SignUpScreen(),
        ),
        BlocProvider(
          create: (_) => LoginBloc(authRepo: AuthRepository()),
          child: SignInScreen(),
        ),
        BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomeScreen(),
        ),
        BlocProvider(
          create: (_) => AddProjectBloc('', Colors.white),
          child: AddNewProject(),
        ),
        BlocProvider(
          create: (_) => ProjectsScreenBloc(),
          child: ProjectsScreen(),
        ),
        BlocProvider(
          create: (_) => InboxBloc(),
          child: InboxScreen(),
        ),
        BlocProvider(
          create: (_) => TodayBloc(),
          child: TodayScreen(),
        ),
        BlocProvider(
          create: (_) => UpcomingBloc(),
          child: UpcomingScreen(),
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
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/start': (context) => const AutoScreen(),
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
        '/projects': (context) => ProjectsScreen(),
        '/inbox': (context) => InboxScreen(),
        '/today': (context) => TodayScreen(),
        '/upcoming': (context) => UpcomingScreen(),
      },
    );
  }
}

