import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sport_manager/components/home_page/home_yellow_button.dart';
import 'package:sport_manager/components/home_page/program_page/teams_row.dart';
import 'package:sport_manager/components/sub_pages/program_details.dart';
import 'package:sport_manager/services/convert_timestamp.dart';
import '../../../services/firebase_service.dart';
import '../../../assets/constants.dart' as constants;
import '../home_blue_button.dart';

class ProgramMain extends StatelessWidget {
  const ProgramMain({Key? key}) : super(key: key);

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
                        flex: constants.programBlueButtonFlex,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight *
                                  constants.programPaddingTop),
                          child: const HomeBlueButton(
                            content: "Program",
                            minBlueButtonFontSize:
                                constants.minBlueButtonFontSize,
                            maxBlueButtonFontSize:
                                constants.maxBlueButtonFontSize,
                          ),
                        ),
                      ),
                      TeamsRow(
                          dataSnapshot: snapshot,
                          parentConstraints: constraints),
                      Flexible(
                          flex: constants.programYellowButtonFlex,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: constraints.maxHeight *
                                      constants.programPaddingBottom),
                              child: HomeYellowButton(
                                content: "Match Information",
                                minYellowButtonFontSize:
                                    constants.minYellowButtonFontSize,
                                maxYellowButtonFontSize:
                                    constants.maxYellowButtonFontSize,
                                onClick: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProgramDetails()));
                                },
                              ))),
                    ],
                  );
                } else {
                  return const Text("There are no matches for you");
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
