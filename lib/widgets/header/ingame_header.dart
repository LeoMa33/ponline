import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/game_settings_provider.dart';

class CustomInGameHeader extends ConsumerStatefulWidget {
  const CustomInGameHeader({this.isBackButtonEnable = false, this.isProfilEnable = true, super.key});

  final bool isBackButtonEnable;
  final bool isProfilEnable;

  @override
  ConsumerState<CustomInGameHeader> createState() => _CustomInGameHeaderState();
}

class _CustomInGameHeaderState extends ConsumerState<CustomInGameHeader> {
  @override
  Widget build(BuildContext context) {
    GameSettings gameSettings = ref.watch(gameSettingsProvider.notifier).get();

    ref.listen<GameSettings>(gameSettingsProvider, (GameSettings? previousBoard, GameSettings nextBoard) {});

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(gameSettings.pairFind.toString()),
        Visibility(
          visible: widget.isBackButtonEnable,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              context.pop();
            },
          ),
        ),
        Visibility(
          visible: widget.isProfilEnable,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: ShapeDecoration(
                  color: const Color(0xFF232A35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      color: Color(0xFF7253A0),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '120',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/50x50"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(
                    side: BorderSide(width: 2, color: Color(0xFF7473D5)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}