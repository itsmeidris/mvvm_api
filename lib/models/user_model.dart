class UserModel {
  final String name;
  final String username;
  final String email;

  UserModel({required this.name, required this.username, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'], 
        username: json['username'], 
        email: json['email']
    );
  }

  // Override toString for better logging/debugging
  @override
  String toString() {
    return 'name: $name, username : $username ,email: $email\n';
  }
}
