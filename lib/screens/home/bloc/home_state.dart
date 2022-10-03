import 'package:app/screens/add_project/projects_list.dart';

abstract class HomeState {}

class LoadingState extends HomeState {}

class DataLoaded extends HomeState {
  final List<Project> projects;
  DataLoaded(this.projects);
}