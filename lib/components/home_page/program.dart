import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;
import 'home_blue_button.dart';

// The structure of this component is like this. First you have white box as a main container.
// Inside the box there is a main column with 3 children:

class Program extends StatelessWidget {
  const Program({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.only(bottom: constants.homePagePaddingVertical),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(constants.homePageContainerBorderRadius)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                HomeBlueButton(content: "Program"),
                Padding(
                    padding: EdgeInsets.only(top: 7, bottom: 7),
                    child: Text(
                      "Sunday February 13 2022",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 45, right: 20),
                  child: Row(
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset("lib/assets/images/logo1.png"),
                                SizedBox(height: 3),
                                Text("Team1")
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "14:00",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 20)
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("lib/assets/images/logo2.png"),
                                SizedBox(height: 3),
                                Text("Team2")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            height: 20,
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
