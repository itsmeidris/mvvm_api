import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_api/routes/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //Router
      routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.urbanistTextTheme(Theme.of(context).textTheme)));
  }
}
