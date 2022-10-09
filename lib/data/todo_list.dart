import 'package:app/data/projects_list.dart';
import 'database_helper.dart';

class ToDo {
  int? id;
  final String text;
  final String dataText;
  final int project;

  ToDo({this.id, required this.text, required this.dataText, required this.project});


  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      text: json['text'],
      dataText: json['dataText'],
      project: json['project']
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    'dataText': dataText,
    'project': project
  };

}

class ToDoRepository {
  static final ToDoRepository  _instance = ToDoRepository._();

  ToDoRepository._();

  static ToDoRepository get instance => _instance;

  Future<List<ToDo>> get getToDos async {
    final db = DatabaseHelper.instance;
    final result = await db.getToDos();
    return result.map((e) => ToDo.fromJson(e)).toList();
  }

  // Future<List<ToDo>> get getToDosFromId async {
  //   final project = 1;
  //   final db = DatabaseHelper.instance;
  //   final result = await db.getToDosFromId(project);
  //   return result.map((e) => ToDo.fromJson(e)).toList();
  // }

  Future<List<ToDo>> getToDosFromId(project) async {

    final db = DatabaseHelper.instance;
    final result = await db.getToDosFromId(project);
    return result.map((e) => ToDo.fromJson(e)).toList();
  }

  Future<int> addToDo(ToDo todo) async {
    final db = DatabaseHelper.instance;
    return db.addToDo(todo);
  }

  Future<int> deleteToDo(ToDo todo) async {
    return DatabaseHelper.instance.deleteToDo(todo.id!);
  }
}