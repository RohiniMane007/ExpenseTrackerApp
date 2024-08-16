import 'package:expence_tracker/src/features/auth/domain/models.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

class AuthService{

  Future<void> insertItem(Database db, User user) async {
    await db.insert(
      'user',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getItems(Database db) async {
    return await db.query('user');
  }

  Future<void> updateItem(Database db, User user) async {
    await db.update(
      'user',
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> deleteItem(Database db, int id) async {
    await db.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}