import 'package:app/styles/colors.dart';
import 'package:app/screens/new_todo_screen.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/list_tile_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final double buttonSide = 56;
  final String name = 'Name';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        drawer: menu(),
        body: Material(
          color: CustomColors.background,
// MAIN COLUMN
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
               Padding(
                padding: const EdgeInsets.only(left: 32, top: 30, bottom: 30),
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
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
//CHILD COLUMN
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomListTile(
                            title: 'Inbox',
                            icon: Icons.inbox,
                            num: 12,
                            iconColor: Colors.yellow,
                            topRadius: 12,
                            bottomRadius: 0),
                        const DividerWidget(),
                        CustomListTile(
                            title: 'Today',
                            icon: Icons.calendar_today,
                            num: 4,
                            iconColor: Colors.green,
                            topRadius: 0,
                            bottomRadius: 0),
                        const DividerWidget(),
                        CustomListTile(
                            title: 'Upcoming',
                            icon: Icons.calendar_month,
                            num: 8,
                            iconColor: Colors.blue,
                            topRadius: 0,
                            bottomRadius: 12),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 32, top: 34, bottom: 14),
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
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
//CHILD COLUMN
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Text('s');
                    }

                    ),
                  ),
                ),
              ),
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
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: CustomColors.buttons,
          ),
        ));
  }

  void tap() {}

  Widget menu() => Drawer(
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
              menuItems(
                text: 'Productivity',
                icon: Icons.timelapse,
              ),
              menuItems(
                text: 'Projects',
                icon: Icons.folder_open,
              ),
              menuItems(
                text: 'Settings',
                icon: Icons.settings,
              ),
            ],
          ),
        ),
      );

  Widget menuItems({
    required String text,
    required IconData icon,
  }) {
    const color = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'SFProTextRegular'),
      ),
      onTap: () {},
    );
  }
}
