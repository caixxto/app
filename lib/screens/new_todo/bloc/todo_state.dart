import 'package:app/data/projects_list.dart';
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

class UpdateState extends ToDoState {
   final String text;
   final String dateText;
   final Project project;

   UpdateState(this.text, this.dateText, this.project);
}

class UpdateProjects extends ToDoState {
   final List<Project> projects;
   final String text;
   final String color;
   UpdateProjects(this.projects, this.text, this.color);
}