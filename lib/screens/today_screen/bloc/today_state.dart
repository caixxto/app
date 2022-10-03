import 'package:app/screens/today_screen/today_list.dart';
import 'package:app/screens/upcoming_screen/upcoming_list.dart';

abstract class TodayState {}

class TodayLoadingState extends TodayState {}

class TodayDataLoaded extends TodayState {
  final List<ToDo> todos;
  TodayDataLoaded(this.todos);
}