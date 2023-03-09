import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sport_manager/components/home_page/calendar_page/calendar_main.dart';

import '../../../classes/task_model.dart';
import '../../../services/firebase_service.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();
    LinkedHashMap<DateTime, List<TaskModel>> events;
    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder(
          future: service.getAllUserEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                events = snapshot.data!;
                return CalendarMain(
                  parentConstraints: constraints,
                  events: events,
                );
              } else {
                return const Text("Something went Wrong");
              }
            } else {
              return const Text("Wait a second");
            }
          });
    });
  }
}
