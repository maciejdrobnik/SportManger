import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sport_manager/components/home_page/calendar_page/calendar_task.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../assets/constants.dart' as constants;
import '../home_blue_button.dart';

class CalendarMain extends StatelessWidget {
  const CalendarMain({Key? key}) : super(key: key);

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
              focusedDay: DateTime.now(),
              firstDay: DateTime(2023, 2, 27),
              lastDay: DateTime(2023, 3, 5),
              calendarFormat: CalendarFormat.week,
              headerVisible: false,
              rowHeight: constants.calendarRowHeight,
            ),
          ),
          const Flexible(
              flex: constants.calendarTaskFlex, child: CalendarTask()),
        ],
      );
    });
  }
}
