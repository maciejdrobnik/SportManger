class UserModel {
  final String id;
  final String address;
  final String email;
  final String name;
  final String surname;
  final String photo;
  final String? teamId;
  final String phoneNumber;
  final List<dynamic> tasksid;

  const UserModel(
      {required this.id,
      required this.address,
      required this.email,
      required this.name,
      required this.surname,
      required this.photo,
      this.teamId,
      required this.phoneNumber,
      required this.tasksid});
}
