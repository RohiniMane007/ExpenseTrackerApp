import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Database db = await initDatabase();
  runApp(MyApp(database: db));
}

Future<Database> initDatabase() async {
  // Get the default database path
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'example.db');

  // Open the database, creating it if it doesn't exist
  return openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      // Create the table
      await db.execute(
        'CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT, value INTEGER)',
      );
    },
  );
}

Future<void> insertItem(Database db, Map<String, dynamic> item) async {
  await db.insert(
    'items',
    item,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> getItems(Database db) async {
  return await db.query('items');
}

Future<void> updateItem(Database db, Map<String, dynamic> item) async {
  await db.update(
    'items',
    item,
    where: 'id = ?',
    whereArgs: [item['id']],
  );
}

Future<void> deleteItem(Database db, int id) async {
  await db.delete(
    'items',
    where: 'id = ?',
    whereArgs: [id],
  );
}

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
