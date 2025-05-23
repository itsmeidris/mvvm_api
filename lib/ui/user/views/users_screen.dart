import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_api/models/user_model.dart';
import 'package:mvvm_api/ui/core/shared/mvvm_appbar.dart';
import 'package:mvvm_api/ui/core/themes/app_colors.dart';
import 'package:mvvm_api/ui/user/view_model/user_view_model.dart';
import 'package:mvvm_api/ui/user/widgets/user_profile_card.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  // ViewModel instance
  final UserViewModel _userViewModel = UserViewModel();
  Future<List<UserModel>>? _usersFuture;
  int _usersNumber = 0;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('initState method is called');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build method is called');
    }
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      appBar: MvvmAppbar(),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          // Wait for the fetch to complete
          final users = await _userViewModel.fetchUsers();
          setState(() {
            _usersFuture =
                Future.value(users); // Update the Future for FutureBuilder
            _usersNumber =
                _userViewModel.numberOfUsers; // Update the number of users
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          elevation: 1,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: const Text(
          'Get users',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Users found : ($_usersNumber)',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: FutureBuilder<List<UserModel>>(
                  future: _usersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          color: Colors.blueAccent,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final users = snapshot.data!;
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return UserProfileCard(
                            onCardTap: () {
                              context.pushNamed(
                                "user_details",
                                pathParameters: {'id': user.id.toString()},
                                extra: user
                              );
                            },
                            userModel: user,
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No users found yet.',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
