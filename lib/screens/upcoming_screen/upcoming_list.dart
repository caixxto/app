import 'package:flutter/material.dart';

class ToDo {
  String toDoName;
  String dateText;
  String projectText;
  Color dateColor;
  Color projectColor;
  IconData dateIcon;
  IconData projectIcon;
  ToDo(this.toDoName, this.dateText, this.projectText, this.dateColor, this.projectColor, this.dateIcon, this.projectIcon);
}

class UpcomingRepository {
  static final UpcomingRepository  _instance = UpcomingRepository._();

  UpcomingRepository._();

  static UpcomingRepository get instance => _instance;

  final List<ToDo> _list = List.empty(growable: true);
  // final List<Inbox> _list = [Inbox("ToDoName", 'DateText', 'ProjectText', Colors.white, Colors.grey)];

  List<ToDo> get getToDo => _list;

  void addToDo(ToDo todo) => _list.add(todo);
}