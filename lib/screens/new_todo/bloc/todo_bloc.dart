import 'package:app/data/projects_list.dart';
import 'package:app/data/todo_list.dart';
import 'package:app/screens/new_todo/bloc/todo_event.dart';
import 'package:app/screens/new_todo/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final ToDoRepository _repository = ToDoRepository.instance;
  final ProjectRepository _projectRepository = ProjectRepository.instance;

  ToDoBloc() : super(ToDoLoadingState()) {

    _initState();
     on<AddToDo>(_addNewToDo);

    on<TodoDataChanged>((event, state) async {
      _updateScreen();
    });

  }

  void _addNewToDo(AddToDo event, Emitter<ToDoState> state) async {
    try {
      final result = await _repository.addToDo(ToDo(text: event.text, dataText: 'Upcoming', project: event.project.id!));
      if (result != 0) {
        emit(NewToDoAddedState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  Future<void> _initState() async {
    _updateScreen();
  }

  void _updateScreen() async {
    emit(
      UpdateProjects(await _projectRepository.getProjects),
    );
  }

}
