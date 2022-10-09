import 'package:app/data/projects_list.dart';

abstract class ProjectsScreenState {}

class ProjectLoadingState extends ProjectsScreenState {}

class ProjectDataLoaded extends ProjectsScreenState {
  final List<Project> projects;
  ProjectDataLoaded(this.projects);
}