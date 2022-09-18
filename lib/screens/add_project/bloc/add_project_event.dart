import 'package:app/screens/add_project/projects_list.dart';
import 'package:equatable/equatable.dart';
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

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class AddProject extends ProjectEvent{
  final Project projects;

  const AddProject(this.projects);

  @override
  List<Object> get props => [projects];

}

class TextChanged extends ProjectEvent {
  final text;
  const TextChanged({required this.text});
}

class Init extends ProjectEvent {}