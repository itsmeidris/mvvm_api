import 'package:flutter/material.dart';
import 'package:mvvm_api/data/repositories/user_repository.dart';
import 'package:mvvm_api/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  //Instance of the user repository
  final UserRepository _userRepository = UserRepository();
  //Empty list for the user model objects to be filled in
  List<UserModel> users = [];
  //Boolean flag to check wether data returned or not
  bool isLoading = false;
  //Get the total number of users
  int numberOfUsers = 0;

  Future<List<UserModel>> fetchUsers() async {
    //Make the flag true and notify the app with the changements
    isLoading = true;
    notifyListeners();
    try {
      //Fill the users list
      users = await _userRepository.getUsers();
      isLoading = false;
      numberOfUsers = users.length;
      debugPrint('The $numberOfUsers of users are :\n$users');
      notifyListeners();
      return users;
    } catch (e) {
      debugPrint('Error fetching the users');
      throw Exception('Error fetching users');
    }
  }
}
