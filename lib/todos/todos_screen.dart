import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:app/todos/bloc/todos_bloc.dart';
import 'package:app/todos/bloc/todos_event.dart';
import 'package:app/todos/bloc/todos_state.dart';
import 'package:app/widgets/todo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatelessWidget {
  final String name;
  final int id;

  const ToDoScreen({Key? key, required this.name, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoScreenBloc, ToDoScreenState>(
        builder: (context, state) {
          context.read<ToDoScreenBloc>().add(ToDoScreenUpdate(id));
          switch (state.runtimeType) {
            case ToDoScreenLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ToDoScreenDataLoaded:
              final todos = (state as ToDoScreenDataLoaded).todos;
              final projects = state.projects;
              return Scaffold(
                backgroundColor: CustomColors.darkGreyBackground,
                appBar: AppBar(
                  title: Text(name),
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
                          toDoName: todos[index].text,
                          dateIcon: Icons.add,
                          dateText: todos[index].dataText,
                          projectIcon: Icons.circle_rounded,
                          projectText: projects[(todos[index].project) - 1]
                              .text,
                          projectIconColor: Color(
                              int.parse(projects[(todos[index].project) - 1]
                                  .color, radix: 16)),
                          dateIconColor: Colors.transparent,
                        );
                      },
                    ),
                  ),
                ),
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(right: 16, bottom: 28),
                  child: FloatingActionButton(
                    onPressed: () {

                    },
                    child: const Icon(Icons.add, color: Colors.black),
                    backgroundColor: CustomColors.buttons,
                  ),
                ),
              );
          }
          return Placeholder();
        }
    );
  }
}
