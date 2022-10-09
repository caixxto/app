import 'package:app/data/projects_list.dart';
import 'package:app/data/todo_list.dart';

abstract class HomeState {}

class LoadingState extends HomeState {}

class DataLoaded extends HomeState {
  final List<Project> projects;
  final List<ToDo> todos;
  DataLoaded(this.projects, this.todos);
}