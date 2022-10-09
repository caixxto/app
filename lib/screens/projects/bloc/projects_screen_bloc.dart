import 'package:app/data/projects_list.dart';
import 'package:app/screens/projects/bloc/projects_screen_event.dart';
import 'package:app/screens/projects/bloc/projects_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsScreenBloc extends Bloc<ProjectsScreenEvent, ProjectsScreenState> {
  final ProjectRepository _repository = ProjectRepository.instance;
  ProjectsScreenBloc() : super(ProjectLoadingState()) {
    _initState();
    on<UpdateDataEvent>((event, state) async {
      _updateList();
    });
    on<DeleteProjectEvent>(_deleteProject);
  }

  Future<void> _initState() async {
    //await Future.delayed(const Duration(seconds: 2));
    _updateList();
  }

  void _updateList() async {
    emit(
      ProjectDataLoaded(await _repository.getProjects),
    );
  }

  void _deleteProject(DeleteProjectEvent event, Emitter<ProjectsScreenState> state) async {
    if (await _repository.deleteProject(event.project) != 0) {
      _updateList();
    }
  }



}