import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ponline/screens/gameboard_screen.dart';
import 'package:ponline/screens/gamemode_screen.dart';
import 'package:ponline/screens/home_screen.dart';
import 'package:ponline/screens/setup_screen.dart';
import 'package:ponline/screens/tutorial_screen.dart';

enum AppRoute {
  home(name: 'home'),
  gamemode(name: 'gamemode'),
  tutorial(name: 'tutorial'),
  setup(name: 'setup'),
  gameboard(name: 'gameboard');

  const AppRoute({required this.name});

  final String name;
}

GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: '/gamemode',
      name: AppRoute.gamemode.name,
      builder: (BuildContext context, GoRouterState state) {
        return const GamemodeScreen();
      },
    ),
    GoRoute(
      path: '/tutorial',
      name: AppRoute.tutorial.name,
      builder: (BuildContext context, GoRouterState state) {
        return const TutorialScreen();
      },
    ),
    GoRoute(
      path: '/setup',
      name: AppRoute.setup.name,
      builder: (BuildContext context, GoRouterState state) =>
          const SetupScreen(),
    ),
    GoRoute(
      path: '/gameboard',
      name: AppRoute.gameboard.name,
      builder: (BuildContext context, GoRouterState state) =>
          const GameboardScreen(),
    ),
  ],
);
