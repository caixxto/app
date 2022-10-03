import 'dart:io';
import 'package:app/screens/add_project/projects_list.dart';
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
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'example_database.db');
    return openDatabase(
      path,
      version: dbVersion,
      onCreate: _onCreateDatabase,
      onUpgrade: (Database db, int oldVersion, int newVersion) {

      }
    );
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    db.execute(
      "CREATE TABLE IF NOT EXIST projects(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT UNIQUE, color TEXT UNIQUE)"
    );
  }

  Future<List<Project>> getProjects() async {
    final db = await instance._database;
    final result = await db.rawQuery('SELECT * FROM projects');
    return result.map((e) => Project.fromJSON(e)).toList();
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
}