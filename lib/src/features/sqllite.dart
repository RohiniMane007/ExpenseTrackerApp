import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
        await db.execute(
          '''CREATE TABLE expenses (
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          date TEXT,
          amount TEXT,
          description TEXT
        )
      ''');
      },
    );
  }

  Future<void> insertItem(Database db, Map<String, dynamic> item) async {
    await db.insert(
      'expenses',
      item,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getItems(Database db) async {
    return await db.query('expenses');
  }

  Future<void> updateItem(Database db, Map<String, dynamic> item) async {
    await db.update(
      'expenses',
      item,
      where: 'id = ?',
      whereArgs: [item['id']],
    );
  }

  Future<void> deleteItem(Database db, int id) async {
    await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
/*
class MyApp extends StatelessWidget {
  final Database database;

  MyApp({required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SQLite Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: getItems(database),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final items = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text('Value: ${item['value']}'),
                    );
                  },
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await insertItem(database, {'name': 'New Item', 'value': 123});
            // Refresh the state to show the new item
            (context as Element).reassemble();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
*/