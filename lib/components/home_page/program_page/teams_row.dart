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
  int _counter = 0;

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
        child: Column(
          children: [
            Flexible(
              flex: constants.programDateFlex,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: widget.parentConstraints.maxHeight *
                          constants.programDateVerticalPadding),
                  child: AutoSizeText(
                    timestampService.getDateFromTimeStamp(
                        widget.dataSnapshot.data![_counter].start),
                    maxLines: 1,
                    maxFontSize: constants.programMaxDateFontSize,
                    minFontSize: constants.programMinDateFontSize,
                    style: const TextStyle(
                      color: Color(constants.homePageTextColor),
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.visible,
                    ),
                  )),
            ),
            Flexible(
              flex: constants.programTeamsRowFlex,
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
                              child: Image.network(widget
                                  .dataSnapshot.data![_counter].team1Logo),
                            ),
                            Flexible(
                              flex: constants.programBreakBetweenLogAndNameFlex,
                              child: Container(),
                            ),
                            Flexible(
                                flex: constants.programTeamNameFlex,
                                child: Text(widget
                                    .dataSnapshot.data![_counter].team1Name)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: widget.parentConstraints.maxHeight *
                                  constants.programHourPaddingTop),
                          child: AutoSizeText(
                            timestampService.getHourFromTimeStamp(
                                widget.dataSnapshot.data![_counter].arrival),
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
                              child: Image.network(widget
                                  .dataSnapshot.data![_counter].team2Logo),
                            ),
                            Flexible(
                                flex:
                                    constants.programBreakBetweenLogAndNameFlex,
                                child: Container()),
                            Flexible(
                                flex: constants.programTeamNameFlex,
                                child: Text(widget
                                    .dataSnapshot.data![_counter].team2Name)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _counter >= 0 &&
                          _counter != widget.dataSnapshot.data!.length - 1
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
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
