import 'package:go_router/go_router.dart';
import 'package:mvvm_api/constants/app_routes.dart';
import 'package:mvvm_api/ui/user/views/users_screen.dart';
import 'package:mvvm_api/ui/user/views/users_screen_details.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.usersScreen, // Set the default initial route

    routes: [
      GoRoute(
        name: 'user_screen',
        path: AppRoutes.usersScreen,
        builder: (context, state) => UsersScreen(),
        routes: [
          GoRoute(
              name: "user_details",
              path: AppRoutes.usersDetails,
              builder: (context, state) => UsersScreenDetails()),
        ],
      ),
    ],
  );
}
