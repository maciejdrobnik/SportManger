import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sport_manager/services/convert_timestamp.dart';
import 'package:sport_manager/services/firebase_service.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../assets/constants.dart' as constants;
import '../../../classes/task_model.dart';
import '../home_blue_button.dart';
import 'calendar_task.dart';

class CalendarMain extends StatefulWidget {
  const CalendarMain({Key? key}) : super(key: key);

  @override
  State<CalendarMain> createState() => _CalendarMainState();
}

class _CalendarMainState extends State<CalendarMain> {
  ConvertTimestampService timeService = ConvertTimestampService();
  FirebaseService service = FirebaseService();
  late DateTime selectedDay;
  String month = "";
  late LinkedHashMap<DateTime, List<TaskModel>> events;
  var kEvents = <DateTime, List<TaskModel>>{};

  @override
  void initState() {
    super.initState();
    selectedDay = DateTime.now();
    month = timeService.getMonthFromNumber(selectedDay.month);
  }

  void _changeSelectedDay(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
    });
  }

  List<TaskModel> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<TaskModel> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder(
          future: service.getAllUserEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                events = snapshot.data!;
                kEvents = LinkedHashMap<DateTime, List<TaskModel>>(
                  equals: isSameDay,
                  hashCode: getHashCode,
                )..addAll(events);
                return Column(
                  children: [
                    Flexible(
                      flex: constants.calendarBlueButtonFlex,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: constants.calendarPaddingTop *
                                constraints.maxHeight),
                        child: const HomeBlueButton(
                            content: "Calendar",
                            minBlueButtonFontSize:
                                constants.minBlueButtonFontSize,
                            maxBlueButtonFontSize:
                                constants.maxBlueButtonFontSize),
                      ),
                    ),
                    Flexible(
                      flex: constants.calendarFlex,
                      child: Column(
                        children: [
                          TableCalendar<TaskModel>(
                            focusedDay: selectedDay,
                            eventLoader: _getEventsForDay,
                            firstDay: DateTime(2022, 2, 27),
                            lastDay: DateTime(2024, 3, 5),
                            calendarFormat: CalendarFormat.week,
                            rowHeight: constants.calendarRowHeight,
                            onDaySelected: _changeSelectedDay,
                            selectedDayPredicate: (day) =>
                                isSameDay(day, selectedDay),
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            //! The styling of calendar. We will need to discuss it. It has some strange behaviours
                            calendarStyle: const CalendarStyle(
                                isTodayHighlighted: false,
                                selectedDecoration: BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                                cellMargin: EdgeInsets.all(4),
                                defaultTextStyle: TextStyle(fontSize: 12),
                                todayTextStyle: TextStyle(fontSize: 12),
                                outsideTextStyle: TextStyle(fontSize: 12),
                                selectedTextStyle: TextStyle(fontSize: 12),
                                weekendTextStyle: TextStyle(fontSize: 12)),
                            headerStyle: HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                              headerPadding: EdgeInsets.only(
                                  left: constants.calendarMonthTextPaddingLeft *
                                      constraints.maxWidth,
                                  top: constants.calendarMonthTextPaddingTop *
                                      constraints.maxHeight,
                                  bottom: 6,
                                  right: 10),
                              // leftChevronVisible: false,
                              // rightChevronVisible: false,
                              leftChevronPadding: const EdgeInsets.all(0),
                              leftChevronMargin: const EdgeInsets.all(0),
                              leftChevronIcon: const Icon(
                                Icons.chevron_left,
                                size: 19,
                              ),
                              rightChevronPadding: const EdgeInsets.all(0),
                              rightChevronMargin: const EdgeInsets.all(0),
                              rightChevronIcon: const Icon(
                                Icons.chevron_right,
                                size: 19,
                              ),
                              titleTextStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: constants.calendarTaskFlex,
                        child: CalendarTask(
                          parentConstraints: constraints,
                          selectedDate: selectedDay,
                        )),
                  ],
                );
              } else {
                return const Text("Something went wrong");
              }
            } else {
              return const Text("Wait a Second");
            }
          });
    });
  }
}
