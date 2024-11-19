import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

enum DirectionEnum {
  RIGHT2LEFT(direction: TextDirection.rtl),
  LEFT2RIGHT(direction: TextDirection.ltr);

  const DirectionEnum({required this.direction});

  final TextDirection direction;
}

class UserPair extends ConsumerStatefulWidget {
  const UserPair({required this.pairCount, this.direction = DirectionEnum.LEFT2RIGHT, super.key});

  final int pairCount;
  final DirectionEnum direction;

  @override
  ConsumerState createState() => _UserPairState();
}

class _UserPairState extends ConsumerState<UserPair> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: ShapeDecoration(
        color: const Color(0xFF232A35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: widget.direction.direction,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: widget.direction.direction,
            children: [
              const Icon(
                Icons.difference,
                color: Color(0xFF7253A0),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.pairCount.toString(),
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
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
    );
  }
}
