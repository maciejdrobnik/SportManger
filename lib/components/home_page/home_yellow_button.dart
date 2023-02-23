import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class HomeYellowButton extends StatelessWidget {
  final String content;
  final double yellowButtonFontSize;
  const HomeYellowButton({Key? key, required this.content, required this.yellowButtonFontSize }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: constants.widthFactorYellowButton,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(constants.primaryYellow),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(constants.buttonsBorderRadius)),
        ),
        child: Text(
          content,
          style: TextStyle(
            fontSize: yellowButtonFontSize,
          ),
        ),
      ),
    );
  }
}
