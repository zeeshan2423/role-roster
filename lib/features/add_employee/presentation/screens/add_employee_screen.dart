import 'package:role_roster/core/constants/imports.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    controller: TextEditingController(),
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
                      controller: TextEditingController(),
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
                          controller:
                              TextEditingController(text: AppStrings.today),
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
                          controller: TextEditingController(),
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
                        onPressed: () {},
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
}
