import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sport_manager/classes/match_task_model.dart';
import 'package:sport_manager/services/convert_timestamp.dart';
import '../../../assets/constants.dart' as constants;

class TeamsRow extends StatefulWidget {
  final BoxConstraints parentConstraints;
  final AsyncSnapshot<List<MatchTaskModel>> dataSnapshot;

  const TeamsRow(
      {super.key, 
      required this.dataSnapshot, 
      required this.parentConstraints,
      });
  @override
  _TeamsRowState createState() => _TeamsRowState();
}

class _TeamsRowState extends State<TeamsRow> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    ConvertTimestampService timestampService = ConvertTimestampService();
    Widget padding;

return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                // if (snapshot.data!.isNotEmpty) {
              
              
  return Flexible(
      flex: constants.programTeamsRowFlex,
      child: Padding(
        padding: EdgeInsets.only(
            left: widget.parentConstraints.maxWidth * constants.programRowPaddingLeft,
            right:
                widget.parentConstraints.maxWidth * constants.programRowPaddingRight),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            counter == 0 ?
            Container() : 
            Padding(
                    padding: EdgeInsets.only(
                        top: widget.parentConstraints.maxHeight *
                            constants.programHourPaddingTop,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded,
                      size: constants.programIconSize),
                      onPressed: (){
                        counter--;
                      },
                    ),
                    
                  //   const Icon(
                  //     Icons.arrow_back_ios_rounded,
                  //     size: constants.programIconSize,
                  // )
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
            counter == widget.dataSnapshot.data!.length ?
            Container() : 
            Padding(
                padding: EdgeInsets.only(
                    top: widget.parentConstraints.maxHeight *
                        constants.programHourPaddingTop/2),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded,
                  size: constants.programIconSize),
                  // onPressed: _increaseCounter,
                  onPressed: (){
                    counter++;
                  },
                ),
            )
          ],
        ),
      ),
    );


//          } else {
//                   return const Text("There are no matches for you");
//                 }
            }else if (snapshot.hasError) {
                return const Text("Something went wrong");
              } else {
                return const Text("I don't know what else can happen");
              }
            } else {
              return const Text("db is not connected");
            }
          }
      );
        }
);


  
    
}
}