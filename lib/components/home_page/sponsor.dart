import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class Sponsor extends StatelessWidget {
  const Sponsor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Padding(
      padding: const EdgeInsets.only(bottom: constants.homePagePaddingVertical),
      child:Container(
        decoration: const BoxDecoration(
          color: constants.backgroundBox,
          borderRadius: BorderRadius.all(Radius.circular(constants.homePageContainerBorderRadius)),
        ),
      ),
      ),
    );
  }
}
