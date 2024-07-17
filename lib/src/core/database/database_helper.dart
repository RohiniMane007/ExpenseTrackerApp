import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../features/expense/domain/models/expense_models.dart';

class DatabaseHelper {
  final _dbName = 'expenseDatabase';

  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _dbName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create the table
        await db.execute('''CREATE TABLE expenses (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          date TEXT,
          category TEXT,
          amount TEXT,
          description TEXT
        )
      ''');
      },
    );
  }

  Future<void> insertItem(Database db, Expense item) async {
    await db.insert(
      'expenses',
      item.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getItems(Database db) async {
    return await db.query('expenses');
  }

  Future<void> updateItem(Database db, Expense item) async {
    await db.update(
      'expenses',
      item.toJson(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> deleteItem(Database db, int id) async {
    await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

/*import 'package:sqflite/sqflite.dart';

import '../../features/expense/domain/models/models.dart';

class DatabaseHelper {
  final _dbName = 'expenseDatabase';

  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/$_dbName';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
        CREATE TABLE expenses (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          date TEXT,
          amount TEXT,
          description TEXT
        )
      ''');
  }

  /*  Future<void> create(Expense expense) async {
    final db = await instance._dbName;
    final id = await db.insert();
    // return expense.copy(id: id);
  }

  Future<Expense> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      NoteFields.tableName,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Expense.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Expense>> readAll() async {
    final db = await instance.database;
    const orderBy = '${NoteFields.createdTime} DESC';
    final result = await db.query(NoteFields.tableName, orderBy: orderBy);
    return result.map((json) => Expense.fromJson(json)).toList();
  }

  Future<int> update(Expense note) async {
    final db = await instance.database;
    return db.update(
      NoteFields.tableName,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      NoteFields.tableName,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  } */

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

*/