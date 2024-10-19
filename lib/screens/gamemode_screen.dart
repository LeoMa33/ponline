import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ponline/widgets/daily_gamemode_card.dart';
import 'package:ponline/widgets/gamemode_card.dart';
import 'package:ponline/widgets/header.dart';
import 'package:ponline/widgets/section_title.dart';

class GamemodeScreen extends StatefulWidget {
  const GamemodeScreen({required this.gamemode, super.key});

  final String gamemode;

  @override
  State<GamemodeScreen> createState() => _GamemodeScreenState();
}

class _GamemodeScreenState extends State<GamemodeScreen> {
  @override
  Widget build(BuildContext context) {
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
                      '2',
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
                child: DailyGamemodeCard(),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            children: [
              SectionTitle(title: 'Mode de jeux'),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GamemodeCard(
                      title: 'Aveugle',
                      icon: Icon(
                        CupertinoIcons.eye_slash_fill,
                        size: 40,
                        color: Color(0xFF7253A0),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GamemodeCard(
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
