import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ButtonType {
  COLORED,
  WHITE,
}

class CustomButton extends StatefulWidget {
  const CustomButton(
      {required this.title,
      this.onTap,
      this.type = ButtonType.COLORED,
      super.key});

  final String title;
  final void Function()? onTap;
  final ButtonType type;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        widget.onTap?.call(),
      },
      child: Opacity(
        opacity: widget.onTap == null ? 0.5 : 1,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
              begin: const Alignment(1.00, -0.02),
              end: const Alignment(-1, 0.02),
              colors: widget.type == ButtonType.COLORED
                  ? [const Color(0xFF7253A0), const Color(0xFF7473D5)]
                  : [const Color(0xFFBDD6EE), Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title.toUpperCase(),
                  style: GoogleFonts.raleway(
                      color: widget.type == ButtonType.COLORED
                          ? Colors.white
                          : const Color(0xFF232A35),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: widget.type == ButtonType.COLORED
                      ? Colors.white
                      : const Color(0xFF232A35),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
