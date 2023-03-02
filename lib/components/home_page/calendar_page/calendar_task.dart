import 'package:flutter/material.dart';

class CalendarTask extends StatelessWidget {
  const CalendarTask({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                color: Colors.yellow,
              )),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [Text("First Line"), Text("Second Line")],
          )),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [Text("First hour"), Text("Second hour")],
          ))
        ],
      );
    });
  }
}
