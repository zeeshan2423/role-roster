part of 'employee_cubit.dart';

sealed class EmployeeState extends Equatable {
  const EmployeeState();
}

final class EmployeeInitial extends EmployeeState {
  @override
  List<Object> get props => [];
}
