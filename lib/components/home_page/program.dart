import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sport_manager/components/home_page/home_yellow_button.dart';
import './../../assets/constants.dart' as constants;
import 'home_blue_button.dart';

/// The structure of this component is like this. First you have white box as a main container.
/// Inside the box there is a main column with 3 children:

class Program extends StatelessWidget {
  const Program({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          Flexible(
            flex: constants.programBlueButtonFlex,
            child: Padding(
              padding: EdgeInsets.only(
                  top: constraints.maxHeight * constants.programPaddingTop),
              child: const HomeBlueButton(
                content: "Program",
                minBlueButtonFontSize: constants.minBlueButtonFontSize,
                maxBlueButtonFontSize: constants.maxBlueButtonFontSize,
              ),
            ),
          ),
          Flexible(
            flex: constants.programDateFlex,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: constraints.maxHeight *
                        constants.programDateVerticalPadding),
                child: const AutoSizeText(
                  "Sunday February 13 2022",
                  maxLines: 1,
                  maxFontSize: constants.programMaxDateFontSize,
                  minFontSize: constants.programMinDateFontSize,
                  style: TextStyle(
                    color: Color(constants.homePageTextColor),
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.visible,
                  ),
                )),
          ),
          Flexible(
            flex: constants.programTeamsRowFlex,
            child: Padding(
              padding: EdgeInsets.only(
                  left: constraints.maxWidth * constants.programRowPaddingLeft,
                  right:
                      constraints.maxWidth * constants.programRowPaddingRight),
              child: Row(
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Flexible(
                              flex: constants.programTeamLogoFlex,
                              child: Image.asset("lib/assets/images/logo1.png"),
                            ),
                            Flexible(
                              flex: constants.programBreakBetweenLogAndNameFlex,
                              child: Container(),
                            ),
                            const Flexible(
                                flex: constants.programTeamNameFlex,
                                child: Text("Team1")),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:constraints.maxHeight * constants.programHourPaddingTop),
                          child:const AutoSizeText(
                          "14:00",
                          minFontSize: constants.programMinHourFontSize,
                          maxFontSize: constants.programMaxHourFontSize,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ),
                        Column(
                          children: [
                            Flexible(
                              flex: constants.programTeamLogoFlex,
                              child: Image.asset("lib/assets/images/logo2.png"),
                            ),
                            Flexible(
                                flex:
                                    constants.programBreakBetweenLogAndNameFlex,
                                child: Container()),
                            const Flexible(
                                flex: constants.programTeamNameFlex,
                                child: Text("Team2")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: constants.programIconSize,
                      ),
                      SizedBox(
                        height: constants.programRaiseDateAndIcon,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
              flex: constants.programYellowButtonFlex,
              child: Padding(
                  padding: EdgeInsets.only(
                      bottom: constraints.maxHeight *
                          constants.programPaddingBottom),
                  child: const HomeYellowButton(
                    content: "Match Information",
                    minYellowButtonFontSize: constants.minYellowButtonFontSize,
                    maxYellowButtonFontSize: constants.maxYellowButtonFontSize,
                  ))),
        ],
      );
    });
  }
}
