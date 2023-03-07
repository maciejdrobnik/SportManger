import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../assets/constants.dart' as constants;
import '../home_blue_button.dart';
import 'calendar_task.dart';

class CalendarMain extends StatefulWidget {
  const CalendarMain({Key? key}) : super(key: key);

  @override
  State<CalendarMain> createState() => _CalendarMainState();
}

class _CalendarMainState extends State<CalendarMain> {
  DateTime selectedDay = DateTime.now();
  void _changeSelectedDay(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Flexible(
            flex: constants.calendarBlueButtonFlex,
            child: Padding(
              padding: EdgeInsets.only(
                  top: constants.calendarPaddingTop * constraints.maxHeight),
              child: const HomeBlueButton(
                  content: "Calendar",
                  minBlueButtonFontSize: constants.minBlueButtonFontSize,
                  maxBlueButtonFontSize: constants.maxBlueButtonFontSize),
            ),
          ),
          Flexible(
            flex: constants.calendarMonthFlex,
            child: Padding(
                padding: EdgeInsets.only(
                    left: constants.calendarMonthTextPaddingLeft *
                        constraints.maxWidth,
                    top: constants.calendarMonthTextPaddingTop *
                        constraints.maxHeight),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "March",
                      minFontSize: constants.calendarMonthTextMinFontSize,
                      maxFontSize: constants.calendarMonthTextMaxFontSize,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ))),
          ),
          Flexible(
            flex: constants.calendarFlex,
            child: TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(2022, 2, 27),
              lastDay: DateTime(2024, 3, 5),
              calendarFormat: CalendarFormat.week,
              headerVisible: false,
              rowHeight: constants.calendarRowHeight,
              onDaySelected: _changeSelectedDay,
              selectedDayPredicate: (day) => isSameDay(day, selectedDay),
              startingDayOfWeek: StartingDayOfWeek.monday,
              //! The styling of calendar. We will need to discuss it. It has some strange behaviours
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: false,
                selectedDecoration: BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
              ),
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
    });
  }
}
