import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class NewProjectState {
//
//   List<String> projects = [];
//
//    IconData icon;
//    int? index;
//    final String text;
//
//   IconData get changeIcon {
//     return Icons.circle_rounded;
//   }
//
//   changeIcons(index) {
//
//   }
//
//    NewProjectState copyWith({
//      IconData? icon,
//      final int? index,
//      String? text,
//    }) {
//      return NewProjectState(
//        icon: icon ?? this.icon,
//        index: index ?? this.index,
//        text: text ?? this.text,
//      );
//    }
//
//    bool get isEmpty {
//      return text.isEmpty ? true : false;
//    }
//
//   NewProjectState({
//     this.icon = Icons.circle_rounded,
//     this.index,
//     this.text = '',
//   });
// }
//
// class AddedProjectState extends NewProjectState {
//   final String text;
//
//   AddedProjectState({
//     this.text = 'text',
//   });
//
// }

// abstract class ProjectState  {
//   final text;
//   ProjectState(this.text);
//
// }

// class ProjectsLoaded extends ProjectState {
//   final List<Project> projects;
//    ProjectsLoaded({required this.projects}) : super(null);
//   //
//   // @override
//   // List<Object> get props => [projects];
// }
//
// class ProjectInitial extends ProjectState {
//   ProjectInitial(text) : super(text);
//
// }
//
// class TextEmptyState extends ProjectState {
//   final String text;
//   TextEmptyState({required this.text}) : super(null);
//
//   bool get isEmpty {
//     return text.isEmpty ? true : false;
//   }
//
//   TextEmptyState copyWith({
//     String? text,
//   }) {
//     return TextEmptyState(
//       text: text ?? this.text,
//     );
//   }
//
// }

abstract class AddProjectState {
  // final String text;
  // final Color color;
  // AddProjectState(this.text, this.color);
}

class InitialState extends AddProjectState {}

class NewProjectAdded extends AddProjectState {}

class DataChanged extends AddProjectState {

}

