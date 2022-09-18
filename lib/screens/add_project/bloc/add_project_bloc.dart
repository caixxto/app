import 'package:app/screens/add_project/bloc/add_project_event.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:app/screens/add_project/projects_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class NewProjectBloc extends Bloc<NewProjectEvent, NewProjectState> {
//   NewProjectBloc() : super(NewProjectState()) {
//
//     on<ColorChangedEvent>((event, emit) {
//       emit(state.copyWith(index: event.index));
//     });
//
//     on<TextChangedEvent>((event, emit) {
//       emit(state.copyWith(text: event.text));
//     });
//
//     on<AddProjectEvent>((event, emit) {
//       state.projects.add(event.text);
//       emit(state.copyWith(text: event.text));
//     });
//   }
// }

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial('')) {
    on<AddProject>((event, emit) {
      Project.projects.add(event.projects);
      print(Project.projects);
      emit(ProjectsLoaded(projects: <Project>[]));
    });

    on<TextChanged>((event, emit) {
      emit(TextEmptyState(text: event.text));
    });

    on<Init>((event, emit) {
      emit(ProjectsLoaded(projects: <Project>[]));
    });
  }
}
