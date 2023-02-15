import 'package:flutter/material.dart';

class WhiteInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const WhiteInput({Key? key, required this.textController, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
      width: 300,
      child: TextField(
        controller: textController,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText:hintText,
          prefix: Text("    "),
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
        focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(25),
      ),
        ),
      ),
    ),
    );
  }
}
