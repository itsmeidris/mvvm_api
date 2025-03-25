import 'package:flutter/material.dart';
import 'package:mvvm_api/ui/core/shared/mvvm_appbar.dart';
import 'package:mvvm_api/ui/core/themes/app_colors.dart';

class UsersScreenDetails extends StatefulWidget {
  const UsersScreenDetails({super.key});

  @override
  State<UsersScreenDetails> createState() => _UsersScreenDetailsState();
}

class _UsersScreenDetailsState extends State<UsersScreenDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      appBar: MvvmAppbar(),
      body: Center(child: Text("User details")),
    );
  }
}