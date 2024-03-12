class User {
  final String? fullname;
  final String email;
  final String password;

  User({this.fullname, required this.email, required this.password});
  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
    };
  }
}
