import 'package:app/screens/add_project/bloc/add_project_bloc.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:app/screens/home/bloc/home_bloc.dart';
import 'package:app/screens/home/bloc/home_event.dart';
import 'package:app/screens/home/bloc/home_state.dart';
import 'package:app/screens/home/screen.dart';
import 'package:app/screens/inbox_screen/inbox_list.dart';
import 'package:app/screens/new_todo/bloc/todo_bloc.dart';
import 'package:app/screens/new_todo/bloc/todo_state.dart';
import 'package:app/screens/today_screen/today_list.dart';
import 'package:app/screens/upcoming_screen/upcoming_list.dart';
import 'package:app/styles/colors.dart';
import 'package:app/screens/new_todo/new_todo_screen.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/list_tile_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final String name = 'Name';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
      switch (state.runtimeType) {
        case LoadingState:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case DataLoaded:
          final projects = (state as DataLoaded).projects;
          return BlocListener<AddProjectBloc, AddProjectState>(
            listener: (_, addToDoState) {
              if (addToDoState is NewProjectAdded) {
                context.read<HomeBloc>().add(UpdateDataEvent());
              }
            },
            child: BlocListener<ToDoBloc, ToDoState>(
              listener: (_, addToDoState) {
                if (addToDoState is NewToDoAddedState) {
                  context.read<HomeBloc>().add(UpdateDataEvent());
                }
              },
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: CustomColors.yellow,
                    actions: [
                      IconButton(
                        padding: const EdgeInsets.only(right: 13.51),
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  drawer: Drawer(
                    child: Container(
                      color: CustomColors.yellow,
                      padding: const EdgeInsets.only(top: 145, left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text('Alex \nMitchell',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SFProTextRegular')),
                          const SizedBox(
                            height: 60,
                          ),
                          ListTile(
                            leading: const Icon(Icons.timelapse, color: Colors.black),
                            title: const Text(
                              'Productivity',
                              style: CustomStyles.black14,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.folder_open, color: Colors.black),
                            title: const Text(
                              'Projects',
                              style: CustomStyles.black14,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/projects');
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.settings, color: Colors.black),
                            title: const Text(
                              'Settings',
                              style: CustomStyles.black14,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: Material(
                    color: CustomColors.background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 32, top: 30, bottom: 30),
                          child: Text(
                            'Hello $name! 👋',
                            style: CustomStyles.white22,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: SizedBox(
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: CustomColors.listTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () { Navigator.pushNamed(context, '/inbox'); },
                                    child: CustomListTile(
                                        title: 'Inbox',
                                        icon: Icons.inbox,
                                        num: InboxRepository.instance.getToDo.length,
                                        iconColor: Colors.yellow,
                                        topRadius: 12,
                                        bottomRadius: 0),
                                  ),
                                  const DividerWidget(),
                                  GestureDetector(
                                    onTap: () { Navigator.pushNamed(context, '/today'); },
                                    child: CustomListTile(
                                        title: 'Today',
                                        icon: Icons.calendar_today,
                                        num: TodayRepository.instance.getToDo.length,
                                        iconColor: Colors.green,
                                        topRadius: 0,
                                        bottomRadius: 0),
                                  ),
                                  const DividerWidget(),
                                  GestureDetector(
                                    onTap: () { Navigator.pushNamed(context, '/upcoming'); },
                                    child: CustomListTile(
                                        title: 'Upcoming',
                                        icon: Icons.calendar_month,
                                        num: UpcomingRepository.instance.getToDo.length,
                                        iconColor: Colors.blue,
                                        topRadius: 0,
                                        bottomRadius: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 32, top: 34, bottom: 14),
                          child: Text(
                            'PROJECTS',
                            style: TextStyle(
                                color: Color.fromRGBO(235, 235, 245, 0.6),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SFProTextRegular'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: SizedBox(
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: CustomColors.listTile,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Column(
                                children:
                                    List.generate(projects.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Screen(name: projects[index].text)));
                                    },
                                    child: CustomListTile(
                                      title: projects[index].text,
                                      icon: Icons.circle_rounded,
                                      num: 1,
                                      iconColor: Colors.white12,
                                      //projects[index].color,
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 28),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => NewToDo(),
                        ));
                      },
                      child: const Icon(Icons.add, color: Colors.black),
                      backgroundColor: CustomColors.buttons,
                    ),
                  )
              ),
            ),
          );
      }
      return Placeholder();
    });
  }
}
