import 'package:app/screens/add_project/bloc/add_project_event.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:app/data/projects_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProjectBloc extends Bloc<AddProjectEvent, AddProjectState> {
  final ProjectRepository _repository = ProjectRepository.instance;
   String dataColor;
   String dataText;

  AddProjectBloc(this.dataText, this.dataColor) : super(InitialState()) {

    _initState();

    on<AddProject>(_addNewProject);

    on<TextChanged>((event, state) {
      dataText = event.text;
      _updateScreen();
    });

    on<ColorChanged>((event, state) {
      String colorString = event.color.toString(); // Color(0x12345678)
      String valueString = colorString.split('(0x')[1].split(')')[0];
      dataColor = valueString;
      _updateScreen();
    });
  }

  Future<void> _initState() async {
    //await Future.delayed(const Duration(seconds: 1));
    _updateScreen();
  }


  void _addNewProject(AddProject event, Emitter<AddProjectState> state) async {

    if (dataText.isEmpty) {
      return;
    }

    try {
      final result = await _repository.addProject(Project(text: dataText, color: dataColor));
      if (result != 0) {
        emit(NewProjectAdded());
      }
    } catch (e) {
      emit(InitialState());
    }
  }

  void _updateScreen() async {
    emit(
        DataChanged(),
    );
  }

}