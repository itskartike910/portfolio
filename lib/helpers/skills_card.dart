import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';

class Skills extends StatefulWidget {
  final String skillName;
  final String? iconPath;

  const Skills({
    super.key,
    required this.skillName,
    this.iconPath,
  });

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Chip(
        avatar: widget.iconPath != null
            ? Image.asset(
                widget.iconPath!,
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
              )
            : null,
        label: Text(
          widget.skillName,
          style: GoogleFonts.ubuntuMono(
            color: CustomColors.cardText,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        backgroundColor: CustomColors.cardBG,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
        elevation: 5,
        shadowColor: const Color.fromARGB(255, 175, 175, 175),
        visualDensity: VisualDensity.comfortable,
      ),
    );
  }
}
