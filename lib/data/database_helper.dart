import 'dart:io';
import 'package:app/data/projects_list.dart';
import 'package:app/data/todo_list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

const dbVersion = 1;

class DatabaseHelper {
  DatabaseHelper._();

  static DatabaseHelper _instance = DatabaseHelper._();

  static DatabaseHelper get instance => _instance;

  static Database? _databaseInstance;

  Future<Database> get _database async => _databaseInstance ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //final Directory directory = await getApplicationDocumentsDirectory();
    final String path = join(await getDatabasesPath(), 'example_database.db');
    return openDatabase(
      path,
      version: dbVersion,
      onCreate: _onCreateDatabase,
    );
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    db.execute(
      "CREATE TABLE IF NOT EXISTS projects(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, color TEXT)",
    );
    db.execute(
      "CREATE TABLE IF NOT EXISTS todos(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, dataText TEXT, project INTEGER)",
    );
  }

  Future<List<Map<String, Object?>>> getProjects() async {
    final db = await instance._database;
    final result = await db.query('projects');
    return result;
    //return db.rawQuery('SELECT * FROM projects');
      //result.map((e) => Project.fromJSON(e)).toList();
  }

  Future<int> addProject(Project project) async {
    final db = await instance._database;
    return db.insert(
      'projects',
    {
      'text': project.text,
      'color': project.color,
    },
    );
  }

  Future<int> deleteProject(int id) async {
    final db = await instance._database;
    return db.delete('projects', where: 'id=?', whereArgs: [id]);
  }

  Future<List<Map<String, Object?>>> getToDos() async {
    final db = await instance._database;
    final result = await db.query('todos');
    return result;
    //return db.rawQuery('SELECT * FROM projects');
    //result.map((e) => Project.fromJSON(e)).toList();
  }

  Future<List<Map<String, Object?>>> getToDosFromId(project) async {
    final db = await instance._database;
    final result = await db.query('todos', where: 'project=?', whereArgs: [project]);
    //final result = db.rawQuery('SELECT todos FROM projects WHERE id = $project');
    return result;
  }

  Future<int> addToDo(ToDo todo) async {
    final db = await instance._database;
    return db.insert(
      'todos',
      {
        'text': todo.text,
        'dataText': todo.dataText,
        'project': todo.project
      },
    );
  }

  Future<int> deleteToDo(int id) async {
    final db = await instance._database;
    return db.delete('todos', where: 'id=?', whereArgs: [id]);
  }
}