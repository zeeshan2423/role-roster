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
    final path = '${await getDatabasesPath()}employee.db';

    return openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE employees (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          role TEXT NOT NULL,
          from_date INTEGER NOT NULL,
          to_date INTEGER
        )
      ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db
              .execute('ALTER TABLE employees ADD COLUMN from_date INTEGER');
          await db.execute('ALTER TABLE employees ADD COLUMN to_date INTEGER');
        }
      },
    );
  }

  Future<int> addEmployee(Employee employee) async {
    final db = await database;
    return db.insert(
      'employees',
      {
        'name': employee.name,
        'role': employee.role,
        'from_date': employee.fromDate.millisecondsSinceEpoch,
        'to_date': employee.toDate?.millisecondsSinceEpoch,
      },
    );
  }

  Future<List<Employee>> getEmployees() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('employees');
    return maps.map(Employee.fromMap).toList();
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
