import 'package:flutter/material.dart';
import 'package:mvvm_api/models/user_model.dart';

class UserProfileCard extends StatelessWidget {
  final UserModel userModel;

  const UserProfileCard(
      {super.key, required this.userModel,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          color: Colors.white54,
          borderRadius: BorderRadius.circular(19)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 5,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.self_improvement_outlined,
                    size: 45,
                  ),
                ),
                Column(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel.username,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userModel.name,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    )
                  ],
                ),
              ],
            ),
            Text(
              userModel.email,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                  decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
