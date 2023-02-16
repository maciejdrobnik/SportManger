import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'white_input.dart';
import 'yellow_button.dart';
import '../../localization/change_localization.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController testController = TextEditingController();
  void testAction() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF092040),
      body:SafeArea(
        minimum: const EdgeInsets.only(top: 50),
        child: SizedBox.expand(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/SportManagerLogo.png'),
          ),
          Padding(
              padding: EdgeInsets.only(top:20),
              child: WhiteInput(textController: testController, hintText: "testHint"),
          ),
          WhiteInput(textController: testController, hintText: "testHint"),
          YellowButton(buttonText: "login".tr, onPressAction: testAction),
          YellowButton(buttonText: "login2".tr, onPressAction: testAction),
          ChangeLanuage()
        ],
    ),
        ),
        ),
    );
  }
}
