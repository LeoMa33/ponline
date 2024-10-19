import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ponline/screens/gamemode_screen.dart';
import 'package:ponline/screens/home_screen.dart';

enum AppRoute {
  home(name: 'home'),
  gamemode(name: 'gamemode');

  const AppRoute({required this.name});

  final String name;
}

GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen()),
  GoRoute(
      path: '/gamemode/:nbPlayer',
      name: AppRoute.gamemode.name,
      builder: (BuildContext context, state) {
        final String? gamemode = state.pathParameters['nbPlayer'];
        return GamemodeScreen(gamemode: gamemode ?? 'SOLITAIRE');
      }),
]);
