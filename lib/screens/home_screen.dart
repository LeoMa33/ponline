import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme.surface,
        elevation: 0,
        title: Text(
          'home',
          style: TextStyle(
            color: colorTheme.scrim,
            fontSize: 25,
          ),
        ),
      ),
      body: const SingleChildScrollView(),
    );
  }
}
