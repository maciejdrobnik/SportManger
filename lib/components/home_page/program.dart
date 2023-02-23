import 'package:flutter/material.dart';
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
          const Flexible(
            flex: 24,
            child: Padding(
              padding: EdgeInsets.only(top: constants.programPaddingTop),
              child: HomeBlueButton(content: "Program"),
            ),
          ),
          const Flexible(
            flex: 17,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: constants.programDateVerticalPadding),
                child: Text(
                  "Sunday February 13 2022",
                  style: TextStyle(
                    fontSize: constants.programDateFontSize,
                    color: Color(constants.homePageTextColor),
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.visible,
                  ),
                )),
          ),
          Flexible(
            flex: 42,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: constants.programRowPaddingLeft,
                  right: constants.programRowPaddingRight),
              child: Row(
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Flexible(
                              flex: 56,
                              child: Image.asset("lib/assets/images/logo1.png"),
                            ),
                            const Flexible(
                              flex: 3,
                              child: SizedBox(
                                  height: constants.breakBetweenLogoAndName),
                            ),
                            const Flexible(flex: 16, child: Text("Team1")),
                          ],
                        ),
                        const Text(
                          "14:00",
                          style: TextStyle(
                            fontSize: constants.programHourFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Column(
                          children: [
                            Flexible(
                              flex: 56,
                              child: Image.asset("lib/assets/images/logo2.png"),
                            ),
                            Flexible(
                              flex: 3,
                              child: const SizedBox(
                                  height: constants.breakBetweenLogoAndName),
                            ),
                            Flexible(flex: 16, child: const Text("Team2")),
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
            flex: 17,
            child: Container(),
          )
        ],
      );
    });
  }
}
