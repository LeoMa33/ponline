import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CardColorEnum {
  RED(color: Colors.red),
  BLACK(color: Colors.black);

  const CardColorEnum({required this.color});

  final Color color;
}

class GameCard {
  int coupleIndex;
  CardColorEnum color;
  String label;
  bool isFlip = false;
  bool isVisible = true;

  GameCard({required this.coupleIndex, required this.color, required this.label});

  void toogleFlip() => isFlip = !isFlip;
  void hide() => isVisible = false;
}

class BoardNotifier extends Notifier<List<GameCard>> {
  @override
  List<GameCard> build() {
    return [];
  }

  void set(List<GameCard> gameCards) {
    state = gameCards;
  }

  void shuffle() {
    state.shuffle();
    state.shuffle();
  }

  void valideCouple() {
    List<GameCard> tmp = [];
    for (var card in state) {
      if (card.isFlip) {
        card.hide();
        card.toogleFlip();
      }
      tmp.add(card);
    }

    state = tmp;
  }

  void flipAll() {
    List<GameCard> tmp = [];
    for (var card in state) {
      if (card.isFlip) card.toogleFlip();
      tmp.add(card);
    }

    state = tmp;
  }

  void clear() {
    state = [];
  }
}

final NotifierProvider<BoardNotifier, List<GameCard>> gameCardsProvider =
    NotifierProvider<BoardNotifier, List<GameCard>>(BoardNotifier.new);
