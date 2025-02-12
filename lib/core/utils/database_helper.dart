import 'package:role_roster/core/constants/imports.dart';

class DatabaseHelper {
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'employees.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE employees (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        role TEXT NOT NULL,
        fromDate TEXT NOT NULL,
        toDate TEXT
      )
    ''');
  }

  Future<int> addEmployee(Map<String, dynamic> employee) async {
    final db = await database;
    return db.insert('employees', employee);
  }

  Future<List<Map<String, dynamic>>> getEmployees() async {
    final db = await database;
    return db.query('employees');
  }

  Future<int> updateEmployee(int id, Map<String, dynamic> employee) async {
    final db = await database;
    return db.update('employees', employee, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteEmployee(int id) async {
    final db = await database;
    return db.delete('employees', where: 'id = ?', whereArgs: [id]);
  }
}
