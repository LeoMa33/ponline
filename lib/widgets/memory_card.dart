import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ponline/provider/board_provider.dart';

class MemoryCard extends ConsumerStatefulWidget {
  const MemoryCard({required this.card, this.onTap, super.key});

  final GameCard card;
  final void Function()? onTap;

  @override
  ConsumerState createState() => _MemoryCardState();
}

class _MemoryCardState extends ConsumerState<MemoryCard> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.card.isVisible,
      child: GestureDetector(
        onTap: () => {
          setState(() {
            widget.onTap?.call();
          }),
        },
        child: AnimatedCrossFade(
          firstChild: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF232A35),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
          secondChild: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF232A35),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              border: Border.all(
                color: widget.card.color.color,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                widget.card.label,
                style: GoogleFonts.raleway(
                  color: widget.card.color.color,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          crossFadeState: !widget.card.isFlip
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
