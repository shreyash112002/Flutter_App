class UserModel {
  final String? id;
  final String Email;
  final String Name;
  final String Password;

  const UserModel({
    this.id,
    required this.Name,
    required this.Email,
    required this.Password,
  });

  toJson() {
    return {
      "FullName": Name,
      "Email": Email,
      "Password" : Password,
    };
  }
}
