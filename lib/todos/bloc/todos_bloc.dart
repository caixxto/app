import 'package:app/data/projects_list.dart';
import 'package:app/data/todo_list.dart';
import 'package:app/todos/bloc/todos_event.dart';
import 'package:app/todos/bloc/todos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreenBloc extends Bloc<ToDoScreenEvent, ToDoScreenState> {
  final ToDoRepository _repository = ToDoRepository.instance;
  final ProjectRepository _projectRepository = ProjectRepository.instance;

  ToDoScreenBloc() : super(ToDoScreenLoadingState()) {
    _initState();
    on<ToDoScreenUpdate>((event, state) async {
      _updateList(event.project);
    });

    //on<ToDoScreenDelete>(_deleteToDo);
  }

  Future<void> _initState() async {
    _updateList(2);
  }

  void _updateList(project) async {
    emit(
      ToDoScreenDataLoaded(await _repository.getToDosFromId(project), await _projectRepository.getProjects),
    );
  }

  // void _deleteToDo(ToDoScreenDelete event, Emitter<ToDoScreenBloc> state) async {
  //   if (await _repository.deleteToDo(event.todo) != 0) {
  //     _updateList();
  //   }
  // }
}