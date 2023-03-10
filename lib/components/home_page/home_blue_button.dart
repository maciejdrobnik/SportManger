import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class HomeBlueButton extends StatelessWidget {
  final String content;
  final double minBlueButtonFontSize;
  final double maxBlueButtonFontSize;
  final VoidCallback? onClick;

  const HomeBlueButton(
      {Key? key,
      required this.content,
      required this.minBlueButtonFontSize,
      required this.maxBlueButtonFontSize,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: constants.widthFactorBlueButton,
      alignment: FractionalOffset.topCenter,
      child: ElevatedButton(
        onPressed: onClick ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(constants.primaryBlue),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(constants.buttonsBorderRadius)),
        ),
        child: AutoSizeText(
          content,
          maxLines: 1,
          minFontSize: minBlueButtonFontSize,
          maxFontSize: maxBlueButtonFontSize,
        ),
      ),
    );
  }
}
