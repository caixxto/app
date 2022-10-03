import 'package:app/screens/add_project/bloc/add_project_event.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:app/screens/add_project/projects_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProjectBloc extends Bloc<AddProjectEvent, AddProjectState> {
  final ProjectRepository _repository = ProjectRepository.instance;
  // Color dataColor;
  // String dataText;

  AddProjectBloc() : super(InitialState()) {
    on<AddProject>(_addNewProject);
  }

  void _addNewProject(AddProject event, Emitter<NewProjectAdded> sate) async {

    if (event.text.isEmpty) {return;}

    try {
      final result = await _repository.addProject(Project(text: event.text, color: event.color));
      if (result != 0) {
        emit(NewProjectAdded());
      }
    } catch (e) {
      emit(InitialState());

    }
  }

  // AddProjectBloc(this.dataText, this.dataColor) : super(InitialState()) {
  //   on<AddProject>((event, state) {
  //     _repository.addProject(Project(dataText, dataColor));
  //     emit(NewProjectAdded());
  //   });
  //
  //   on<TextChanged>((event, state) {
  //     dataText = event.text;
  //     emit(DataChanged(dataText, dataColor));
  //   });
  //
  //   on<ColorChanged>((event, state) {
  //     dataColor = event.color;
  //     emit(DataChanged(dataText, dataColor));
  //   });
  // }

}