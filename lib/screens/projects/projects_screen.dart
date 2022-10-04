import 'package:app/screens/add_project/add_project_screen.dart';
import 'package:app/screens/add_project/bloc/add_project_bloc.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:app/screens/projects/bloc/projects_screen_bloc.dart';
import 'package:app/screens/projects/bloc/projects_screen_state.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/list_tile_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_to_color/string_to_color.dart';

import 'bloc/projects_screen_event.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsScreenBloc, ProjectsScreenState>(
        builder: (context, state) {
      switch (state.runtimeType) {
        case LoadingState:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case DataLoaded:
          final projects = (state as DataLoaded).projects;
          return BlocListener<AddProjectBloc, AddProjectState>(
            listener: (_, addProjectState) {
              if (addProjectState is NewProjectAdded) {
                context.read<ProjectsScreenBloc>().add(UpdateDataEvent());
              }
            },
            child: Scaffold(
                backgroundColor: CustomColors.darkGreyBackground,
                appBar: AppBar(
                  title: const Text('Projects'),
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
                  elevation: 0,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: Colors.black))
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(
                      top: 32, left: 16, right: 16, bottom: 24),
                  child: ListView.separated(
                    itemCount: projects.length,
                    separatorBuilder: (_, __) => const Divider(
                      height: 0,
                    ),
                    itemBuilder: (context, index) => Dismissible(
                      confirmDismiss: (direction) async =>
                          direction == DismissDirection.endToStart,
                      onUpdate: (details) {
                        if (details.direction == DismissDirection.startToEnd &&
                            details.reached) {}
                      },
                      onDismissed: (_) {
                        context
                            .read<ProjectsScreenBloc>()
                            .add(DeleteProjectEvent(projects[index]));
                      },
                      secondaryBackground: Container(
                        padding: const EdgeInsets.only(right: 20),
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: const Text('Delete'),
                      ),
                      background: Container(
                        padding: const EdgeInsets.only(left: 20),
                        color: Colors.orange,
                        alignment: Alignment.centerLeft,
                        child: const Text('Edit'),
                      ),
                      key: Key(projects[index].text),
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<ProjectsScreenBloc>()
                              .add(DeleteProjectEvent(projects[index]));
                        },
                        child: CustomListTile(
                          title: projects[index].text,
                          icon: Icons.circle_rounded,
                          num: 0,
                          iconColor: Color(
                              int.parse(projects[index].color, radix: 16)),
                        ),
                      ),
                    ),
                  ),
                ),
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(right: 16, bottom: 28),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => AddNewProject(),
                      ));
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    backgroundColor: CustomColors.buttons,
                  ),
                )),
          );
      }
      return const Placeholder();
    });
  }
}
