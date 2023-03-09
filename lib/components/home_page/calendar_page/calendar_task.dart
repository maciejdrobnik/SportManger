import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sport_manager/classes/task_model.dart';
import 'package:sport_manager/services/convert_timestamp.dart';
import '../../../assets/constants.dart' as constants;

class CalendarTask extends StatelessWidget {
  final BoxConstraints parentConstraints;
  final DateTime selectedDate;
  final List<TaskModel> tasks;
  const CalendarTask(
      {super.key,
      required this.parentConstraints,
      required this.selectedDate,
      required this.tasks});

  @override
  Widget build(BuildContext context) {
    ConvertTimestampService timeService = ConvertTimestampService();
    return tasks.isNotEmpty
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: constants.calendarTaskWhiteBoxFlex, child: Container()),
              Flexible(
                flex: constants.calendarTaskYellowBoxFlex,
                child: Container(
                  height: constants.calendarTaskYellowBoxHeight *
                      parentConstraints.maxHeight,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(
                        constants.calendarYellowBoxBorderRadius),
                  ),
                ),
              ),
              Expanded(
                  flex: constants.calendarTaskNameFlex,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: parentConstraints.maxWidth *
                              constants.calendarTaskNamePaddingLeft),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            tasks.first.name,
                            minFontSize: constants.calendarTaskNameMinFontSize,
                            maxFontSize: constants.calendarTaskNameMaxFontSize,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          AutoSizeText(tasks.first.description,
                              minFontSize:
                                  constants.calendarTaskDescriptionMinFontSize,
                              maxFontSize:
                                  constants.calendarTaskDescriptionMaxFontSize,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color(constants.homePageTextColor)
                                    .withOpacity(
                                        constants.homePageLowerOpacity),
                              ))
                        ],
                      ))),
              Flexible(
                  flex: constants.calendarTaskTimeFlex,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: constants.calendarBetweenHoursPadding *
                                parentConstraints.maxHeight),
                        child: Text(
                          timeService.getHourFromTimeStamp(tasks.first.start),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: const Color(constants.homePageTextColor)
                                .withOpacity(constants.homePageLowerOpacity),
                          ),
                        ),
                      ),
                      Text(
                        timeService.getHourFromTimeStamp(tasks.first.end),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: const Color(constants.homePageTextColor)
                              .withOpacity(constants.homePageLowerOpacity),
                        ),
                      )
                    ],
                  ))
            ],
          )
        : const Text("No task for today");
  }
}
