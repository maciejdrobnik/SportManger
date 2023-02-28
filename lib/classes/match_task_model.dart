import 'package:sport_manager/classes/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchTaskModel extends TaskModel {
  final String dressingRoom;
  final Timestamp arrival;
  final String materials;
  final String pitch;
  final String place;
  final String referee;
  final String team1Id;
  final String team1Name;
  final String team1Logo;
  final String team2Id;
  final String team2Name;
  final String team2Logo;

  MatchTaskModel(
      {required super.id,
      required super.assignees,
      required super.description,
      required super.end,
      required super.start,
      required super.type,
      required this.dressingRoom,
      required this.arrival,
      required this.materials,
      required this.pitch,
      required this.place,
      required this.referee,
      required this.team1Id,
      required this.team1Name,
      required this.team1Logo,
      required this.team2Id,
      required this.team2Name,
      required this.team2Logo});
}
