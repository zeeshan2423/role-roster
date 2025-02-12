import 'package:role_roster/core/constants/imports.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<Employee> _employees = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEmployees();
  }

  Future<void> _loadEmployees() async {
    final employees = await DatabaseHelper().getEmployees();
    setState(() {
      _employees = employees;
      _isLoading = false;
    });
  }

  Future<void> _deleteEmployee(int id) async {
    setState(() {
      _employees = _employees.where((employee) => employee.id != id).toList();
    });
    await DatabaseHelper().deleteEmployee(id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;
    final colorScheme = context.theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primaryContainer,
        title: Text(AppStrings.employeeTitle),
        titleTextStyle:
            textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push<bool>(
            context.namedLocation(PAGES.addEmployee.screenName),
          );
          if (result ?? false) await _loadEmployees();
        },
        backgroundColor: colorScheme.primaryContainer,
        child: Icon(Icons.add, color: colorScheme.onPrimary),
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.noRecord),
                    Text(AppStrings.noEmployee, style: textTheme.titleMedium),
                  ],
                ),
              )
            : _buildEmployeeList(textTheme, colorScheme),
      ),
    );
  }

  Widget _buildEmployeeList(TextTheme textTheme, ColorScheme colorScheme) {
    final currentEmployees = _employees.where((e) => e.toDate == null).toList();
    final previousEmployees =
        _employees.where((e) => e.toDate != null).toList();

    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              if (currentEmployees.isNotEmpty) ...[
                _buildSectionHeader(
                  'Current Employees',
                  textTheme,
                  colorScheme,
                ),
                ...currentEmployees.map(
                  (employee) =>
                      _buildEmployeeTile(employee, textTheme, colorScheme),
                ),
              ],
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              if (previousEmployees.isNotEmpty) ...[
                _buildSectionHeader(
                  'Previous Employees',
                  textTheme,
                  colorScheme,
                ),
                ...previousEmployees.map(
                  (employee) =>
                      _buildEmployeeTile(employee, textTheme, colorScheme),
                ),
              ],
            ],
          ),
        ),
        if (_employees.isNotEmpty) _buildSwipeMessage(textTheme, colorScheme),
      ],
    );
  }

  Widget _buildSectionHeader(
    String title,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            color: colorScheme.surfaceContainerHighest,
            child: Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmployeeTile(
    Employee employee,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    final fromDate = DateFormat('dd MMM, yyyy').format(employee.fromDate);
    final toDate =
        DateFormat('dd MMM, yyyy').format(employee.toDate ?? DateTime(0));
    return Dismissible(
      key: Key(employee.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: Icon(Icons.delete_outline, color: colorScheme.onError),
      ),
      onDismissed: (direction) => _deleteEmployee(employee.id!),
      child: ListTile(
        title: Text(
          employee.name,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                employee.role,
                style:
                    textTheme.titleSmall?.copyWith(color: colorScheme.outline),
              ),
            ),
            Text(
              employee.toDate == null
                  ? 'From $fromDate'
                  : '$fromDate - $toDate',
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.outline),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Widget _buildSwipeMessage(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 42),
            color: colorScheme.surfaceContainerHighest,
            child: Text(
              'Swipe left to delete',
              style:
                  textTheme.titleMedium?.copyWith(color: colorScheme.outline),
            ),
          ),
        ),
      ],
    );
  }
}
