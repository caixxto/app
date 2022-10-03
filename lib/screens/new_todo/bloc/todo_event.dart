abstract class ToDoEvent {}

class ProjectChanged extends ToDoEvent {
  final int index;
  ProjectChanged(this.index);
}

class TextChanged extends ToDoEvent {
  final String text;
  TextChanged(this.text);
}

class DateChanged extends ToDoEvent {
  final DateTime? date;
  DateChanged(this.date);
}

class AddToDo extends ToDoEvent {}