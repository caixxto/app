import 'package:app/screens/add_project/projects_list.dart';
import 'package:app/screens/projects/bloc/projects_screen_event.dart';
import 'package:app/screens/projects/bloc/projects_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsScreenBloc extends Bloc<ProjectsScreenEvent, ProjectsScreenState> {
  final ProjectRepository _repository = ProjectRepository.instance;
  ProjectsScreenBloc() : super(LoadingState()) {
    _initState();
    on<UpdateDataEvent>((event, state) async {
      _updateList();
    });
  }

  Future<void> _initState() async {
    await Future.delayed(const Duration(seconds: 2));
    _updateList();
  }

  void _updateList(){
    emit(
      DataLoaded(_repository.getProjects),
    );
  }



}