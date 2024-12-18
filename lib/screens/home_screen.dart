import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ponline/widgets/button.dart';
import 'package:ponline/widgets/header/header.dart';

import '/provider/game_settings_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameSettings gameSettings = ref.read(gameSettingsProvider.notifier).get();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        children: [
          const CustomHeader(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Row(),
                Text(
                  'Bienvenue,',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Léo',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Avec ',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(text: 'Ponline', style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: ', travailles ta ',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(text: 'mémoire ', style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: '\ntout en ',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(text: "t'amusant !", style: GoogleFonts.raleway(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  style: GoogleFonts.raleway(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            children: [
              CustomButton(
                title: 'Jouer seul',
                onTap: () => {
                  gameSettings.playerNumber = PlayerNumberEnum.SOLITAIRE,
                  ref.read(gameSettingsProvider.notifier).set(gameSettings),
                  context.pushNamed('gamemode'),
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomButton(title: 'Jouer à deux'),
              const SizedBox(
                height: 10,
              ),
              const CustomButton(
                title: 'Boutique',
                type: ButtonType.WHITE,
              ),
            ],
          ),
          const SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
