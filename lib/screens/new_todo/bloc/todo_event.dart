import 'package:app/data/projects_list.dart';

abstract class ToDoEvent {}

class ProjectChanged extends ToDoEvent {
  // final int index;
  // ProjectChanged(this.index);
  final Project project;
  ProjectChanged(this.project);
}

class TextChanged extends ToDoEvent {

}

class DateChanged extends ToDoEvent {
  final DateTime? date;
  DateChanged(this.date);
}

class AddToDo extends ToDoEvent {
  // final String text;
  // final String dateText;
  // final List<Project> projects;
  //
  // AddToDo(this.text, this.dateText, this.projects);
}

class UpdateProjectsEvent extends ToDoEvent {}