import 'package:flutter/material.dart';
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
        backgroundColor: Color(constants.primaryBlue),
        title: Text('Overview'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Agenda(),
          Program(),
          Chores()
        ],
      ),
    );
  }
}
