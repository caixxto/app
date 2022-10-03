import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/todo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen extends StatelessWidget {
  final String name;
  Screen({Key? key, required this.name}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<InboxBloc, InboxState>(builder: (context, state) {
    //   switch (state.runtimeType) {
    //     case InboxLoadingState:
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     case InboxDataLoaded:
    //       final todos = (state as InboxDataLoaded).todos;
    //       return BlocListener<ToDoBloc, ToDoState>(
    //         listener: (_, addInboxState) {
    //           if (addInboxState is NewToDoAddedState) {
    //             context.read<InboxBloc>().add(UpdateDataEvent());
    //           }
    //         },
    //         child:
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
                  // children: List.generate(
                  //   todos.length,
                  //       (index) {
                  //     return ToDoWidget(
                  //       onPressed: () {},
                  //       toDoName: todos[index].toDoName,
                  //       dateIcon: todos[index].dateIcon,
                  //       dateText: todos[index].dateText,
                  //       projectIcon: todos[index].projectIcon,
                  //       projectText: todos[index].projectText,
                  //       projectIconColor: todos[index].projectColor,
                  //       dateIconColor: todos[index].dateColor,
                  //     );
                  //   },
                  // ),
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
            );
  //           ),
  //         );
  //     }
  //     return Placeholder();
  //   }
  //   );
  // }
}
}