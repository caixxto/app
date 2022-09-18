import 'package:app/screens/add_project/projects_list.dart';
import 'package:equatable/equatable.dart';
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

abstract class ProjectState extends Equatable {

  final String text;
  bool get isEmpty {
    return text.isEmpty ? true : false;
  }

  ProjectState(this.text);

  @override
  List<Object> get props => [];

}

class ProjectsLoaded extends ProjectState {
  final List<Project> projects;
   ProjectsLoaded({required this.projects}): super('');

  @override
  List<Object> get props => [projects];
}

class ProjectInitial extends ProjectState {
  ProjectInitial(String text) : super(text);

}

class TextEmptyState extends ProjectState {
  final String text;
  TextEmptyState({required this.text}) : super('');

  bool get isEmpty {
    return text.isEmpty ? true : false;
  }

  TextEmptyState copyWith({
    String? text,
  }) {
    return TextEmptyState(
      text: text ?? this.text,
    );
  }

}




