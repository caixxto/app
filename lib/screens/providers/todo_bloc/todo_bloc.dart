import 'package:app/screens/providers/todo_bloc/todo_event.dart';
import 'package:app/screens/providers/todo_bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoTextState> {
  ToDoBloc() : super(ToDoTextState()) {
    on<ToDoTextChanged>((event, emit) {
      emit(state.copyWith(text: event.text));
    });


    //ToDoBloc({}) : super(ToDoState());
  }
}