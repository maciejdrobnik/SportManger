import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class Agenda extends StatelessWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child:Padding(
        padding: EdgeInsets.symmetric(vertical: constants.homePagePaddingVertical),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(constants.homePageContainerBorderRadius)),
          ),
      ),
      ),
    );
  }
}
