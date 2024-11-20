import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ponline/widgets/user_pair.dart';

import '/provider/game_settings_provider.dart';

class CustomInGameHeader extends ConsumerStatefulWidget {
  const CustomInGameHeader({super.key});

  @override
  ConsumerState<CustomInGameHeader> createState() => _CustomInGameHeaderState();
}

class _CustomInGameHeaderState extends ConsumerState<CustomInGameHeader> {
  @override
  Widget build(BuildContext context) {
    GameSettings gameSettings = ref.watch(gameSettingsProvider.notifier).get();

    ref.listen<GameSettings>(gameSettingsProvider, (GameSettings? previousBoard, GameSettings nextBoard) {
      setState(() {
        gameSettings = nextBoard;
      });
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        UserPair(
          pairCount: gameSettings.pairFind,
          direction: DirectionEnum.RIGHT2LEFT,
        ),
        Column(
          children: [
            Text(
              "00:00",
              style: GoogleFonts.raleway(
                  color: Colors.white, fontWeight: FontWeight.w600, textStyle: const TextStyle(fontSize: 16)),
            ),
            const Icon(
              Icons.pause_rounded,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
        UserPair(
          pairCount: gameSettings.pairFind,
        ),
      ],
    );
  }
}
