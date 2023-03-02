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
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Expanded(
            flex: constants.calendarTaskNameFlex,
            child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Training",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text("Tactical training for FC Ball",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff123456).withOpacity(0.6),
                        ))
                  ],
                ))),
        Flexible(
            flex: constants.calendarTaskTimeFlex,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "10:00",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff123456).withOpacity(0.6),
                  ),
                ),
                Text(
                  "12:00",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff123456).withOpacity(0.6),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
