import 'package:app/data/projects_list.dart';
import 'package:app/data/todo_list.dart';
import 'package:app/screens/inbox_screen/bloc/inbox_event.dart';
import 'package:app/screens/inbox_screen/bloc/inbox_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final ToDoRepository _repository = ToDoRepository.instance;
  final ProjectRepository _projectRepository = ProjectRepository.instance;

  InboxBloc() : super(InboxLoadingState()) {
    _initState();
    on<UpdateDataEvent>((event, state) async {
      _updateList();
    });

    on<DeleteToDoEvent>(_deleteToDo);
  }

  Future<void> _initState() async {
    await Future.delayed(const Duration(seconds: 1));
    _updateList();
  }

  void _updateList() async {
    emit(
      InboxDataLoaded(await _repository.getToDos, await _projectRepository.getProjects),
    );
  }

  void _deleteToDo(DeleteToDoEvent event, Emitter<InboxState> state) async {
    if (await _repository.deleteToDo(event.todo) != 0) {
      _updateList();
    }
  }

}