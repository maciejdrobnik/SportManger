import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class HomeYellowButton extends StatelessWidget {
  final String content;
  const HomeYellowButton({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      height: 20,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(constants.primaryYellow),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(
          content,
          style: TextStyle(
            fontSize: constants.yellowbuttonSize,
          ),
        ),
      ),
    );
  }
}
