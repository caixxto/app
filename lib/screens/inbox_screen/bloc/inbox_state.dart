import 'package:app/data/projects_list.dart';
import 'package:app/data/todo_list.dart';

abstract class InboxState {}

class InboxLoadingState extends InboxState {}

class InboxDataLoaded extends InboxState {
  final List<ToDo> todos;
  final List<Project> projects;
  InboxDataLoaded(this.todos, this.projects);
}