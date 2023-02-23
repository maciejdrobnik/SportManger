import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class HomeBlueButton extends StatelessWidget {
  final String content;
  final double blueButtonFontSize;
  const HomeBlueButton({Key? key, required this.content, required this.blueButtonFontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: constants.widthFactorBlueButton,
        alignment: FractionalOffset.topCenter,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(constants.primaryBlue),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(constants.buttonsBorderRadius)),
          ),
          child: Text(content),
        ),
    );
  }
}
