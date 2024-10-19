import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatefulWidget {
  const SectionTitle({required this.title, this.child, super.key});

  final String title;
  final Widget? child;

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title,
            style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
        widget.child ?? Container(),
      ],
    );
  }
}
