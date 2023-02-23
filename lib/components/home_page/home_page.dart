import 'package:flutter/material.dart';
import 'package:sport_manager/components/home_page/sponsor.dart';
import 'package:sport_manager/components/home_page/white_container.dart';
import 'agenda.dart';
import 'chores.dart';
import 'program.dart';
import './../../assets/constants.dart' as constants;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(constants.primaryBlue),
          title: const Text('Overview'),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
        ),
        backgroundColor: const Color(constants.homePageBackground),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: EdgeInsets.only(
                  left: constraints.maxWidth *
                      constants.homePagePaddingHorizontal,
                  right: constraints.maxWidth *
                      constants.homePagePaddingHorizontal,
                  top: constraints.maxHeight *
                      constants.homePagePaddingVertical),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  WhiteContainer(
                      flexValue: constants.bigWhiteBoxFlex, content: Agenda()),
                  WhiteContainer(
                      flexValue: constants.bigWhiteBoxFlex, content: Program()),
                  WhiteContainer(
                      flexValue: constants.bigWhiteBoxFlex, content: Chores()),
                  WhiteContainer(
                      flexValue: constants.smallWhiteBoxFlex,
                      content: Sponsor())
                ],
              ),
            );
          },
        ));
  }
}
