import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

import '../model/user_model.dart';

class DatabaseHelper {
  // Define the database name, table name, and column names as constants
  static final _databaseName = "user.db";
  static final table = "user";
  static final columnId = 'id';
  static final columnUsername = 'username';
  static final columnPassword = 'password';

  // Private constructor to ensure that the class is a singleton
  DatabaseHelper._privateConstructor();

  // Singleton instance of the class
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // The database instance variable, which is initially null
  static Database? _database;

  // Getter for the database instance variable that initializes the database if it is null
  Future<Database> get database async => _database ??= await _initDatabase();

  // Method to initialize the database
  Future<Database> _initDatabase() async {
    // Get the path to the documents directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database at the specified path and create the table if it doesn't exist
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Method that creates the table if it doesn't exist
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY, 
        $columnUsername TEXT,
        $columnPassword TEXT
      )
    ''');
  }

  // Method that retrieves all rows from the table and returns them as a list of maps
  Future<List<Map<String, dynamic>>> getAllRows() async {
    Database db = await instance.database;
    var res = await db.query(table, orderBy: 'username');
    return res;
  }

  // Method that inserts a new user into the table and returns the id of the new row
  Future<int> insert(User user) async {
    Database db = await instance.database;
    return await db.insert(table, user.toJson());
  }

  // Method that deletes a row from the table with the specified id
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  // Method that updates a row in the table with the specified user object
  Future<int> update(User user) async {
    Database db = await instance.database;
    return await db
        .update(table, user.toJson(), where: 'id = ?', whereArgs: [user.id]);
  }
}
