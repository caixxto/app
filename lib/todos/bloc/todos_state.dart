import 'package:app/data/projects_list.dart';
import 'package:app/data/todo_list.dart';

abstract class ToDoScreenState {}

class ToDoScreenLoadingState extends ToDoScreenState {}

class ToDoScreenDataLoaded extends ToDoScreenState {
  final List<ToDo> todos;
  final List<Project> projects;
  ToDoScreenDataLoaded(this.todos, this.projects);
}