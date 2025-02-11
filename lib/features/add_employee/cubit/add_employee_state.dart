part of 'add_employee_cubit.dart';

sealed class AddEmployeeState extends Equatable {
  const AddEmployeeState();
}

final class AddEmployeeInitial extends AddEmployeeState {
  @override
  List<Object> get props => [];
}
