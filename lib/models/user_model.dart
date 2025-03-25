class UserModel {
  final String name;
  final String username;
  final String email;
  final String address;
  final String phone;

  const UserModel({required this.name, required this.username, required this.email , required this.address , required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'], 
        username: json['username'], 
        email: json['email'],
        address: json['address']['city'] ?? "No city specified",
        phone: json['phone'] ?? "No phone specified",
    );
  }

  // Override toString for better logging/debugging
  @override
  String toString() {
    return 'name: $name, username : $username ,email: $email\n ,address: $address';
  }
}
