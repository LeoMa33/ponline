import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ponline/widgets/memory_card.dart';

import '/provider/board_provider.dart';
import '/provider/game_settings_provider.dart';
import '/widgets/header/ingame_header.dart';

class GameboardScreen extends ConsumerStatefulWidget {
  const GameboardScreen({super.key});

  @override
  ConsumerState createState() => _GameboardScreenState();
}

class _GameboardScreenState extends ConsumerState<GameboardScreen> {
  List<GameCard> gameCards = [];

  @override
  void initState() {
    super.initState();

    ref.read(gameCardsProvider.notifier).shuffle();
    gameCards = ref.read(gameCardsProvider);
  }

  @override
  Widget build(BuildContext context) {
    GameSettings gameSettings = ref.read(gameSettingsProvider.notifier).get();
    int cardCount = gameSettings.pairNumber!.number * 2;

    ref.listen<List<GameCard>>(gameCardsProvider, (List<GameCard>? previousBoard, List<GameCard> nextBoard) {
      List<GameCard> flipedCard = nextBoard.where((GameCard card) => card.isFlip).toList();

      if (flipedCard.length != 2) return;
      int coupleIndex = flipedCard[0].coupleIndex;

      Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
        () => {
          setState(
            () {
              if (flipedCard.every((card) => card.coupleIndex == coupleIndex)) {
                ref.read(gameCardsProvider.notifier).valideCouple();
                gameSettings.pairFind += 1;

                if (gameSettings.pairFind == gameSettings.pairNumber!.number) {
                  if (context.mounted) {
                    context.pop();
                  }
                }
              } else {
                ref.read(gameCardsProvider.notifier).flipAll();
              }
            },
          ),
        },
      );
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        children: [
          const CustomInGameHeader(
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
                        if (!(gameCards.where((GameCard card) => card.isFlip).toList().length >= 2))
                          {
                            if (!gameCards[index].isFlip) gameCards[index].toogleFlip(),
                            ref.read(gameCardsProvider.notifier).state = [...gameCards],
                          }
                      },
                    );
                  },
                  itemCount: cardCount,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gameSettings.pairNumber!.columnNumber, crossAxisSpacing: 5, mainAxisSpacing: 5),
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
