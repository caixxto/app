import 'package:flutter/cupertino.dart';

// abstract class NewProjectEvent {}
//
// class ColorChangedEvent extends NewProjectEvent {
//   final int index;
//
//   ColorChangedEvent({required this.index});
//
// }
//
// class TextChangedEvent extends NewProjectEvent {
//   final String text;
//
//   TextChangedEvent({required this.text});
//
// }
//
// class AddProjectEvent extends NewProjectEvent {
//   final String text;
//   final IconData icon;
//
//   AddProjectEvent({required this.text, required this.icon});
// }

// abstract class ProjectEvent  {}
//
// class AddProject extends ProjectEvent{
//   final Project projects;
//
//   AddProject(this.projects);
//
// }
//
// class TextChanged extends ProjectEvent {
//   final text;
//  TextChanged({required this.text});
// }
//
// class ProjectsChanged extends ProjectEvent {}

abstract class AddProjectEvent {}

class AddProject extends AddProjectEvent {
  // final String title;
  // final Color color;
  //
  // AddProject(this.title, this.color);

  final String text;
  final String color;

  AddProject(this.text, this.color);
}

class TextChanged extends AddProjectEvent {
  final String text;
  TextChanged(this.text);
}

class ColorChanged extends AddProjectEvent {
  final Color color;
  final int index;
  ColorChanged(this.color, this.index);
}