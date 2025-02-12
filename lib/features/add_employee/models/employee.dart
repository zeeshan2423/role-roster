class Employee {
  const Employee({
    required this.name,
    required this.role,
    required this.fromDate,
    this.id,
    this.toDate,
  });

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as int?,
      name: map['name'] as String,
      role: map['role'] as String,
      fromDate: DateTime.fromMillisecondsSinceEpoch(map['from_date'] as int),
      toDate: map['to_date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['to_date'] as int)
          : null,
    );
  }
  final int? id;
  final String name;
  final String role;
  final DateTime fromDate;
  final DateTime? toDate;
}
