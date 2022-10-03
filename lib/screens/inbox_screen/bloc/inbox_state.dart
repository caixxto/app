import 'package:app/screens/inbox_screen/inbox_list.dart';
import 'package:app/screens/upcoming_screen/upcoming_list.dart';

abstract class InboxState {}

class InboxLoadingState extends InboxState {}

class InboxDataLoaded extends InboxState {
  final List<ToDo> todos;
  InboxDataLoaded(this.todos);
}