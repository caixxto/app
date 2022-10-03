import 'package:app/data/database_helper.dart';

class Project {
  int? id;
  final String text;
  final String color;
  Project({this.id, required this.text, required this.color});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      text: json['text'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    'color': color,
  };

  }

class ProjectRepository {
  static final ProjectRepository  _instance = ProjectRepository._();

  ProjectRepository._();

  static ProjectRepository get instance => _instance;

  //final List<Project> _list = List.empty(growable: true);
  //final List<Project> _list = [Project("title", Colors.yellow), Project("title1", Colors.blue)];

 // List<Project> get getProjects => _list;

 // void addNewProject(Project project) => _list.add(project);

Future<List<Project>> get getProjects async {
  final db = DatabaseHelper.instance;
  final result = await db.getProjects();
  return result.map((e) => Project.fromJson(e)).toList();
}

Future<int> addProject(Project project) async {
  final db = DatabaseHelper.instance;
  return db.addProject(project);
}

Future<int> deleteProject(Project project) async {
  return DatabaseHelper.instance.deleteProject(project.id!);
}

}