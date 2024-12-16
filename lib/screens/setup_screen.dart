import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ponline/provider/board_provider.dart';
import 'package:ponline/router.dart';

import '../provider/game_settings_provider.dart';
import '../widgets/gamemode_card.dart';
import '../widgets/header/header.dart';
import '../widgets/large_card.dart';
import '../widgets/section_title.dart';

class SetupScreen extends ConsumerStatefulWidget {
  const SetupScreen({super.key});

  @override
  ConsumerState<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends ConsumerState<SetupScreen> {
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Column(
                  children: [
                    SectionTitle(
                      title: 'Style de cartes',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: LargeCard(
                        title: 'Classique',
                        subtitle: 'Modifier le style de vos cartes',
                        imageIcon: ImageIcon(
                          AssetImage('assets/card.png'),
                          color: Colors.white,
                          size: 25,
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
                    const SectionTitle(
                      title: 'Choix du nombre de paires',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GamemodeCard(
                                title: '4 Paires',
                                imageIcon: const ImageIcon(
                                  AssetImage('assets/pair.png'),
                                  size: 50,
                                  color: Color(0xFF7253A0),
                                ),
                                onTap: () => {
                                  ref.read(gameCardsProvider.notifier).set(generateCards(PairNumberEnum.FOUR)),
                                  gameSettings.pairNumber = PairNumberEnum.FOUR,
                                  ref.read(gameSettingsProvider.notifier).set(gameSettings),
                                  context.pushReplacementNamed(AppRoute.gameboard.name),
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GamemodeCard(
                                title: '8 Paires',
                                imageIcon: const ImageIcon(
                                  AssetImage('assets/pair.png'),
                                  size: 50,
                                  color: Color(0xFF7253A0),
                                ),
                                onTap: () => {
                                  ref.read(gameCardsProvider.notifier).set(generateCards(PairNumberEnum.EIGHT)),
                                  gameSettings.pairNumber = PairNumberEnum.EIGHT,
                                  ref.read(gameSettingsProvider.notifier).set(gameSettings),
                                  context.pushReplacementNamed(AppRoute.gameboard.name),
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GamemodeCard(
                                title: '10 Paires',
                                imageIcon: const ImageIcon(
                                  AssetImage('assets/pair.png'),
                                  size: 50,
                                  color: Color(0xFF7253A0),
                                ),
                                onTap: () => {
                                  ref.read(gameCardsProvider.notifier).set(generateCards(PairNumberEnum.TEN)),
                                  gameSettings.pairNumber = PairNumberEnum.TEN,
                                  ref.read(gameSettingsProvider.notifier).set(gameSettings),
                                  context.pushReplacementNamed(AppRoute.gameboard.name),
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GamemodeCard(
                                title: '15 Paires',
                                imageIcon: const ImageIcon(
                                  AssetImage('assets/pair.png'),
                                  size: 50,
                                  color: Color(0xFF7253A0),
                                ),
                                onTap: () => {
                                  ref.read(gameCardsProvider.notifier).set(generateCards(PairNumberEnum.FIFTEEN)),
                                  gameSettings.pairNumber = PairNumberEnum.FIFTEEN,
                                  ref.read(gameSettingsProvider.notifier).set(gameSettings),
                                  context.pushReplacementNamed(AppRoute.gameboard.name),
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<GameCard> generateCards(PairNumberEnum pairNumber) {
    List<GameCard> gameCards = [];

    for (int idx = 0; idx < pairNumber.number; idx++) {
      gameCards.add(
        GameCard(
            coupleIndex: idx % pairNumber.number,
            color: idx % 2 == 0 ? CardColorEnum.RED : CardColorEnum.BLACK,
            label: '${idx % pairNumber.number + 1}'),
      );
      gameCards.add(
        GameCard(
            coupleIndex: idx % pairNumber.number,
            color: idx % 2 == 0 ? CardColorEnum.RED : CardColorEnum.BLACK,
            label: '${idx % pairNumber.number + 1}'),
      );
    }
    return gameCards;
  }
}
