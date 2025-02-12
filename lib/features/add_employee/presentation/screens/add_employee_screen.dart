import 'package:role_roster/core/constants/imports.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.addEmployeeCubit;
    final textTheme = context.theme.textTheme;
    final colorScheme = context.theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primaryContainer,
        title: Text(AppStrings.addEmployeeTitle),
        titleTextStyle:
            textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
        leading: const SizedBox(),
        leadingWidth: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Column(
                children: [
                  TextFormField(
                    controller: cubit.employeeNameController,
                    onTapOutside: (e) {
                      FocusScope.of(context).unfocus();
                    },
                    keyboardType: TextInputType.name,
                    cursorColor: colorScheme.primaryContainer,
                    style: textTheme.titleMedium,
                    decoration: InputDecoration(
                      isDense: true,
                      alignLabelWithHint: true,
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: colorScheme.outlineVariant),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: colorScheme.primaryContainer),
                      ),
                      hintText: AppStrings.employeeNameHint,
                      hintStyle: textTheme.titleMedium
                          ?.copyWith(color: colorScheme.outlineVariant),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        size: 24,
                        color: colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: TextFormField(
                      controller: cubit.roleController,
                      onTap: () {
                        showModalBottomSheet<Widget>(
                          context: context,
                          builder: (context) {
                            return ListView.separated(
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              itemBuilder: (context, index) {
                                final role = RolesType.values[index];
                                return GestureDetector(
                                  onTap: () {
                                    cubit.roleController.text =
                                        role.formattedName;
                                    Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                      role.formattedName,
                                      textAlign: TextAlign.center,
                                      style: textTheme.titleMedium,
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: colorScheme.outlineVariant,
                                );
                              },
                              itemCount: RolesType.values.length,
                            );
                          },
                        );
                      },
                      onTapOutside: (e) {
                        FocusScope.of(context).unfocus();
                      },
                      keyboardType: TextInputType.text,
                      cursorColor: colorScheme.primaryContainer,
                      style: textTheme.titleMedium,
                      readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        alignLabelWithHint: true,
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colorScheme.outlineVariant),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colorScheme.outlineVariant),
                        ),
                        hintText: AppStrings.selectRoleHint,
                        hintStyle: textTheme.titleMedium
                            ?.copyWith(color: colorScheme.outlineVariant),
                        prefixIcon: Icon(
                          Icons.work_outline,
                          size: 24,
                          color: colorScheme.primaryContainer,
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down_rounded,
                          size: 36,
                          color: colorScheme.primaryContainer,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cubit.fromDateController,
                          onTap: () async {
                            final result = await showDialog<String?>(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: _buildFromContent(
                                    cubit,
                                    colorScheme,
                                    textTheme,
                                    context,
                                  ),
                                );
                              },
                            );
                            if ((result ?? '').isNotEmpty) {
                              final parsedDate =
                                  DateFormat('dd MMM yyyy').parse(result ?? '');
                              final today = DateTime.now();

                              final isToday = parsedDate.year == today.year &&
                                  parsedDate.month == today.month &&
                                  parsedDate.day == today.day;

                              cubit.fromDateController.text =
                                  isToday ? AppStrings.today : result ?? '';
                              cubit.fromDate = parsedDate;
                            }
                          },
                          onTapOutside: (e) {
                            FocusScope.of(context).unfocus();
                          },
                          keyboardType: TextInputType.name,
                          cursorColor: colorScheme.primaryContainer,
                          style: textTheme.titleMedium,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            alignLabelWithHint: true,
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorScheme.outlineVariant),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorScheme.primaryContainer,
                              ),
                            ),
                            hintText: AppStrings.employeeNameHint,
                            hintStyle: textTheme.titleMedium
                                ?.copyWith(color: colorScheme.outlineVariant),
                            prefixIcon: Icon(
                              Icons.event,
                              size: 24,
                              color: colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 48,
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          color: colorScheme.primaryContainer,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: cubit.toDateController,
                          onTapOutside: (e) {
                            FocusScope.of(context).unfocus();
                          },
                          onTap: () async {
                            final result = await showDialog<String?>(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: _buildToContent(
                                    cubit,
                                    colorScheme,
                                    textTheme,
                                    context,
                                  ),
                                );
                              },
                            );
                            if ((result ?? '').isNotEmpty) {
                              final parsedDate =
                                  DateFormat('dd MMM yyyy').parse(result ?? '');
                              cubit.toDateController.text = result ?? '';
                              cubit.toDate = parsedDate;
                            } else {
                              cubit.toDateController.text =
                                  AppStrings.noDateHint;
                            }
                          },
                          keyboardType: TextInputType.name,
                          cursorColor: colorScheme.primaryContainer,
                          style: textTheme.titleMedium,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            alignLabelWithHint: true,
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorScheme.outlineVariant),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colorScheme.primaryContainer,
                              ),
                            ),
                            hintText: AppStrings.noDateHint,
                            hintStyle: textTheme.titleMedium
                                ?.copyWith(color: colorScheme.outlineVariant),
                            prefixIcon: Icon(
                              Icons.event,
                              size: 24,
                              color: colorScheme.primaryContainer,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  Divider(color: colorScheme.outlineVariant),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledButton.tonal(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            colorScheme.primaryContainer.withOpacity(0.15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          AppStrings.cancel,
                          style: textTheme.labelLarge
                              ?.copyWith(color: colorScheme.primaryContainer),
                        ),
                      ),
                      const SizedBox(width: 16),
                      FilledButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            colorScheme.primaryContainer,
                          ),
                        ),
                        onPressed: () async {
                          await cubit.saveEmployee(context);
                        },
                        child: Text(AppStrings.save),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildFromContent(
    AddEmployeeCubit cubit,
    ColorScheme colorScheme,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildFromChips(
                cubit: cubit,
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
              _buildFromCalendar(
                cubit: cubit,
                colorScheme: colorScheme,
              ),
            ],
          ),
        ),
        Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.event_outlined,
                        color: colorScheme.primaryContainer,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      ValueListenableBuilder(
                        valueListenable: cubit.selectedFromDay,
                        builder: (context, value, child) => Text(
                          DateFormat('dd MMM yyyy').format(
                            value ?? DateTime(0),
                          ),
                          style: textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledButton.tonal(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            colorScheme.primaryContainer.withOpacity(0.15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          cubit.selectedFromIndex.value = 0;
                          cubit.selectedFromDay.value = DateTime.now();
                        },
                        child: Text(
                          AppStrings.cancel,
                          style: textTheme.labelLarge
                              ?.copyWith(color: colorScheme.primaryContainer),
                        ),
                      ),
                      const SizedBox(width: 16),
                      FilledButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            colorScheme.primaryContainer,
                          ),
                        ),
                        onPressed: () {
                          context.pop(
                            DateFormat('dd MMM yyyy').format(
                              cubit.selectedFromDay.value ?? DateTime(0),
                            ),
                          );
                        },
                        child: Text(AppStrings.save),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildToContent(
    AddEmployeeCubit cubit,
    ColorScheme colorScheme,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildToChips(
                cubit: cubit,
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
              _buildToCalendar(
                cubit: cubit,
                colorScheme: colorScheme,
              ),
            ],
          ),
        ),
        Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.event_outlined,
                        color: colorScheme.primaryContainer,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      ValueListenableBuilder(
                        valueListenable: cubit.selectedToDay,
                        builder: (context, value, child) => Text(
                          value == null
                              ? AppStrings.noDateHint
                              : DateFormat('dd MMM yyyy').format(value),
                          style: textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledButton.tonal(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            colorScheme.primaryContainer.withOpacity(0.15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          AppStrings.cancel,
                          style: textTheme.labelLarge
                              ?.copyWith(color: colorScheme.primaryContainer),
                        ),
                      ),
                      const SizedBox(width: 16),
                      FilledButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            colorScheme.primaryContainer,
                          ),
                        ),
                        onPressed: () {
                          context.pop(
                            cubit.selectedToDay.value == null
                                ? null
                                : DateFormat('dd MMM yyyy').format(
                                    cubit.selectedToDay.value ?? DateTime(0),
                                  ),
                          );
                        },
                        child: Text(AppStrings.save),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  ValueListenableBuilder<int> _buildFromChips({
    required AddEmployeeCubit cubit,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return ValueListenableBuilder(
      valueListenable: cubit.selectedFromIndex,
      builder: (context, value, child) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FilledButton.tonal(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                      ),
                    ),
                    backgroundColor: value == 0
                        ? WidgetStatePropertyAll(
                            colorScheme.primaryContainer,
                          )
                        : WidgetStatePropertyAll(
                            colorScheme.primaryContainer.withOpacity(0.15),
                          ),
                  ),
                  onPressed: () {
                    cubit.selectedFromIndex.value = 0;
                    cubit.selectedFromDay.value = DateTime.now();
                  },
                  child: Text(
                    AppStrings.today,
                    style: textTheme.labelLarge?.copyWith(
                      color: value == 0
                          ? colorScheme.onPrimary
                          : colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton.tonal(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                      ),
                    ),
                    backgroundColor: value == 1
                        ? WidgetStatePropertyAll(
                            colorScheme.primaryContainer,
                          )
                        : WidgetStatePropertyAll(
                            colorScheme.primaryContainer.withOpacity(0.15),
                          ),
                  ),
                  onPressed: () {
                    cubit.selectedFromIndex.value = 1;
                    cubit.selectedFromDay.value =
                        cubit.nextWeekday(DateTime.now(), DateTime.monday);
                  },
                  child: Text(
                    AppStrings.nextMon,
                    style: textTheme.labelLarge?.copyWith(
                      color: value == 1
                          ? colorScheme.onPrimary
                          : colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton.tonal(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                        ),
                      ),
                      backgroundColor: value == 2
                          ? WidgetStatePropertyAll(
                              colorScheme.primaryContainer,
                            )
                          : WidgetStatePropertyAll(
                              colorScheme.primaryContainer.withOpacity(0.15),
                            ),
                    ),
                    onPressed: () {
                      cubit.selectedFromIndex.value = 2;
                      cubit.selectedFromDay.value =
                          cubit.nextWeekday(DateTime.now(), DateTime.tuesday);
                    },
                    child: Text(
                      AppStrings.nextTue,
                      style: textTheme.labelLarge?.copyWith(
                        color: value == 2
                            ? colorScheme.onPrimary
                            : colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton.tonal(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      backgroundColor: value == 3
                          ? WidgetStatePropertyAll(colorScheme.primaryContainer)
                          : WidgetStatePropertyAll(
                              colorScheme.primaryContainer.withOpacity(0.15),
                            ),
                    ),
                    onPressed: () {
                      cubit.selectedFromIndex.value = 3;
                      cubit.selectedFromDay.value =
                          DateTime.now().add(const Duration(days: 7));
                    },
                    child: Text(
                      AppStrings.afterWeek,
                      style: textTheme.labelLarge?.copyWith(
                        color: value == 3
                            ? colorScheme.onPrimary
                            : colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ValueListenableBuilder<int> _buildToChips({
    required AddEmployeeCubit cubit,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return ValueListenableBuilder(
      valueListenable: cubit.selectedToIndex,
      builder: (context, value, child) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FilledButton.tonal(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    backgroundColor: value == 0
                        ? WidgetStatePropertyAll(colorScheme.primaryContainer)
                        : WidgetStatePropertyAll(
                            colorScheme.primaryContainer.withOpacity(0.15),
                          ),
                  ),
                  onPressed: () {
                    cubit.selectedToIndex.value = 0;
                    cubit.selectedToDay.value = null;
                  },
                  child: Text(
                    AppStrings.noDateHint,
                    style: textTheme.labelLarge?.copyWith(
                      color: value == 0
                          ? colorScheme.onPrimary
                          : colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton.tonal(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    backgroundColor: value == 1
                        ? WidgetStatePropertyAll(colorScheme.primaryContainer)
                        : WidgetStatePropertyAll(
                            colorScheme.primaryContainer.withOpacity(0.15),
                          ),
                  ),
                  onPressed: () {
                    cubit.selectedToIndex.value = 1;
                    cubit.selectedToDay.value = DateTime.now();
                  },
                  child: Text(
                    AppStrings.today,
                    style: textTheme.labelLarge?.copyWith(
                      color: value == 1
                          ? colorScheme.onPrimary
                          : colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ValueListenableBuilder<DateTime> _buildFromCalendar({
    required AddEmployeeCubit cubit,
    required ColorScheme colorScheme,
  }) {
    return ValueListenableBuilder(
      valueListenable: cubit.focusedFromDay,
      builder: (context, focusedDay, child) => ValueListenableBuilder(
        valueListenable: cubit.selectedFromDay,
        builder: (context, selectedDay, child) => TableCalendar<String?>(
          firstDay: DateTime.now(),
          lastDay: DateTime(
            DateTime.now().year,
            DateTime.now().month + 3,
            0,
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            rightChevronIcon: Icon(
              Icons.arrow_right_rounded,
              size: 48,
              color: colorScheme.outlineVariant,
            ),
            leftChevronIcon: Icon(
              Icons.arrow_left_rounded,
              size: 48,
              color: colorScheme.outlineVariant,
            ),
            headerPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
          focusedDay: focusedDay,
          selectedDayPredicate: (day) => isSameDay(selectedDay, day),
          rowHeight: 42,
          availableGestures: AvailableGestures.none,
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: colorScheme.primaryContainer),
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(color: colorScheme.onPrimary),
            todayTextStyle: TextStyle(
              color: !isSameDay(selectedDay, focusedDay)
                  ? colorScheme.primaryContainer
                  : colorScheme.onPrimary,
            ),
            selectedDecoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            markersMaxCount: 0,
            markerSize: 0,
          ),
        ),
      ),
    );
  }

  ValueListenableBuilder<DateTime> _buildToCalendar({
    required AddEmployeeCubit cubit,
    required ColorScheme colorScheme,
  }) {
    return ValueListenableBuilder(
      valueListenable: cubit.focusedToDay,
      builder: (context, focusedDay, child) => ValueListenableBuilder(
        valueListenable: cubit.selectedToDay,
        builder: (context, selectedDay, child) => TableCalendar<String?>(
          firstDay: DateTime.now(),
          lastDay: DateTime(
            DateTime.now().year,
            DateTime.now().month + 3,
            0,
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            rightChevronIcon: Icon(
              Icons.arrow_right_rounded,
              size: 48,
              color: colorScheme.outlineVariant,
            ),
            leftChevronIcon: Icon(
              Icons.arrow_left_rounded,
              size: 48,
              color: colorScheme.outlineVariant,
            ),
            headerPadding: const EdgeInsets.symmetric(horizontal: 24),
          ),
          focusedDay: focusedDay,
          rowHeight: 42,
          availableGestures: AvailableGestures.none,
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: selectedDay != null
                  ? colorScheme.primaryContainer
                  : Colors.transparent,
              border: Border.all(
                color: selectedDay == null
                    ? Colors.transparent
                    : colorScheme.primaryContainer,
              ),
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(color: colorScheme.onPrimary),
            todayTextStyle: TextStyle(
              color: selectedDay == null
                  ? colorScheme.primaryContainer
                  : colorScheme.onPrimary,
            ),
            selectedDecoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            markersMaxCount: 0,
            markerSize: 0,
          ),
        ),
      ),
    );
  }
}
