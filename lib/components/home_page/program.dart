import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;
import 'home_blue_button.dart';

/// The structure of this component is like this. First you have white box as a main container.
/// Inside the box there is a main column with 3 children:

class Program extends StatelessWidget {
  const Program({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: constants.bigWhiteBoxFlex,
      child: Padding(
        padding: const EdgeInsets.only(bottom: constants.homePagePaddingVertical),
        child: Container(
          decoration: const BoxDecoration(
            color: constants.backgroundBox,
            borderRadius: BorderRadius.all(Radius.circular(constants.homePageContainerBorderRadius)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: constants.programPaddingTop),
            child: Column(
              children: [
                const HomeBlueButton(content: "Program"),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: constants.programDateVerticalPadding),
                    child: Text(
                      "Sunday February 13 2022",
                      style: TextStyle(
                        fontSize: constants.programDateFontSize,
                        color: Color(constants.homePageTextColor),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: constants.programRowPaddingLeft, right: constants.programRowPaddingRight),
                  child: Row(
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset("lib/assets/images/logo1.png"),
                                const SizedBox(height: constants.breakBetweenLogoAndName),
                                const Text("Team1")
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "14:00",
                                  style: TextStyle(
                                    fontSize: constants.programHourFontSize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: constants.programRaiseDateAndIcon)
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("lib/assets/images/logo2.png"),
                                const SizedBox(height: constants.breakBetweenLogoAndName),
                                const Text("Team2")
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
