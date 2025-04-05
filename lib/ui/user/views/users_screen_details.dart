import 'package:flutter/material.dart';
import 'package:mvvm_api/models/user_model.dart';
import 'package:mvvm_api/ui/core/shared/mvvm_appbar.dart';
import 'package:mvvm_api/ui/core/themes/app_colors.dart';

class UsersScreenDetails extends StatefulWidget {
  final int? id;
  final UserModel user;
  const UsersScreenDetails({super.key, this.id, required this.user});

  @override
  State<UsersScreenDetails> createState() => _UsersScreenDetailsState();
}

class _UsersScreenDetailsState extends State<UsersScreenDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      appBar: MvvmAppbar(),
      body: Center(child: Text("Name ${widget.user.name}")),
    );
  }
}
