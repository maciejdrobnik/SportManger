import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;
import 'package:auto_size_text/auto_size_text.dart';

class HomeYellowButton extends StatelessWidget {
  final String content;
  final double minYellowButtonFontSize;
  final double maxYellowButtonFontSize;
  final VoidCallback onClick;

  const HomeYellowButton({
    Key? key,
    required this.content,
    required this.minYellowButtonFontSize,
    required this.maxYellowButtonFontSize,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: constants.widthFactorYellowButton,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(constants.primaryYellow),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(constants.buttonsBorderRadius)),
        ),
        child: AutoSizeText(
          content,
          maxLines: 1,
          minFontSize: minYellowButtonFontSize,
          maxFontSize: maxYellowButtonFontSize,
        ),
      ),
    );
  }
}
