import 'package:app/screens/add_project/bloc/add_project_event.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProjectBloc extends Bloc<NewProjectEvent, NewProjectState> {
  NewProjectBloc() : super(NewProjectState(icon: Icons.circle_rounded)) {

    on<ColorChangedEvent>((event, emit) {
      emit(state.copyWith(index: event.index));

    });
  }
}