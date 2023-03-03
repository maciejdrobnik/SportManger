import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../assets/constants.dart' as constants;

class CalendarTask extends StatelessWidget {
  final BoxConstraints parentConstraints;
  const CalendarTask({super.key, required this.parentConstraints});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(flex: constants.calendarTaskWhiteBoxFlex, child: Container()),
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
                    const AutoSizeText(
                      "Training",
                      minFontSize: constants.calendarTaskNameMinFontSize,
                      maxFontSize: constants.calendarTaskNameMaxFontSize,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    AutoSizeText("Tactical training for FC Ball",
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
                    "10:00",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: const Color(constants.homePageTextColor)
                          .withOpacity(constants.homePageLowerOpacity),
                    ),
                  ),
                ),
                Text(
                  "12:00",
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
  }
}
