import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '/provider/game_settings_provider.dart';
import '/widgets/button.dart';
import '/widgets/header.dart';

class TutorialScreen extends ConsumerWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameSettings gameSettings = ref.read(gameSettingsProvider.notifier).get();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        children: [
          const CustomHeader(
            isBackButtonEnable: true,
            isProfilEnable: false,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mode de jeu',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Aveugle',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dans ce mode de jeu vous devrez trouver toutes les paires possible sans avoir limite de temps ni de vies. Toutes les cartes sont face caché au début de la partie.',
                      style: GoogleFonts.raleway(
                          color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  title: 'Jouer en mode aveugle',
                  onTap: () {
                    context.pushReplacementNamed('setup');
                  },
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
