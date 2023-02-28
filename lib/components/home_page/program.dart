import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sport_manager/components/home_page/home_yellow_button.dart';
import '../../classes/match_task_model.dart';
import '../../classes/user_model.dart';
import '../../services/firebase_service.dart';
import './../../assets/constants.dart' as constants;
import 'home_blue_button.dart';

const List<String> weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
const List<String> months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

class Program extends StatefulWidget {
  const Program({Key? key}) : super(key: key);

  @override
  State<Program> createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> getUserData() async {
    final User? user = auth.currentUser;
    if (user != null) {
      FirebaseService service = FirebaseService();
      UserModel userData = await service.getUserData(user);
      return userData;
    }
    return const UserModel(
        id: '',
        photo: '',
        address: '',
        email: '',
        name: '',
        surname: '',
        tasksid: [],
        phoneNumber: '');
  }

  Future<List<MatchTaskModel>> getMatches() async {
    final User? user = auth.currentUser;
    if (user != null) {
      FirebaseService service = FirebaseService();
      return await service.getUserMatches(user);
    }
    return [];
  }

  String getHourFromTimeStamp(timeStamp) {
    DateTime date = timeStamp.toDate();
    int hour = date.hour;
    int minute = date.minute;
    return minute > 10 ? "$hour:$minute" : "$hour:${minute}0";
}

  String getDateFromTimeStamp(timeStamp) {
    DateTime date = timeStamp.toDate();
    int weekDay = date.weekday;
    int day = date.day;
    int month = date.month;
    int year = date.year;
    return "${weekDays[weekDay-1]} ${months[month-1]} $day $year";
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return FutureBuilder(
          future: getMatches(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if(snapshot.data!.isNotEmpty){
                  return Column(
                    children: [
                      Flexible(
                        flex: constants.programBlueButtonFlex,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: constraints.maxHeight *
                                  constants.programPaddingTop),
                          child: const HomeBlueButton(
                            content: "Program",
                            minBlueButtonFontSize: constants
                                .minBlueButtonFontSize,
                            maxBlueButtonFontSize: constants
                                .maxBlueButtonFontSize,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: constants.programDateFlex,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: constraints.maxHeight *
                                    constants.programDateVerticalPadding),
                            child: AutoSizeText(
                              getDateFromTimeStamp(snapshot.data!.first.start),
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
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: constraints.maxWidth *
                                  constants.programRowPaddingLeft,
                              right: constraints.maxWidth *
                                  constants.programRowPaddingRight),
                          child: Row(
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Flexible(
                                          flex: constants.programTeamLogoFlex,
                                          child: Image.asset(
                                              "lib/assets/images/logo1.png"),
                                        ),
                                        Flexible(
                                          flex: constants
                                              .programBreakBetweenLogAndNameFlex,
                                          child: Container(),
                                        ),
                                        Flexible(
                                            flex: constants.programTeamNameFlex,
                                            child: Text(snapshot.data![0].team1Name)),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: constraints.maxHeight *
                                              constants.programHourPaddingTop),
                                      child:  AutoSizeText(
                                        getHourFromTimeStamp(snapshot.data!.first.arrival),
                                        minFontSize: constants
                                            .programMinHourFontSize,
                                        maxFontSize: constants
                                            .programMaxHourFontSize,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Flexible(
                                          flex: constants.programTeamLogoFlex,
                                          child: Image.asset(
                                              "lib/assets/images/logo2.png"),
                                        ),
                                        Flexible(
                                            flex: constants
                                                .programBreakBetweenLogAndNameFlex,
                                            child: Container()),
                                        Flexible(
                                            flex: constants.programTeamNameFlex,
                                            child: Text(snapshot.data![0].team2Name)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: const [
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: constants.programIconSize,
                                  ),
                                  SizedBox(
                                    height: constants.programRaiseDateAndIcon,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                          flex: constants.programYellowButtonFlex,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: constraints.maxHeight *
                                      constants.programPaddingBottom),
                              child: const HomeYellowButton(
                                content: "Match Information",
                                minYellowButtonFontSize:
                                constants.minYellowButtonFontSize,
                                maxYellowButtonFontSize:
                                constants.maxYellowButtonFontSize,
                              ))),
                    ],
                  );
                }
                else{
                  return const Text("There are no matches for you");
                }
              }
              else if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              else{
                return const Text("I don't know what else can happen");
              }
            }
            else{
              return const Text("Wait a second");
            }
          });
    });
  }
}
