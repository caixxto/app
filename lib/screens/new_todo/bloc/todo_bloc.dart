import 'package:app/data/projects_list.dart';
import 'package:app/data/todo_list.dart';
import 'package:app/screens/inbox_screen/inbox_list.dart';
import 'package:app/screens/new_todo/bloc/todo_event.dart';
import 'package:app/screens/new_todo/bloc/todo_state.dart';
import 'package:app/screens/today_screen/today_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final ToDoRepository _repository = ToDoRepository.instance;
  final ProjectRepository _projectRepository = ProjectRepository.instance;
   String text;
   String color;
  // String dateText;
  String project;

  ToDoBloc(this.text, this.color, this.project) : super(ToDoLoadingState()) {

    _initState();
     on<AddToDo>(_addNewToDo);
    //
    on<TextChanged>((event, state) async {
      _updateScreen();
    });

    on<ProjectChanged>((event, state){
      text = event.project.text;
      //String colorString = event.project.color.toString(); // Color(0x12345678)
      //String valueString = colorString.split('(0x')[1].split(')')[0];
      color = event.project.color;
      project = event.project.toString();
      _updateScreen();
    });

    on<UpdateProjectsEvent>((event, state) async {
      _updateScreen();
    });
  }


  void _addNewToDo(AddToDo event, Emitter<ToDoState> state) async {
    try {
      final result = await _repository.addToDo(ToDo(text: text, dataText: 'Upcoming', project: project));
      if (result != 0) {
        emit(NewToDoAddedState());
      }
    } catch (e) {
      emit(InitialState());
    }
  }

  Future<void> _initState() async {
    //await Future.delayed(const Duration(seconds: 1));
    _updateScreen();
  }

  void _updateScreen() async {
    emit(
      UpdateProjects(await _projectRepository.getProjects, text, color),
    );
  }



  // final ProjectRepository _repository = ProjectRepository.instance;
  // final InboxRepository _repositoryInbox = InboxRepository.instance;
  // final TodayRepository _repositoryToday = TodayRepository.instance;
  // final UpcomingRepository _repositoryUpcoming = UpcomingRepository.instance;
  // String toDoText;
  // String projectText;
  // String calendarText;
  // Color projectColor;
  // Color dateColor;
  // IconData dateIcon;
  // IconData projectIcon;
  //
  // ToDoBloc(this.toDoText, this.projectColor, this.dateColor, this.calendarText,
  //     this.projectText, this.projectIcon, this.dateIcon) : super(ToDoLoadingState()) {
  //   _initState();
  //
  //   on<AddToDo>((event, state) {
  //     _repositoryInbox.addToDo(ToDo(toDoText, calendarText, projectText, dateColor, projectColor, dateIcon, projectIcon));
  //     if ((calendarText == 'Upcoming') || (calendarText == 'No date')) {
  //       _repositoryUpcoming.addToDo(ToDo(toDoText, calendarText, projectText, dateColor, projectColor, dateIcon, projectIcon));
  //     } else if (calendarText == 'Today') {
  //       _repositoryToday.addToDo(ToDo(toDoText, calendarText, projectText, dateColor, projectColor, dateIcon, projectIcon));
  //     }
  //     emit(NewToDoAddedState());
  //   });
  //
  //   on<ProjectChanged>((event, state) {
  //     // projectText = _repository.getProjects[event.index].text;
  //     // projectColor = _repository.getProjects[event.index].color;
  //     // if (projectText == 'Inbox') {
  //     //   projectIcon = Icons.inbox;
  //     // } else {
  //     //   projectIcon = Icons.circle_rounded;
  //     // }
  //     // _updateData();
  //   });
  //
  //   on<TextChanged>((event, state) {
  //     toDoText = event.text;
  //     _updateData();
  //   });
  //
  //   on<DateChanged>((event, state) {
  //     if (event.date == DateTime.now()) {
  //       calendarText = 'Today';
  //       dateIcon = Icons.calendar_today;
  //     } else {
  //       calendarText = 'Upcoming';
  //       dateIcon = Icons.calendar_month;
  //     }
  //     _updateData();
  //   });
  // }
  //
  // Future<void> _initState() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   _updateData();
  // }
  //
  // void _updateData() {
  //   emit(SetData(toDoText, projectText, calendarText, projectColor, dateColor, dateIcon, projectIcon));
  // }
}
