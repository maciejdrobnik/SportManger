import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String name;
  final List<dynamic> assignees;
  final String description;
  final Timestamp end;
  final Timestamp start;
  final String type;

  const TaskModel(
      {required this.id,
      required this.name,
      required this.assignees,
      required this.description,
      required this.end,
      required this.start,
      required this.type});
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}
