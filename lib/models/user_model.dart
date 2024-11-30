class UserModel {
  final String username;
  final String name;
  final String token;

  UserModel({required this.username, required this.name, required this.token});

  factory UserModel.jsonMap(Map<String, dynamic> json) {
    return UserModel(
        username: json['username'], name: json['name'], token: json['token']);
  }
}
