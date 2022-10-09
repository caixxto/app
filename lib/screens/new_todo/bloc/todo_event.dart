import 'package:app/data/projects_list.dart';
import 'package:app/data/todo_list.dart';

abstract class ToDoEvent {}

class TodoDataChanged extends ToDoEvent {}


class AddToDo extends ToDoEvent {
  final String text;
  final String dateText;
  final Project project;

  AddToDo(this.text, this.dateText, this.project);
}

class UpdateProjectsEvent extends ToDoEvent {}