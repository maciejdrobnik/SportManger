import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class Sponsor extends StatelessWidget {
  const Sponsor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Padding(
      padding: EdgeInsets.only(bottom: constants.homePagePaddingVertical),
      child:Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      ),
    );
  }
}
