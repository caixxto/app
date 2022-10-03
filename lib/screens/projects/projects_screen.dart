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
                body: Container(
                  color: CustomColors.darkGreyBackground,
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                  child: Column(
                    children: List.generate(projects.length, (index) {
                      return CustomListTile(
                        title: projects[index].text,
                        icon: Icons.circle_rounded,
                        num: 1,
                        iconColor: projects[index].color,
                      );
                    }),
                  ),
                ),
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(right: 16, bottom: 28),
                  child: FloatingActionButton(
                    onPressed: ()
                    {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => AddNewProject(),
                      )
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    backgroundColor: CustomColors.buttons,
                  ),
                )
            ),
          );
      }
      return Placeholder();
    }
    );
  }
}
