class User {
  User({required this.id, this.email, this.password, required this.loginDate});

  final String id;
  final String? email;
  final String? password;
  final DateTime loginDate;
}
