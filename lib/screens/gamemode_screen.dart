import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ponline/provider/game_settings_provider.dart';
import 'package:ponline/widgets/gamemode_card.dart';
import 'package:ponline/widgets/header.dart';
import 'package:ponline/widgets/section_title.dart';

import '../widgets/large_card.dart';

class GamemodeScreen extends ConsumerStatefulWidget {
  const GamemodeScreen({super.key});

  @override
  ConsumerState<GamemodeScreen> createState() => _GamemodeScreenState();
}

class _GamemodeScreenState extends ConsumerState<GamemodeScreen> {
  @override
  Widget build(BuildContext context) {
    GameSettings gameSettings = ref.read(gameSettingsProvider.notifier).get();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        children: [
          const CustomHeader(
            isBackButtonEnable: true,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(),
                Text(
                  'Vous jouez en',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Solitaire',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Je ne sais pas quoi écrire ici mais il faudra comblé, ça peut être intéressant comme ca.',
                  style: GoogleFonts.raleway(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              SectionTitle(
                title: 'Défi journalier',
                child: Row(
                  children: [
                    Text(
                      '-',
                      style: GoogleFonts.raleway(
                          color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      CupertinoIcons.flame_fill,
                      size: 16,
                      color: Color(0xFF74102F),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: LargeCard(
                  title: 'Relevez 3 défis',
                  subtitle: 'Des iris au bout du 3ème jour',
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const SectionTitle(title: 'Mode de jeux'),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GamemodeCard(
                      title: 'Aveugle',
                      icon: const Icon(
                        CupertinoIcons.eye_slash_fill,
                        size: 40,
                        color: Color(0xFF7253A0),
                      ),
                      onTap: () => {
                        gameSettings.gamemode = GamemodeEnum.AVEUGLE,
                        ref
                            .read(gameSettingsProvider.notifier)
                            .set(gameSettings),
                        context.pushNamed('tutorial'),
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const GamemodeCard(
                      title: 'Flash',
                      icon: Icon(
                        Icons.flash_on,
                        size: 40,
                        color: Color(0xFFFFC400),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
