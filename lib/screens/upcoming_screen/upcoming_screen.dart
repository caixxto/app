import 'package:app/screens/new_todo/bloc/todo_bloc.dart';
import 'package:app/screens/new_todo/bloc/todo_state.dart';
import 'package:app/screens/today_screen/bloc/today_bloc.dart';
import 'package:app/screens/today_screen/bloc/today_event.dart';
import 'package:app/screens/today_screen/bloc/today_state.dart';
import 'package:app/screens/upcoming_screen/bloc/upcoming_bloc.dart';
import 'package:app/screens/upcoming_screen/bloc/upcoming_event.dart';
import 'package:app/screens/upcoming_screen/bloc/upcoming_state.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingScreen extends StatelessWidget {
  UpcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingBloc, UpcomingState>(builder: (context, state) {
      switch (state.runtimeType) {
        case UpcomingLoadingState:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case UpcomingDataLoaded:
          final todos = (state as UpcomingDataLoaded).todos;
          return BlocListener<ToDoBloc, ToDoState>(
            listener: (_, addToDoState) {
              if (addToDoState is NewToDoAddedState) {
                context.read<UpcomingBloc>().add(UpcomingUpdateDataEvent());
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Upcoming'),
                centerTitle: true,
                backgroundColor: CustomColors.yellow,
                titleTextStyle: CustomStyles.black16,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                elevation: 0,
              ),
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: CustomColors.darkGreyBackground,
                child: Column(
                  children: List.generate(
                    todos.length,
                        (index) {
                      return ToDoWidget(
                        onPressed: () {},
                        toDoName: todos[index].toDoName,
                        dateIcon: todos[index].dateIcon,
                        dateText: todos[index].dateText,
                        projectIcon: todos[index].projectIcon,
                        projectText: todos[index].projectText,
                        projectIconColor: todos[index].projectColor,
                        dateIconColor: todos[index].dateColor,
                      );
                    },
                  ),
                ),
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 28),
                child: FloatingActionButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (_) => NewToDo(),
                    // ));
                    Navigator.pushNamed(context, '/todo');
                  },
                  child: const Icon(Icons.add, color: Colors.black),
                  backgroundColor: CustomColors.buttons,
                ),
              ),
            ),
          );
      }
      return Placeholder();
    }
    );
  }
}
