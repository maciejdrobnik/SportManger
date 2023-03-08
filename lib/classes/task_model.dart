import 'package:cloud_firestore/cloud_firestore.dart';

enum TasksTypes { match, training, other }

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
