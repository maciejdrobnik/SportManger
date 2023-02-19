import 'package:flutter/material.dart';
import 'package:sport_manager/components/home_page/sponsor.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: constants.homePagePaddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [Agenda(), Program(), Chores(), Sponsor()],
        ),
      ),
    );
  }
}
