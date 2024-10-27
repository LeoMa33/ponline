import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GamemodeCard extends StatelessWidget {
  const GamemodeCard(
      {required this.title, required this.icon, this.onTap, super.key});

  final String title;
  final Icon icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Opacity(
        opacity: onTap == null ? 0.5 : 1,
        child: GestureDetector(
          onTap: () => {
            onTap?.call(),
          },
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFF232A35),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: icon,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: GoogleFonts.raleway(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
