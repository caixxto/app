import 'package:app/screens/new_todo_screen.dart';
import 'package:app/screens/providers/new_todo_bloc/todo_event.dart';
import 'package:app/screens/providers/new_todo_bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoModel extends Bloc<ToDoEvent, ToDoState> {

  ToDoModel() : super(InboxSelected(0)) {
    on<SelectInboxEvent>((event, emit) {
      final currentResult = state as InboxSelected;
      emit(InboxSelected(0));
    });

    on<SelectPersonalEvent>((event, emit) {
      final currentResult = state as InboxSelected;
      emit(InboxSelected(1));
    });

    on<SelectWorkEvent>((event, emit) {
      final currentResult = state as InboxSelected;
      emit(InboxSelected(2));
    });

    on<SelectDesignEvent>((event, emit) {
      final currentResult = state as InboxSelected;
      emit(InboxSelected(3));
    });

    on<SelectStudyEvent>((event, emit) {
      final currentResult = state as InboxSelected;
      emit(InboxSelected(4));
    });

  }

}