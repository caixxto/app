import 'package:app/screens/add_project/projects_list.dart';
import 'package:flutter/material.dart';

abstract class ToDoState {}

class ToDoLoadingState extends ToDoState {}

class SetData extends ToDoState {
   final String toDoText;
   final String projectText;
   final String calendarText;
   final Color projectColor;
   final Color dateColor;
   final IconData dateIcon;
   final IconData projectIcon;

   SetData(this.toDoText, this.projectText, this.calendarText, this.projectColor, this.dateColor, this.dateIcon, this.projectIcon);
}

class NewToDoAddedState extends ToDoState {}

class InitialState extends ToDoState {}