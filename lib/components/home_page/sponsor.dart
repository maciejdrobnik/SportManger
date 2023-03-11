import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class Sponsor extends StatelessWidget {
  const Sponsor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 126,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              var deviceInfo = MediaQuery.of(context);
              return Padding(
                padding: EdgeInsets.only(
                    bottom: deviceInfo.size.height *
                        constants.homePagePaddingVertical),
                child: Container(
                  decoration: const BoxDecoration(
                    color: constants.backgroundBoxColor,
                    borderRadius: BorderRadius.all(Radius.circular(
                        constants.homePageContainerBorderRadius)),
                  ),
                ),
              );
            })));
  }
}
