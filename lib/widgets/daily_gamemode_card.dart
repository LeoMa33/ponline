import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyGamemodeCard extends StatelessWidget {
  const DailyGamemodeCard({this.onTap, super.key});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onTap == null ? 0.5 : 1,
      child: Container(
        height: 75,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(1.00, -0.04),
            end: Alignment(-1, 0.04),
            colors: [Color(0xFF232A35), Color(0xFF3B2A67)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 25, top: 10, bottom: 10),
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Relevez 3 défis',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Des iris au bout du 3ème jour',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
