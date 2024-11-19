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

  GameSettings({
    this.gamemode,
    this.playerNumber,
    this.pairNumber,
    this.pairFind = 0,
  });

  GameSettings copyWith({
    GamemodeEnum? gamemode,
    PlayerNumberEnum? playerNumber,
    PairNumberEnum? pairNumber,
    int? pairFind,
  }) {
    return GameSettings(
      gamemode: gamemode ?? this.gamemode,
      playerNumber: playerNumber ?? this.playerNumber,
      pairNumber: pairNumber ?? this.pairNumber,
      pairFind: pairFind ?? this.pairFind,
    );
  }
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

  void addOnePair() {
    state = state.copyWith(pairFind: state.pairFind + 1);
  }

  GameSettings get() => state;
}

final NotifierProvider<GameSettingsNotifier, GameSettings> gameSettingsProvider =
    NotifierProvider<GameSettingsNotifier, GameSettings>(GameSettingsNotifier.new);
