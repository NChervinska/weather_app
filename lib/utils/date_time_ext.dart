import 'package:intl/intl.dart';

final format = DateFormat('E HH:MM');

extension DateTimeExt on DateTime {
  static DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json * 1000);
  }

  String getString() {
    return format.format(this);
  }
}
