import 'package:app/data/todo_list.dart';

abstract class ToDoScreenEvent {}

class ToDoScreenUpdate extends ToDoScreenEvent {
  final project;
  ToDoScreenUpdate(this.project);
}

class ToDoScreenDelete extends ToDoScreenEvent {
  final ToDo todo;
  ToDoScreenDelete(this.todo);
}