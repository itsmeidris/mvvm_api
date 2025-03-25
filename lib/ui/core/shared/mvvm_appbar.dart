import 'package:flutter/material.dart';
import 'package:mvvm_api/ui/core/themes/app_colors.dart';

class MvvmAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MvvmAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'MVVM / JSONPLACEHOLDER',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: AppColors.myBlue,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
