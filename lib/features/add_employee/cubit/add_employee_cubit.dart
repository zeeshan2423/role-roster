import 'package:role_roster/core/constants/imports.dart';

part 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit() : super(AddEmployeeInitial());

  final employeeNameController = TextEditingController();
  final roleController = TextEditingController();
  final fromDateController = TextEditingController(text: AppStrings.today);
  final toDateController = TextEditingController();

  DateTime fromDate = DateTime.now();
  DateTime? toDate;

  final selectedFromIndex = ValueNotifier<int>(0);
  final selectedToIndex = ValueNotifier<int>(0);
  final focusedFromDay = ValueNotifier<DateTime>(DateTime.now());
  final focusedToDay = ValueNotifier<DateTime>(DateTime.now());
  final selectedFromDay = ValueNotifier<DateTime?>(DateTime.now());
  final selectedToDay = ValueNotifier<DateTime?>(null);

  DateTime nextWeekday(DateTime fromDate, int weekday) {
    var date = fromDate.add(const Duration(days: 1));
    while (date.weekday != weekday) {
      date = date.add(const Duration(days: 1));
    }
    return date;
  }

  Future<void> saveEmployee(BuildContext context) async {
    final name = employeeNameController.text;
    final role = roleController.text;
    final fromDate = fromDateController.text;

    if (name.isEmpty || role.isEmpty || fromDate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Employee name, role and from date are mandatory'),
        ),
      );
      return;
    }

    final employee = Employee(
      name: name,
      role: role,
      fromDate: this.fromDate,
      toDate: toDate,
    );

    await DatabaseHelper().addEmployee(employee);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Employee added successfully')),
      );
      context.pop(true);
    }
  }
}
