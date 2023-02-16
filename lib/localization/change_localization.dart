import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanuage extends StatelessWidget {
  const ChangeLanuage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          ElevatedButton(
              onPressed: () {
                var newLocale = Locale('en');
                Get.updateLocale(newLocale);
              },
              child: Text("English")
          ),
        ElevatedButton(
            onPressed: () {
              var newLocale = Locale('nl');
              Get.updateLocale(newLocale);
            },
            child: Text("Dutch")
        )
      ],
    );
  }
}
