import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sport_manager/classes/match_task_model.dart';
import 'package:sport_manager/services/convert_timestamp.dart';
import '../../../assets/constants.dart' as constants;

class TeamsRow extends StatefulWidget {
  final BoxConstraints parentConstraints;
  final AsyncSnapshot<List<MatchTaskModel>> dataSnapshot;
  const TeamsRow(
      {super.key, required this.dataSnapshot, required this.parentConstraints});

  @override
  _TeamsRowState createState() => _TeamsRowState();
}

class _TeamsRowState extends State<TeamsRow> {
  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    ConvertTimestampService timestampService = ConvertTimestampService();
    return Flexible(
      flex: constants.programTeamsRowFlex,
      child: Padding(
        padding: EdgeInsets.only(
            left: widget.parentConstraints.maxWidth *
                constants.programRowPaddingLeft /
                2,
            right: widget.parentConstraints.maxWidth *
                constants.programRowPaddingRight),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _counter <= widget.dataSnapshot.data!.length && _counter != 0
                ? Container(
                    width: constants.programIconSize,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: constants.programIconSize,
                      ),
                      onPressed: () {
                        setState(() {
                          _counter--;
                          print(_counter);
                        });
                      },
                    ),
                  )
                : Container(
                    width: constants.programIconSize,
                  ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Flexible(
                        flex: constants.programTeamLogoFlex,
                        child: Image.asset("lib/assets/images/logo1.png"),
                      ),
                      Flexible(
                        flex: constants.programBreakBetweenLogAndNameFlex,
                        child: Container(),
                      ),
                      Flexible(
                          flex: constants.programTeamNameFlex,
                          child: Text(widget.dataSnapshot.data![0].team1Name)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: widget.parentConstraints.maxHeight *
                            constants.programHourPaddingTop),
                    child: AutoSizeText(
                      timestampService.getHourFromTimeStamp(
                          widget.dataSnapshot.data!.first.arrival),
                      minFontSize: constants.programMinHourFontSize,
                      maxFontSize: constants.programMaxHourFontSize,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Flexible(
                        flex: constants.programTeamLogoFlex,
                        child: Image.asset("lib/assets/images/logo2.png"),
                      ),
                      Flexible(
                          flex: constants.programBreakBetweenLogAndNameFlex,
                          child: Container()),
                      Flexible(
                          flex: constants.programTeamNameFlex,
                          child: Text(widget.dataSnapshot.data![0].team2Name)),
                    ],
                  ),
                ],
              ),
            ),
            _counter >= 0 && _counter != widget.dataSnapshot.data!.length
                ? Container(
                    width: constants.programIconSize,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: constants.programIconSize,
                      ),
                      onPressed: () {
                        setState(() {
                          _counter++;
                        });
                      },
                    ),
                  )
                : Container(
                    width: constants.programIconSize,
                  )
          ],
        ),
      ),
    );
  }
}
