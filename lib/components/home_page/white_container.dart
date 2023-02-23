import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class WhiteContainer extends StatelessWidget {
  final int flexValue;
  final Widget content;
  const WhiteContainer({Key? key, required this.flexValue, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue,
      child:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var deviceInfo = MediaQuery.of(context);
      return Padding(
        padding: EdgeInsets.only(bottom: deviceInfo.size.height * constants.homePagePaddingVertical),
        child: Container(
          decoration: const BoxDecoration(
            color: constants.backgroundBox,
            borderRadius: BorderRadius.all(Radius.circular(constants.homePageContainerBorderRadius)),
          ),
          child: content,
        ),
      );
    })
    );

  }
}
