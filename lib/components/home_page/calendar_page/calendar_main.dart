import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sport_manager/services/convert_timestamp.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../assets/constants.dart' as constants;
import '../../../classes/task_model.dart';
import '../../sub_pages/calendar_details/calendar_details.dart';
import '../home_blue_button.dart';
import 'calendar_task.dart';

class CalendarMain extends StatefulWidget {
  final BoxConstraints parentConstraints;
  final LinkedHashMap<DateTime, List<TaskModel>> events;
  const CalendarMain(
      {Key? key, required this.parentConstraints, required this.events})
      : super(key: key);

  @override
  State<CalendarMain> createState() => _CalendarMainState();
}

class _CalendarMainState extends State<CalendarMain> {
  ConvertTimestampService timeService = ConvertTimestampService();
  late DateTime selectedDay;
  String month = "";
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

  @override
  Widget build(BuildContext context) {
    kEvents = LinkedHashMap<DateTime, List<TaskModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(widget.events);
    late final Color decorationColor;
    final dayFontSize =
        constants.calendarDayFontSize * widget.parentConstraints.maxHeight;
    late final Color dayFontColor;
    if (_getEventsForDay(selectedDay).isNotEmpty) {
      switch (_getEventsForDay(selectedDay).first.type) {
        case 'match':
          decorationColor = const Color(constants.matchTaskColor);
          dayFontColor = const Color(constants.matchTaskFontColor);
          break;
        case 'training':
          decorationColor = const Color(constants.trainingTaskColor);
          dayFontColor = const Color(constants.trainingTaskFontColor);
          break;
        default:
          decorationColor = const Color(constants.otherTaskColor);
          dayFontColor = const Color(constants.otherTaskFontColor);
          break;
      }
    } else {
      decorationColor = const Color(constants.noTaskColor);
      dayFontColor = const Color(constants.noTaskFontColor);
    }
    return Column(
      children: [
        Flexible(
          flex: constants.calendarBlueButtonFlex,
          child: Padding(
              padding: EdgeInsets.only(
                  top: constants.calendarPaddingTop *
                      widget.parentConstraints.maxHeight),
              child: HomeBlueButton(
                  content: "Calendar",
                  minBlueButtonFontSize: constants.minBlueButtonFontSize,
                  maxBlueButtonFontSize: constants.maxBlueButtonFontSize,
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalendarDetails()));
                  })),
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
                rowHeight: constants.calendarRowHeight *
                    widget.parentConstraints.maxHeight,
                onDaySelected: _changeSelectedDay,
                selectedDayPredicate: (day) => isSameDay(day, selectedDay),
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                    isTodayHighlighted: false,
                    selectedDecoration: BoxDecoration(
                      color: decorationColor,
                      shape: BoxShape.circle,
                    ),
                    cellMargin: EdgeInsets.all(constants.calendarCircleMargin *
                        widget.parentConstraints.maxHeight),
                    defaultTextStyle: TextStyle(fontSize: dayFontSize),
                    todayTextStyle: TextStyle(fontSize: dayFontSize),
                    outsideTextStyle: TextStyle(fontSize: dayFontSize),
                    selectedTextStyle:
                        TextStyle(fontSize: dayFontSize, color: dayFontColor),
                    weekendTextStyle: TextStyle(fontSize: dayFontSize)),
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  headerPadding: EdgeInsets.only(
                    top: constants.calendarMonthTextPaddingTop *
                        widget.parentConstraints.maxHeight,
                    bottom: constants.calendarMonthTextPaddingBottom *
                        widget.parentConstraints.maxHeight,
                    left: constants.calendarMonthTextPaddingLeft *
                        widget.parentConstraints.maxWidth,
                    right: constants.calendarMonthTextPaddingRight *
                        widget.parentConstraints.maxWidth,
                  ),
                  leftChevronPadding: const EdgeInsets.all(0),
                  leftChevronMargin: const EdgeInsets.all(0),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    size: constants.arrowSize *
                        widget.parentConstraints.maxHeight,
                  ),
                  rightChevronPadding: const EdgeInsets.all(0),
                  rightChevronMargin: const EdgeInsets.all(0),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    size: constants.arrowSize *
                        widget.parentConstraints.maxHeight,
                  ),
                  titleTextStyle: TextStyle(
                      fontSize: constants.calendarTitleFontSize *
                          widget.parentConstraints.maxHeight),
                ),
              ),
            ],
          ),
        ),
        Flexible(
            flex: constants.calendarTaskFlex,
            child: CalendarTask(
              parentConstraints: widget.parentConstraints,
              selectedDate: selectedDay,
              tasks: _getEventsForDay(selectedDay),
              decorationColor: decorationColor,
            )),
      ],
    );
  }
}
