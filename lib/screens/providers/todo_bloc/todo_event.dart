abstract class ToDoEvent {}

class ToDoTextChanged extends ToDoEvent {
  final String text;

  ToDoTextChanged({required this.text});
}