import 'package:flutter/material.dart';
import 'package:sport_manager/services/firebase_service.dart';
import './../../assets/constants.dart' as constants;
import './home_blue_button.dart';
import './home_yellow_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sport_manager/services/convert_timestamp.dart';

class Chores extends StatelessWidget {
  const Chores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = FirebaseService();
    ConvertTimestampService timestampService = ConvertTimestampService();

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return FutureBuilder(
          future: firebaseService.getUserMatches(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return Column(
                    children: [
                      Flexible(
                        flex: constants.choresBlueButtonFlex,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight *
                                  constants.choresPaddingTop),
                          child: const HomeBlueButton(
                            content: "Chores",
                            minBlueButtonFontSize:
                                constants.minBlueButtonFontSize,
                            maxBlueButtonFontSize:
                                constants.maxBlueButtonFontSize,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: constants.choresDateFlex,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight *
                                  constants.choresDateVerticalPadding),
                          child: AutoSizeText(
                            "${timestampService.getDayandMonthFromTimeStamp(snapshot.data!.first.start)} til ${timestampService.getDayandMonthFromTimeStamp(snapshot.data!.first.end)}",
                            maxLines: 1,
                            maxFontSize: constants.choresMaxDateFontSize,
                            minFontSize: constants.choresMinDateFontSize,
                            style: const TextStyle(
                              color: Color(constants.homePageTextColor),
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: constants.choresAssigneesFlex,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constraints.maxHeight *
                                  constants.choresAssigneesVerticalPadding),
                          child: Column(
                            children: snapshot.data![0].assignees.map((e) {
                              return Container(
                                padding: EdgeInsets.only(
                                    top: constraints.maxHeight *
                                        constants.choresAssigneesLineHeight),
                                child: AutoSizeText(
                                  e,
                                  maxLines: 1,
                                  maxFontSize:
                                      constants.choresMaxAssigneesFontSize,
                                  minFontSize:
                                      constants.choresMinAssigneesFontSize,
                                  style: const TextStyle(
                                    color: Color(constants.homePageTextColor),
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: constants.choresYellowButtonFlex,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: constraints.maxHeight *
                                  constants.choresPaddingBottom),
                          child: const HomeYellowButton(
                            content: "Tasklist",
                            minYellowButtonFontSize:
                                constants.minYellowButtonFontSize,
                            maxYellowButtonFontSize:
                                constants.maxYellowButtonFontSize,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text("There are no chores in your team");
                }
              } else if (snapshot.hasError) {
                return const Text("Something went wrong");
              } else {
                return const Text("I don't know what else can happen");
              }
            } else {
              return const Text("Wait a second");
            }
          });
    });
  }
}
