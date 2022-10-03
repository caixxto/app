import 'package:app/screens/upcoming_screen/upcoming_list.dart';

abstract class UpcomingState {}

class UpcomingLoadingState extends UpcomingState {}

class UpcomingDataLoaded extends UpcomingState {
  final List<ToDo> todos;
  UpcomingDataLoaded(this.todos);
}