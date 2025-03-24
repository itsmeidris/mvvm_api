import 'package:mvvm_api/data/services/user_api_service.dart';
import 'package:mvvm_api/models/user_model.dart';

class UserRepository {
  Future<List<UserModel>> getUsers() async {
    try {
      //Get the raw json users data
      final users = await UserApiService.fetchUsersApi();
      //Convert the users data into User model objects
      return users.map((user) => UserModel.fromJson(user)).toList();
    } catch (e) {
      throw Exception('Error is the User repository : $e');
    }
  }
}
