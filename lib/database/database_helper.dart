import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

import '../model/user_model.dart';

class DatabaseHelper {
  static final _databaseName = "user.db";
  static final table = "user";
  static final columnId = 'id';
  static final columnUsername = 'username';
  static final columnPassword = 'password';
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY , 
        $columnUsername Text ,
        $columnPassword Text
        )
        ''');
  }

  Future<List<Map<String,dynamic>>> getAllRows()async{
    Database db = await instance.database;
    var res =await db.query(table,orderBy: 'username');
    return res;
  }

  Future<int> insert(User user) async {
    Database db = await instance.database;
    return await db.insert(table, user.toMap());
  }

  Future<int> delete(int id)async{
    Database db = await instance.database;
    return await db.delete(table,where: 'id = ?',whereArgs: [id]);
  }

  Future<int> update(User user)async{
    Database db = await instance.database;
    return await db.update(table, user.toMap(),where: 'id = ?',whereArgs: [user.id]);
  }
}