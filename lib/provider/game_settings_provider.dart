import 'package:flutter_riverpod/flutter_riverpod.dart';

enum GamemodeEnum {
  DAILY,
  AVEUGLE,
  FLASH,
}

enum PlayerNumberEnum {
  SOLITAIRE,
  DUO,
}

enum PairNumberEnum {
  FOUR(number: 4, columnNumber: 4),
  EIGHT(number: 8, columnNumber: 4),
  TEN(number: 10, columnNumber: 4),
  FIFTEEN(number: 15, columnNumber: 5);

  const PairNumberEnum({required this.number, required this.columnNumber});

  final int number;
  final int columnNumber;
}

class GameSettings {
  GamemodeEnum? gamemode;
  PlayerNumberEnum? playerNumber;
  PairNumberEnum? pairNumber;
  int pairFind = 0;
}

class GameSettingsNotifier extends Notifier<GameSettings> {
  @override
  GameSettings build() {
    return GameSettings();
  }

  void set(GameSettings gameSettings) {
    state = gameSettings;
  }

  void clear() {
    state = GameSettings();
  }

  GameSettings get() => state;
}

final NotifierProvider<GameSettingsNotifier, GameSettings> gameSettingsProvider =
    NotifierProvider<GameSettingsNotifier, GameSettings>(GameSettingsNotifier.new);
