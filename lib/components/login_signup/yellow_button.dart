import "package:flutter/material.dart";

class YellowButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressAction;

  const YellowButton({Key? key, required this.buttonText, required this.onPressAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: SizedBox(
          width: 300,
          height: 40,
        child: ElevatedButton(
        style:buttonStyle,
        onPressed: onPressAction,
        child: Text(buttonText),
      ),
        ),
    );
  }
}


final buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFFEFCA3E),
  shape: RoundedRectangleBorder(
      side: const BorderSide(
          width: 1, // thickness
      ),
      borderRadius: BorderRadius.circular(50)
  ),
    textStyle: TextStyle(
      fontSize: 17,
    color: Color(0xFFD8D8D8),
  )
);
