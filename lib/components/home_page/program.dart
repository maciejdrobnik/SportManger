import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class Program extends StatelessWidget {
  const Program({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child:Padding(
        padding:EdgeInsets.only(bottom: constants.homePagePaddingVertical),
        child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      ),
    );
  }
}
