import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sport_manager/classes/match_task_model.dart';
import 'package:sport_manager/classes/task_model.dart';
import 'package:sport_manager/classes/user_model.dart';

//It will need another name. More specific. Maybe we can divide it into few services instead of just one
class FirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> getUserData() async {
    {
      var currentUser = auth.currentUser;
      Map<String, dynamic> data = <String, dynamic>{};
      if (currentUser != null) {
        //It can be searched by the uid but sth didn't work for me here
        await db
            .collection("users")
            .where("email", isEqualTo: currentUser.email)
            .get()
            .then((value) => data = value.docs[0].data());
        return UserModel(
            id: currentUser.uid,
            address: data["address"],
            email: data["email"],
            name: data["name"],
            surname: data["surname"],
            photo: data["photo"],
            phoneNumber: data["phoneNumber"],
            tasksid: data["tasks"]);
      } else {
        return const UserModel(
            id: "",
            address: "",
            email: "",
            name: "",
            surname: "",
            photo: "",
            phoneNumber: "",
            tasksid: []);
      }
    }
  }

  Future<List<MatchTaskModel>> getUserMatches() async {
    List<MatchTaskModel> matches = [];
    final currentUserData = await getUserData();
    if (currentUserData.tasksid.isNotEmpty) {
      await db
          .collection("tasks")
          .where("id", whereIn: currentUserData.tasksid)
          .get()
          .then((value) => {
                for (var i = 0; i < value.size; i++)
                  {
                    matches.add(MatchTaskModel(
                        id: value.docs[i].data()["id"],
                        assignees: value.docs[i].data()["assignees"],
                        description: value.docs[i].data()["description"],
                        end: value.docs[i].data()["end"],
                        start: value.docs[i].data()["start"],
                        type: TasksTypes.match,
                        dressingRoom: value.docs[i].data()["dressingRoom"],
                        arrival: value.docs[i].data()["arrival"],
                        materials: value.docs[i].data()["materials"],
                        pitch: value.docs[i].data()["pitch"],
                        place: value.docs[i].data()["place"],
                        referee: value.docs[i].data()["referee"],
                        team1Id: value.docs[i].data()["team1Id"],
                        team1Logo: value.docs[i].data()["team1Logo"],
                        team1Name: value.docs[i].data()["team1Name"],
                        team2Id: value.docs[i].data()["team2Id"],
                        team2Logo: value.docs[i].data()["team2Logo"],
                        team2Name: value.docs[i].data()["team2Name"]))
                  }
              });
    }
    return matches;
  }
}
