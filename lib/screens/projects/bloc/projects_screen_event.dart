import 'package:app/data/projects_list.dart';

abstract class ProjectsScreenEvent {}

class UpdateDataEvent extends ProjectsScreenEvent {}

class DeleteProjectEvent extends ProjectsScreenEvent {
  final Project project;

  DeleteProjectEvent(this.project);
}