
import 'package:app/widgets/list_tile_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StatefulWidget> {
  final double buttonSide = 56;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 214, 10, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ), onPressed: () {
          //tap
        },
        ),
        actions:  [
          IconButton(
            padding: const EdgeInsets.only(right: 13.51),
              icon: const Icon(
                  Icons.search,
                  color: Colors.black,
              ), onPressed: () {  },
          ),
        ],
      ),
      body: Material(
        color: const Color.fromRGBO(28, 28, 30, 1),
// MAIN COLUMN
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 32, top: 30, bottom: 30),
              child: Text(
                'Hello Alex!',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(44, 44, 46, 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
//CHILD COLUMN
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomListTile(title: 'Inbox', icon: Icons.inbox, num: 12, iconColor: Colors.yellow, topRadius: 12, bottomRadius: 0),
                      const Divider(
                        color: Color.fromRGBO(84, 84, 88, 0.65),
                        indent: 52,
                        height: 1,
                      ),
                      CustomListTile(title: 'Today', icon: Icons.calendar_today, num: 4, iconColor: Colors.green, topRadius: 0, bottomRadius: 0),
                      const Divider(
                        color: Color.fromRGBO(84, 84, 88, 0.65),
                        indent: 52,
                        height: 1,
                      ),
                      CustomListTile(title: 'Upcoming', icon: Icons.calendar_month, num: 8, iconColor: Colors.blue, topRadius: 0, bottomRadius: 12),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 32, top: 34, bottom: 14),
              child: Text(
                'PROJECTS',
                style: TextStyle(color: Color.fromRGBO(235, 235, 245, 0.6), fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'SFProTextRegular'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(44, 44, 46, 1),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
//CHILD COLUMN
                  child: Column(
                   mainAxisSize: MainAxisSize.min,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomListTile(title: 'Personal', icon: Icons.brightness_1_rounded, num: 12, iconColor: Colors.yellow, topRadius: 12, bottomRadius: 0),
                      const Divider(
                        color: Color.fromRGBO(84, 84, 88, 0.65),
                        indent: 52,
                        height: 1,
                      ),
                      CustomListTile(title: 'Work', icon: Icons.brightness_1_rounded, num: 4, iconColor: Colors.orange, topRadius: 0, bottomRadius: 0),
                      const Divider(
                        color: Color.fromRGBO(84, 84, 88, 0.65),
                        indent: 52,
                        height: 1,
                      ),
                      CustomListTile(title: 'Design', icon: Icons.brightness_1_sharp, num: 4, iconColor: Colors.purple, topRadius: 0, bottomRadius: 0),
                      const Divider(
                        color: Color.fromRGBO(84, 84, 88, 0.65),
                        indent: 52,
                        height: 1,
                      ),
                      CustomListTile(title: 'Study', icon: Icons.brightness_1_rounded, num: 8, iconColor: Colors.green, topRadius: 0, bottomRadius: 12),
                    ],
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
          onPressed: () {},
          child: const Icon(
              Icons.add,
              color: Colors.black,
          ),
          backgroundColor: Color.fromRGBO(255, 214, 10, 1),
        ),
      )
    );
  }

  void tap() {
    //s
  }
  
  }
