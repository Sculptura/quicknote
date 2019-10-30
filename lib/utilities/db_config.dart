import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:quick_note/model/NoteModel.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  static DatabaseConfig _dbConfig; // singleton
  static Database _database;

  String notemaster = 'notemaster';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colRating = 'rating';

  Future<Database> get database async {
    if (_database == null) {
      _database = await intializeDatabase();
    }

    return _database;
  }

  Future<Database> intializeDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    return await openDatabase(dir.path + 'quicknotes.db',
        onCreate: _createDatabase);
  }

  void _createDatabase(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $notemaster($colId INTEGER PRIMARY KEY AUTO INCREMENT, ]'
        '$colTitle TEXT, $colDescription TEXT, $colRating INTEGER)');
  }

  DatabaseConfig._createInstance(); 

  factory DatabaseConfig() {
    if (_dbConfig == null) {
      _dbConfig = DatabaseConfig._createInstance();
    }
    return _dbConfig;
  }



 Future<List<Map<String,dynamic>>> getNoteMapList() async {
   return await _database.query(notemaster);
  }

  Future<int> insertNote(NoteModel model) async {
    return await _database.insert(notemaster, model.convertToMap());
  }

  Future<int> updateNote(NoteModel model) async {
    return await _database.update(notemaster, model.convertToMap(),whereArgs: [model.id]);
  }

   Future<int> deleteNote(NoteModel model) async {
    return await _database.delete(notemaster,whereArgs: [model.id]);
  }

}
