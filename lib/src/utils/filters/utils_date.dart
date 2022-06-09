import 'package:flutter/material.dart';

Future<DateTimeRange?> showDateRangePicker({
  required BuildContext context,
  DateTimeRange? initialDateRange,
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? currentDate,
  DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  String? helpText,
  String? cancelText,
  String? confirmText,
  String? saveText,
  String? errorFormatText,
  String? errorInvalidText,
  String? errorInvalidRangeText,
  String? fieldStartHintText,
  String? fieldEndHintText,
  String? fieldStartLabelText,
  String? fieldEndLabelText,
  Locale? locale,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  Offset? anchorPoint,
}) async {
  assert(context != null);
  assert(
    initialDateRange == null ||
        (initialDateRange.start != null && initialDateRange.end != null),
    'initialDateRange must be null or have non-null start and end dates.',
  );
  assert(
    initialDateRange == null ||
        !initialDateRange.start.isAfter(initialDateRange.end),
    "initialDateRange's start date must not be after it's end date.",
  );
  initialDateRange =
      initialDateRange == null ? null : DateUtils.datesOnly(initialDateRange);
  assert(firstDate != null);
  firstDate = DateUtils.dateOnly(firstDate);
  assert(lastDate != null);
  lastDate = DateUtils.dateOnly(lastDate);
  assert(
    !lastDate.isBefore(firstDate),
    'lastDate $lastDate must be on or after firstDate $firstDate.',
  );
  assert(
    initialDateRange == null || !initialDateRange.start.isBefore(firstDate),
    "initialDateRange's start date must be on or after firstDate $firstDate.",
  );
  assert(
    initialDateRange == null || !initialDateRange.end.isBefore(firstDate),
    "initialDateRange's end date must be on or after firstDate $firstDate.",
  );
  assert(
    initialDateRange == null || !initialDateRange.start.isAfter(lastDate),
    "initialDateRange's start date must be on or before lastDate $lastDate.",
  );
  assert(
    initialDateRange == null || !initialDateRange.end.isAfter(lastDate),
    "initialDateRange's end date must be on or before lastDate $lastDate.",
  );
  currentDate = DateUtils.dateOnly(currentDate ?? DateTime.now());
  assert(initialEntryMode != null);
  assert(useRootNavigator != null);
  assert(debugCheckHasMaterialLocalizations(context));

  Widget dialog = DateRangePickerDialog(
    initialDateRange: initialDateRange,
    firstDate: firstDate,
    lastDate: lastDate,
    currentDate: currentDate,
    initialEntryMode: initialEntryMode,
    helpText: helpText,
    cancelText: cancelText,
    confirmText: confirmText,
    saveText: saveText,
    errorFormatText: errorFormatText,
    errorInvalidText: errorInvalidText,
    errorInvalidRangeText: errorInvalidRangeText,
    fieldStartHintText: fieldStartHintText,
    fieldEndHintText: fieldEndHintText,
    fieldStartLabelText: fieldStartLabelText,
    fieldEndLabelText: fieldEndLabelText,
  );

  if (textDirection != null) {
    dialog = Directionality(
      textDirection: textDirection,
      child: dialog,
    );
  }

  if (locale != null) {
    dialog = Localizations.override(
      context: context,
      locale: locale,
      child: dialog,
    );
  }

  return showDialog<DateTimeRange>(
    context: context,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    useSafeArea: false,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    anchorPoint: anchorPoint,
  );
}
