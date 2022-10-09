import 'package:app/data/projects_list.dart';
import 'package:app/screens/add_project/bloc/add_project_bloc.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:app/screens/home/bloc/home_state.dart';
import 'package:app/screens/new_todo/bloc/todo_bloc.dart';
import 'package:app/screens/new_todo/bloc/todo_event.dart';
import 'package:app/screens/new_todo/bloc/todo_state.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/list_tile_homepage.dart';
import 'package:app/widgets/todo_widgets/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/button.dart';
import '../../widgets/todo_button.dart';

class NewToDo extends StatelessWidget {
  NewToDo({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  DateTime? selectedDay;
  Project project = Project(text: 'Inbox', color: 'FFFFEB3B');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.background,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add new todo',
          style: CustomStyles.title,
        ),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>
        (builder: (context, state) {
        switch (state.runtimeType) {
          case ToDoLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case UpdateProjects:
            final data = (state as UpdateProjects);
            return MultiBlocListener(
              listeners: [
                BlocListener<ToDoBloc, ToDoState>(
                  listener: (_, addToDoState) {
                    if (addToDoState is NewToDoAddedState) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                BlocListener<AddProjectBloc, AddProjectState>(
                  listener: (_, addProjectState) {
                    if (addProjectState is NewProjectAdded) {
                      context.read<ToDoBloc>().add(TodoDataChanged());
                    }
                  },
                ),
              ],
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: CustomColors.background,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Form(
                    key: _formKey,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 272,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: CustomColors.darkGrey,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: TextFormField(
                                  onChanged: (text) {
                                    context
                                        .read<ToDoBloc>()
                                        .add(TodoDataChanged());
                                  },
                                  cursorColor: Colors.yellow,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'SFProTextRegular'),
                                  decoration: const InputDecoration(
                                    hintText: 'Add text',
                                    contentPadding: EdgeInsets.all(16),
                                    border: InputBorder.none,
                                  ),
                                  expands: true,
                                  maxLines: null,
                                  controller: _controller,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                ToDoButton(
                                    title: 'todo.text',
                                    icon: Icons.add,
                                    iconColor: Colors.white12,
                                    textColor: null,
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              child: CalendarWidget(),
                                              color: const Color.fromRGBO(
                                                  44, 44, 46, 1),
                                            );
                                          });
                                    }),
                                ToDoButton(
                                  title: project.text,
                                  icon: Icons.circle_rounded,
                                  iconColor: Color(
                                      int.parse(project.color, radix: 16)),
                                  textColor: Colors.white,
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Scaffold(
                                            appBar: AppBar(
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      44, 44, 46, 1),
                                              centerTitle: true,
                                              elevation: 0,
                                              title: const Text(
                                                'Projects',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'SFProTextRegular'),
                                              ),
                                              leadingWidth: 100,
                                              leading: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary:
                                                        const Color.fromRGBO(
                                                            44, 44, 46, 1)),
                                                onPressed: () {},
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          235, 235, 245, 0.6),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily:
                                                          'SFProTextRegular'),
                                                ),
                                              ),
                                            ),
                                            body: Container(
                                              color: const Color.fromRGBO(
                                                  44, 44, 46, 1),
                                              child: ListView.separated(
                                                itemBuilder: (context, index) =>
                                                    GestureDetector(
                                                  onTap: () {
                                                    project =
                                                        state.projects[index];
                                                    context
                                                        .read<ToDoBloc>()
                                                        .add(TodoDataChanged());
                                                  },
                                                  child: CustomListTile(
                                                    title: data
                                                        .projects[index].text,
                                                    iconColor: Color(int.parse(
                                                        data.projects[index]
                                                            .color,
                                                        radix: 16)),
                                                    icon: Icons.circle_rounded,
                                                    num: 0,
                                                  ),
                                                ),
                                                separatorBuilder: (_, __) =>
                                                    const Divider(
                                                  height: 10,
                                                ),
                                                itemCount: data.projects.length,
                                                //ProjectRepository.instance.getProjects.length
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                ),
                                const SizedBox(width: 16),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: double.infinity,
                              child: ButtonWidget(
                                text: 'ADD TODO',
                                onPressed: _controller.text.isEmpty
                                    ? null
                                    : () {
                                        context.read<ToDoBloc>().add(AddToDo(
                                            _controller.text,
                                            'Upcoming',
                                            project));
                                      },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
        }
        return const Placeholder();
      }),
    );
  }
}
