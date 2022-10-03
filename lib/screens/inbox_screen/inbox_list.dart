import 'package:app/screens/upcoming_screen/upcoming_list.dart';
import 'package:flutter/material.dart';

class InboxRepository {
  static final InboxRepository  _instance = InboxRepository._();

  InboxRepository._();

  static InboxRepository get instance => _instance;

  final List<ToDo> _list = List.empty(growable: true);
 // final List<Inbox> _list = [Inbox("ToDoName", 'DateText', 'ProjectText', Colors.white, Colors.grey)];

  List<ToDo> get getToDo => _list;

  void addToDo(ToDo todo) => _list.add(todo);
}