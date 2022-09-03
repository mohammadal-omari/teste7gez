class UserModel {
  late String phoneNumber;
  late String firstname;
  late String lastname;
  late String email;
  late String password;
  late String _id;
  late int index;

  UserModel();
  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    // _id = parsedJson['_id'];
    index = parsedJson['id'];
    firstname = parsedJson['name'];

  }
}
