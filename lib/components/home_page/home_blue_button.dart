import 'package:flutter/material.dart';
import './../../assets/constants.dart' as constants;

class HomeBlueButton extends StatelessWidget {
  final String content;
  const HomeBlueButton({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 40,
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(constants.primaryBlue),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
        ),
        child: Text(content),
      ),
    );
  }
}
