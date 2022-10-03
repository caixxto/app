import 'package:app/screens/inbox_screen/bloc/inbox_bloc.dart';
import 'package:app/screens/inbox_screen/bloc/inbox_event.dart';
import 'package:app/screens/inbox_screen/bloc/inbox_state.dart';
import 'package:app/screens/new_todo/bloc/todo_bloc.dart';
import 'package:app/screens/new_todo/bloc/todo_state.dart';
import 'package:app/screens/new_todo/new_todo_screen.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/list_tile_homepage.dart';
import 'package:app/widgets/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InboxBloc, InboxState>(builder: (context, state) {
      switch (state.runtimeType) {
        case InboxLoadingState:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case InboxDataLoaded:
          final todos = (state as InboxDataLoaded).todos;
          return BlocListener<ToDoBloc, ToDoState>(
            listener: (_, addInboxState) {
              if (addInboxState is NewToDoAddedState) {
                context.read<InboxBloc>().add(UpdateDataEvent());
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Inbox'),
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
                padding: EdgeInsets.symmetric(horizontal: 16),
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
