import 'package:role_roster/core/constants/imports.dart';

part 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit() : super(AddEmployeeInitial());

  final employeeController = TextEditingController();
  final roleController = TextEditingController();
  final fromDateController = TextEditingController(text: AppStrings.today);
  final toDateController = TextEditingController();

  final selectedFromIndex = ValueNotifier<int>(0);
  final selectedToIndex = ValueNotifier<int>(0);
  final focusedFromDay = ValueNotifier<DateTime>(DateTime.now());
  final focusedToDay = ValueNotifier<DateTime>(DateTime.now());
  final selectedFromDay = ValueNotifier<DateTime?>(DateTime.now());
  final selectedToDay = ValueNotifier<DateTime?>(DateTime.now());

  DateTime nextWeekday(DateTime fromDate, int weekday) {
    var date = fromDate.add(const Duration(days: 1));
    while (date.weekday != weekday) {
      date = date.add(const Duration(days: 1));
    }
    return date;
  }
}
