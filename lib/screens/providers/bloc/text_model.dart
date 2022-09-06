import 'package:app/screens/providers/bloc/text_event.dart';
import 'package:app/screens/providers/bloc/text_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextModel extends Bloc<TextEvent, TextState> {
  TextModel() : super(ChangedState(const Color.fromRGBO(142, 142, 147, 1))) {
    on<ButtonOnEvent>((event, emit) {
      final currentResult = state as ChangedState;
      emit(ChangedState(Colors.yellow));
    });

    on<ButtonOffEvent>((event, emit) {
      final currentResult = state as ChangedState;
      emit(ChangedState(const Color.fromRGBO(142, 142, 147, 1)));
    });

  }

}