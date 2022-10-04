import 'package:app/data/projects_list.dart';

abstract class ProjectsScreenState {}

class LoadingState extends ProjectsScreenState {}

class DataLoaded extends ProjectsScreenState {
  final List<Project> projects;
  DataLoaded(this.projects);
}