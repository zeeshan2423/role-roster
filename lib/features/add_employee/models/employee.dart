class Employee {
  const Employee({
    required this.name,
    required this.role,
    required this.from,
    this.to,
  });
  final String name;
  final String role;
  final DateTime from;
  final DateTime? to;
}
