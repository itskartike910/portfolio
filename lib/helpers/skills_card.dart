import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';

class SkillsCard extends StatefulWidget {
  final String skillName;
  final String? iconPath;

  const SkillsCard({
    super.key,
    required this.skillName,
    this.iconPath,
  });

  @override
  State<SkillsCard> createState() => _SkillsState();
}

class _SkillsState extends State<SkillsCard> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Chip(
          avatar: widget.iconPath != null
              ? ClipOval(
                  child: Image.asset(
                    widget.iconPath!,
                    width: isHovering ? 20.5 : 20.0,
                    height: isHovering ? 20.5 : 20.0,
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          label: Text(
            widget.skillName,
            style: GoogleFonts.ubuntuMono(
              color: CustomColors.cardText,
              fontWeight: FontWeight.w700,
              fontSize: isHovering ? 16.25 : 16,
            ),
          ),
          backgroundColor: isHovering
              ? const Color.fromARGB(255, 0, 20, 180)
              : CustomColors.cardBG,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
          elevation: 5,
          shadowColor: isHovering
              ? const Color.fromARGB(255, 50, 215, 255)
              : const Color.fromARGB(255, 175, 175, 175),
          visualDensity: VisualDensity.comfortable,
        ),
      ),
    );
  }
}
