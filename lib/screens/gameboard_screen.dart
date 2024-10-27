import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ponline/widgets/memory_card.dart';

import '../provider/board_provider.dart';
import '../provider/game_settings_provider.dart';
import '../widgets/header.dart';

class GameboardScreen extends ConsumerStatefulWidget {
  const GameboardScreen({super.key});

  @override
  ConsumerState createState() => _GameboardScreenState();
}

class _GameboardScreenState extends ConsumerState<GameboardScreen> {
  @override
  Widget build(BuildContext context) {
    GameSettings gameSettings = ref.read(gameSettingsProvider.notifier).get();
    int cardCount = gameSettings.pairNumber!.number * 2;
    ref.read(gameCardsProvider.notifier).shuffle();
    List<GameCard> gameCards = ref.read(gameCardsProvider.notifier).get();

    ref.listen<List<GameCard>>(gameCardsProvider,
        (List<GameCard>? previousBoard, List<GameCard> nextBoard) {
      List<GameCard> flipedCard =
          nextBoard.where((GameCard card) => card.isFlip).toList();
      if (flipedCard.length != 2) return;

      Future.delayed(
        const Duration(
          milliseconds: 800,
        ),
        () => {
          setState(
            () {
              ref.read(gameCardsProvider.notifier).flipAll();
            },
          ),
        },
      );
    });

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return MemoryCard(
                      card: gameCards.elementAt(index),
                      onTap: () => {
                        if (!gameCards[index].isFlip)
                          gameCards[index].toogleFlip(),
                      },
                    );
                  },
                  itemCount: cardCount,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gameSettings.pairNumber!.columnNumber,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
