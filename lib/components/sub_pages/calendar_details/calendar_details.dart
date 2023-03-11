import 'package:flutter/material.dart';
import '../../home_page/sponsor.dart';
import '../../home_page/white_container.dart';
import 'calendar_details_content.dart';
import '../../../assets/constants.dart' as constants;

class CalendarDetails extends StatelessWidget {
  const CalendarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(constants.primaryBlue),
          title: const Text("Calendar"),
          centerTitle: true,
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
              color: const Color(constants.homePageBackground),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: constants.homePagePaddingHorizontal *
                          constraints.maxWidth,
                      right: constants.homePagePaddingHorizontal *
                          constraints.maxWidth,
                      top: constants.calendarDetailsPaddingTop *
                          constraints.maxHeight),
                  child: Column(children: const [
                    WhiteContainer(
                        flexValue: constants.calendarDetailsCalendarFlex,
                        content: CalendarDetailsContent()),
                    Sponsor(),
                  ])));
        }));
  }
}
