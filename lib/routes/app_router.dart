import 'package:go_router/go_router.dart';
import 'package:mvvm_api/constants/app_routes.dart';
import 'package:mvvm_api/models/user_model.dart';
import 'package:mvvm_api/ui/user/views/users_screen.dart';
import 'package:mvvm_api/ui/user/views/users_screen_details.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.usersScreen, // Set the default initial route
    routes: [
      GoRoute(
        name: 'user_screen',
        path: AppRoutes.usersScreen,
        builder: (context, state) => UsersScreen(),
        routes: [
          GoRoute(
              name: "user_details",
              path: '${AppRoutes.usersDetails}/:id',
              builder: (context, state) {
                //Parse the integer value into String for URL handling
                final int userId = int.parse(state.pathParameters['id']!);
                //Passing a full extra object as a hidden data that is not visible in the url
                final UserModel user = state.extra as UserModel;
                return UsersScreenDetails(user: user, id: userId);
              })
        ],
      ),
    ],
  );
}
