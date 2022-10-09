import 'package:app/data/todo_list.dart';

abstract class InboxEvent {}

class UpdateDataEvent extends InboxEvent {}

class DeleteToDoEvent extends InboxEvent {
  final ToDo todo;
  DeleteToDoEvent(this.todo);
}