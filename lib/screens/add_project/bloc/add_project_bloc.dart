import 'package:app/screens/add_project/bloc/add_project_event.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:app/data/projects_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProjectBloc extends Bloc<AddProjectEvent, AddProjectState> {
  final ProjectRepository _repository = ProjectRepository.instance;

  AddProjectBloc() : super(InitialState()) {
    _initState();

    on<DataChangeEvent>((event, state) {
      _updateScreen();
    });
    on<AddProject>(_addNewProject);
  }

  Future<void> _initState() async {
    _updateScreen();
  }

  void _addNewProject(AddProject event, Emitter<AddProjectState> state) async {
    String colorString = event.color.toString();
    String valueString = colorString.split('(0x')[1].split(')')[0];

    try {
      final result = await _repository
          .addProject(Project(text: event.title, color: valueString));
      if (result != 0) {
        emit(NewProjectAdded());
      }
    } catch (e) {
      emit(InitialState());
    }
  }

  void _updateScreen() async {
    emit(
      DataChangedState(),
    );
  }
}
