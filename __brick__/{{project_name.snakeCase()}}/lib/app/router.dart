import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../feature/home/home_screen.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    initialLocation: "/${HomeScreen.routeName}",
    routes: [
      GoRoute(
        name: HomeScreen.routeName,
        path: "/${HomeScreen.routeName}",
        builder: (context, state) =>
            HomeScreen(routeParameters: state.pathParameters),
        routes: const [],
      ),
    ],
  );
}
