import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialProfile extends StatefulWidget {
  final String profilName;
  final String? iconPath;
  final Color? bgColor;
  final Color txtColor;
  final String? url;

  const SocialProfile({
    super.key,
    required this.profilName,
    this.iconPath,
    this.bgColor,
    this.url,
    required this.txtColor,
  });

  @override
  State<SocialProfile> createState() => _SocialProfileState();
}

class _SocialProfileState extends State<SocialProfile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        padding: EdgeInsets.all(isHovering ? 5 : 2),
        child: InkWell(
          onTap: _launchURL,
          child: Chip(
            avatar: widget.iconPath != null
                ? ClipOval(
                    child: Image.asset(
                      widget.iconPath!,
                      width: 20.0,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
                  )
                : null,
            label: Text(
              widget.profilName,
              style: GoogleFonts.oswald(
                color: widget.txtColor,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            backgroundColor:
                isHovering ? Colors.yellow.withOpacity(0.75) : widget.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            elevation: 6,
            shadowColor: widget.bgColor,
            visualDensity: VisualDensity.comfortable,
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    if (widget.url != null) {
      final uri = Uri.parse(widget.url!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch ${widget.url}')),
        );
      }
    }
  }
}
