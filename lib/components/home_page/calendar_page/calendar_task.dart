import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sport_manager/services/convert_timestamp.dart';
import 'package:sport_manager/services/firebase_service.dart';
import '../../../assets/constants.dart' as constants;

class CalendarTask extends StatelessWidget {
  final BoxConstraints parentConstraints;
  final DateTime selectedDate;
  const CalendarTask(
      {super.key, required this.parentConstraints, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();
    ConvertTimestampService timeService = ConvertTimestampService();
    return FutureBuilder(
      future: service.getTasks(selectedDate),
      builder: (context, snapshot) {
        return Row(
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
                          snapshot.data!.first.name,
                          minFontSize: constants.calendarTaskNameMinFontSize,
                          maxFontSize: constants.calendarTaskNameMaxFontSize,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        AutoSizeText(snapshot.data!.first.description,
                            minFontSize:
                                constants.calendarTaskDescriptionMinFontSize,
                            maxFontSize:
                                constants.calendarTaskDescriptionMaxFontSize,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: const Color(constants.homePageTextColor)
                                  .withOpacity(constants.homePageLowerOpacity),
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
                        timeService
                            .getHourFromTimeStamp(snapshot.data!.first.start),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: const Color(constants.homePageTextColor)
                              .withOpacity(constants.homePageLowerOpacity),
                        ),
                      ),
                    ),
                    Text(
                      timeService
                          .getHourFromTimeStamp(snapshot.data!.first.end),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: const Color(constants.homePageTextColor)
                            .withOpacity(constants.homePageLowerOpacity),
                      ),
                    )
                  ],
                ))
          ],
        );
      },
    );
  }
}
