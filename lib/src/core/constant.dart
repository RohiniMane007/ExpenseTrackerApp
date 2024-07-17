import 'package:flutter/material.dart';

Future<DateTime?> dateTimePicker(BuildContext context) {
  return showDatePicker(
      barrierDismissible: false,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1991),
      lastDate: DateTime(2050),
      initialEntryMode: DatePickerEntryMode.calendarOnly);
}