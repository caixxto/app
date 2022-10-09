import 'package:app/data/projects_list.dart';
import 'package:flutter/material.dart';

abstract class ToDoState {}

class ToDoLoadingState extends ToDoState {}

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
  // final String text;
   //final String color;
   UpdateProjects(this.projects);
}

class ErrorState extends ToDoState {

}