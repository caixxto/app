import 'package:app/screens/add_project/projects_list.dart';
import 'package:app/screens/inbox_screen/inbox_list.dart';
import 'package:app/screens/new_todo/bloc/todo_event.dart';
import 'package:app/screens/new_todo/bloc/todo_state.dart';
import 'package:app/screens/today_screen/today_list.dart';
import 'package:app/screens/upcoming_screen/upcoming_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final ProjectRepository _repository = ProjectRepository.instance;
  final InboxRepository _repositoryInbox = InboxRepository.instance;
  final TodayRepository _repositoryToday = TodayRepository.instance;
  final UpcomingRepository _repositoryUpcoming = UpcomingRepository.instance;
  String toDoText;
  String projectText;
  String calendarText;
  Color projectColor;
  Color dateColor;
  IconData dateIcon;
  IconData projectIcon;

  ToDoBloc(this.toDoText, this.projectColor, this.dateColor, this.calendarText,
      this.projectText, this.projectIcon, this.dateIcon) : super(ToDoLoadingState()) {
    _initState();

    on<AddToDo>((event, state) {
      _repositoryInbox.addToDo(ToDo(toDoText, calendarText, projectText, dateColor, projectColor, dateIcon, projectIcon));
      if ((calendarText == 'Upcoming') || (calendarText == 'No date')) {
        _repositoryUpcoming.addToDo(ToDo(toDoText, calendarText, projectText, dateColor, projectColor, dateIcon, projectIcon));
      } else if (calendarText == 'Today') {
        _repositoryToday.addToDo(ToDo(toDoText, calendarText, projectText, dateColor, projectColor, dateIcon, projectIcon));
      }
      emit(NewToDoAddedState());
    });

    on<ProjectChanged>((event, state) {
      projectText = _repository.getProjects[event.index].text;
      projectColor = _repository.getProjects[event.index].color;
      if (projectText == 'Inbox') {
        projectIcon = Icons.inbox;
      } else {
        projectIcon = Icons.circle_rounded;
      }
      _updateData();
    });

    on<TextChanged>((event, state) {
      toDoText = event.text;
      _updateData();
    });

    on<DateChanged>((event, state) {
      if (event.date == DateTime.now()) {
        calendarText = 'Today';
        dateIcon = Icons.calendar_today;
      } else {
        calendarText = 'Upcoming';
        dateIcon = Icons.calendar_month;
      }
      _updateData();
    });
  }

  Future<void> _initState() async {
    await Future.delayed(const Duration(seconds: 1));
    _updateData();
  }

  void _updateData() {
    emit(SetData(toDoText, projectText, calendarText, projectColor, dateColor, dateIcon, projectIcon));
  }
}
