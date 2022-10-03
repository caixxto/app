import 'package:app/screens/add_project/projects_list.dart';
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
  var widgetWidth;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case ToDoLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case SetData:
              final todos = (state as SetData);
              return BlocListener<ToDoBloc, ToDoState>(
                listener: (context, state) {
                  if (state is NewToDoAddedState) {
                    Navigator.of(context).pop();
                  }
                },
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: CustomColors.background,
                    centerTitle: true,
                    leading: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Add new todo',
                      style: CustomStyles.title,
                    ),
                  ),
                  body: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    color: CustomColors.background,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, right: 16, left: 16),
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
                                        context.read<ToDoBloc>().add(
                                            TextChanged(text));
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
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  children: [
                                    ToDoButton(
                                        title: todos.calendarText,
                                        icon: todos.dateIcon,
                                        iconColor: todos.dateColor,
                                        textColor: null,
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  child: CalendarWidget(),
                                                  // TableCalendar(
                                                  //   focusedDay: DateTime.now(),
                                                  //   firstDay: DateTime.utc(
                                                  //       2012, 10, 16),
                                                  //   lastDay: DateTime.utc(
                                                  //       2030, 3, 14),
                                                  //   onDaySelected: (selectedDay,
                                                  //       focusedDay) {
                                                  //     //String text = DateFormat('yyyy-MM-dd – kk:mm').format(selectedDay);
                                                  //     context.read<ToDoBloc>()
                                                  //         .add(DateChanged(
                                                  //         selectedDay));
                                                  //   },
                                                  // ),
                                                  // const CalendarWidget(
                                                  //   onDaySelected: (selectedDay, focusedDay) {
                                                  //     print('');
                                                  //   },
                                                  // ),
                                                  color:
                                                  const Color.fromRGBO(
                                                      44, 44, 46, 1),
                                                );
                                              });
                                        }),
                                    ToDoButton(
                                      title: todos.projectText,
                                      icon: todos.projectIcon,
                                      iconColor: todos
                                          .projectColor,
                                      textColor: Colors.white,
                                      onTap: () {
                                        showMenu(context);
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
                                    onPressed: todos.toDoText
                                        .isEmpty ? null : () {
                                      context.read<ToDoBloc>().add(AddToDo());
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
                ),
              );
          }
          return Placeholder();
        });
  }
  }

  // void showCalendar() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder:  (BuildContext context) {
  //       return Container(child: const CalendarWidget(), color: const Color.fromRGBO(44, 44, 46, 1),);
  //     }
  //   );
  // }

  void showMenu(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(44, 44, 46, 1),
              centerTitle: true,
              elevation: 0,
              title: const Text(
                'Projects',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SFProTextRegular'),
              ),
              leadingWidth: 100,
              leading: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(44, 44, 46, 1)),
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: Color.fromRGBO(235, 235, 245, 0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'SFProTextRegular'),
                ),
              ),
            ),
            body: Container(
              color: const Color.fromRGBO(44, 44, 46, 1),
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          context.read<ToDoBloc>().add(ProjectChanged(index));
                        },
                        child: CustomListTile(
                          title: ProjectRepository
                              .instance.getProjects[index].text,
                          iconColor: ProjectRepository
                              .instance.getProjects[index].color,
                          icon: Icons.circle_rounded,
                          num: 1,
                        ),
                      ),
                  separatorBuilder: (_, __) => const Divider(
                        height: 10,
                      ),
                  itemCount: ProjectRepository.instance.getProjects.length),
            ),
          );
        });
  }

  // void showMenu() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Scaffold(
  //           appBar: AppBar(
  //             backgroundColor: const Color.fromRGBO(44, 44, 46, 1),
  //             centerTitle: true,
  //             elevation: 0,
  //             title: const Text(
  //               'Projects',
  //               style: TextStyle(color: Colors.white,
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.bold,
  //                   fontFamily: 'SFProTextRegular'
  //               ),
  //             ),
  //             leadingWidth: 100,
  //             leading: ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                   primary: const Color.fromRGBO(44, 44, 46, 1)
  //               ),
  //               onPressed: () {
  //               },
  //               child: const Text(
  //                 'Cancel',
  //                 style: TextStyle(color: Color.fromRGBO(235, 235, 245, 0.6),
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.normal,
  //                     fontFamily: 'SFProTextRegular'),
  //               ),
  //             ),
  //           ),
  //           body: Container(
  //             color: const Color.fromRGBO(44, 44, 46, 1),
  //             child: Column(
  //               children: [
  //                 const Divider(
  //                   height: 1,
  //                   color: Color.fromRGBO(84, 84, 88, 0.65),
  //                   indent: 0,
  //                 ),
  //                 mainFolderItem(),
  //                 const Divider(
  //                   height: 1,
  //                   color: Color.fromRGBO(84, 84, 88, 0.65),
  //                   indent: 40,
  //                 ),
  //                 Expanded(
  //                     child: Text('sss')
  //             //         ListView.separated(
  //             //         itemCount: items.length,
  //             //         itemBuilder: listTile2,
  //             //           separatorBuilder: (context, index) {
  //             //           return divider();
  //             //           },
  //             // )
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       }
  //   );
  // }

  Widget dateItem({
    required String text,
    required IconData icon,
    required Color iconColor,
    required Color textColor,
  }) {
    return SizedBox(
        height: 32,
        child: InkWell(
          onTap: () {},
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: CustomColors.darkGrey,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 12, bottom: 8, left: 8),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'SFProTextRegular'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget mainFolderItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 21, top: 15, bottom: 15),
      child: SizedBox(
          height: 32,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: CustomColors.darkGrey,
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/inbox.png'),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Inbox',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'SFProTextRegular'),
                ),
              ],
            ),
          )),
    );
  }
