import 'package:app/data/projects_list.dart';
import 'package:app/screens/inbox_screen/bloc/inbox_bloc.dart';
import 'package:app/screens/inbox_screen/bloc/inbox_event.dart';
import 'package:app/screens/inbox_screen/bloc/inbox_state.dart';
import 'package:app/screens/new_todo/bloc/todo_bloc.dart';
import 'package:app/screens/new_todo/bloc/todo_state.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

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
          final projects = state.projects;
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: CustomColors.darkGreyBackground,
                child: ListView.separated(
                  controller: _scrollController,
                  itemCount: todos.length,
                  separatorBuilder: (_, __) => const Divider(
                    height: 0,
                  ),
                  itemBuilder: (context, index) => Dismissible(
                    confirmDismiss: (direction) async =>
                    direction == DismissDirection.endToStart,
                    onDismissed: (_) {
                      context
                          .read<InboxBloc>()
                          .add(DeleteToDoEvent(todos[index]));
                    },
                    background: Container(
                      padding: const EdgeInsets.only(right: 20),
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Text('Delete'),
                    ),
                    key: Key(todos[index].text),
                    child: ToDoWidget(
                      onPressed: () {},
                                toDoName: todos[index].text,
                                dateIcon: Icons.add,
                                dateText: todos[index].dataText,
                                projectIcon: Icons.circle_rounded,
                                projectText: projects[(todos[index].project)-1].text,
                                projectIconColor: Color(int.parse(projects[(todos[index].project)-1].color, radix: 16)),
                                dateIconColor: Colors.transparent,
                    )
                  ),
                ),
                // child: Column(
                //   children: List.generate(
                //     todos.length,
                //     (index) {
                //       return ToDoWidget(
                //           onPressed: () {},
                //           toDoName: todos[index].text,
                //           dateIcon: Icons.add,
                //           dateText: todos[index].dataText,
                //           projectIcon: Icons.access_time,
                //           projectText: projects[todos[index].project].text,
                //           projectIconColor: Colors.grey,
                //           dateIconColor: Colors.transparent,
                //       );
                //     },
                //   ),
                // ),
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
