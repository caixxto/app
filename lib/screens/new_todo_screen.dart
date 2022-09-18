import 'package:app/Items.dart';
import 'package:app/screens/providers/todo_bloc/todo_bloc.dart';
import 'package:app/screens/providers/todo_bloc/todo_event.dart';
import 'package:app/screens/providers/todo_bloc/todo_state.dart';
import 'package:app/styles/colors.dart';
import 'package:app/screens/providers/bloc/text_event.dart';
import 'package:app/screens/providers/bloc/text_model.dart';
import 'package:app/screens/providers/bloc/text_state.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/todo_widgets/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/button.dart';
import '../widgets/todo_button.dart';

class NewToDo extends StatelessWidget {
  NewToDo({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var widgetWidth;
  final _controller = TextEditingController();
  var isEmpty;

  // var index1 = 0;
  var actualIndex = -1;

  List<ListItem> items = [
    // ListItem(text: 'Inbox', image: Image.asset('assets/icons/inbox.png')),
    ListItem(text: 'Personal', image: Image.asset('assets/icons/yellow.png')),
    ListItem(text: 'Work', image: Image.asset('assets/icons/orange.png')),
    ListItem(text: 'Design', image: Image.asset('assets/icons/purple.png')),
    ListItem(text: 'Study', image: Image.asset('assets/icons/green.png')),
  ];

  void _changedText(BuildContext context) {
    if (isEmpty) {
      context.read<TextModel>().add(ButtonOffEvent());
    } else {
      context.read<TextModel>().add(ButtonOnEvent());
    }
  }

  // void _changedItem(BuildContext context) {
  //   switch (actualIndex) {
  //     case 0:
  //       context.read<ToDoModel>().add(SelectInboxEvent());
  //       break;
  //     case 1:
  //       context.read<ToDoModel>().add(SelectPersonalEvent());
  //       break;
  //     case 2:
  //       context.read<ToDoModel>().add(SelectWorkEvent());
  //       break;
  //     case 3:
  //       context.read<ToDoModel>().add(SelectDesignEvent());
  //       break;
  //     case 4:
  //       context.read<ToDoModel>().add(SelectStudyEvent());
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocProvider(
        create: (context) => ToDoBloc(),
        child: BlocBuilder<ToDoBloc, ToDoTextState>(
          builder: (context, state) {
            return Container(
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
                                      .add(ToDoTextChanged(text: text));
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
                                title: '',
                                icon: null,
                                iconColor: null,
                                textColor: null,
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
                                                  primary: const Color.fromRGBO(
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
                                            child: Column(
                                              children: [
                                                const Divider(
                                                  height: 1,
                                                  color: Color.fromRGBO(
                                                      84, 84, 88, 0.65),
                                                  indent: 0,
                                                ),
                                                mainFolderItem(),
                                                const Divider(
                                                  height: 1,
                                                  color: Color.fromRGBO(
                                                      84, 84, 88, 0.65),
                                                  indent: 40,
                                                ),
                                                Expanded(child: Text('sss')
                                                    //         ListView.separated(
                                                    //         itemCount: items.length,
                                                    //         itemBuilder: listTile2,
                                                    //           separatorBuilder: (context, index) {
                                                    //           return divider();
                                                    //           },
                                                    // )
                                                    )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                              ),
                              ToDoButton(
                                  title: '',
                                  icon: null,
                                  iconColor: null,
                                  textColor: null,
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder:  (BuildContext context) {
                                          return Container(child: const CalendarWidget(), color: const Color.fromRGBO(44, 44, 46, 1),);
                                        }
                                    );
                                  }
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              //item(text: 'Inbox', icon: Icons.inbox, iconColor: Colors.yellow, textColor: Colors.white),
                              //folderItem(),
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
                              onPressed: state.isEmpty ? null : () {},
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // void showCalendar() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder:  (BuildContext context) {
  //       return Container(child: const CalendarWidget(), color: const Color.fromRGBO(44, 44, 46, 1),);
  //     }
  //   );
  // }

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

//   Widget folderItem() =>
//       BlocBuilder<ToDoModel, ToDoState>(
//           builder: (context, state) {
//             final newState = state as InboxSelected;
//             return InkWell(
//               onTap: () {},
//               child: SizedBox(
//                   height: 32,
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       color: CustomColors.darkGrey,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 8, right: 12, bottom: 8, left: 8),
//                       child: Row(
//                         children: [
//                           items[newState.newState].image,
//                           //Image.asset('assets/icons/yellow.png'),
//                           const SizedBox(
//                             width: 8,
//                           ),
//                           Text(
//                             //'So',
//                             items[newState.newState].text,
//                             style: const TextStyle(color: Colors.white,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.normal,
//                                 fontFamily: 'SFProTextRegular'),),
//                         ],
//                       ),
//                     ),
//                   )
//               ),
//             );
//           }
//       );
//
//
//   Widget listTile2(BuildContext context, int index) {
//     var obj = items[index];
//     return Padding(
//       padding: const EdgeInsets.only(top: 16, bottom: 16, left: 48),
//       child: InkWell(
//         onTap: () {
//           actualIndex = index;
//           _changedItem(context);
//         },
//         child: Row(
//           children: [
//             obj.image,
//             const SizedBox(width: 8),
//             Text(
//               obj.text,
//               style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 14,
//                   fontWeight: FontWeight.normal,
//                   fontFamily: 'SFProTextRegular'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  Widget divider() => const Divider(
        height: 1,
        color: Color.fromRGBO(84, 84, 88, 0.65),
        indent: 64,
      );
}
