import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ponline/screens/home_screen.dart';

enum AppRoute {
  home(name: 'home');

  const AppRoute({required this.name});

  final String name;
}

GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/', name: AppRoute.home.name, builder: (BuildContext context, GoRouterState state) => const HomeScreen())
]);
