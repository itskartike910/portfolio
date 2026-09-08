// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialProfile extends StatefulWidget {
  final String profilName;
  final String? iconPath;
  final Color? bgColor;
  final Color txtColor;
  final String? url;
  final bool isMobile;

  const SocialProfile({
    super.key,
    required this.profilName,
    this.iconPath,
    this.bgColor,
    this.url,
    required this.txtColor,
    required this.isMobile,
  });

  @override
  State<SocialProfile> createState() => _SocialProfileState();
}

class _SocialProfileState extends State<SocialProfile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final brandColor = widget.bgColor ?? CustomColors.primaryAccent;

    return MouseRegion(
      onEnter: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchURL,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, isHovering ? -3.0 : 0.0),
          margin: EdgeInsets.symmetric(
            vertical: widget.isMobile ? 3 : 4,
            horizontal: widget.isMobile ? 3 : 5,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  horizontal: widget.isMobile ? 12 : 16,
                  vertical: widget.isMobile ? 8 : 10,
                ),
                decoration: BoxDecoration(
                  color: isHovering
                      ? brandColor.withOpacity(0.20)
                      : const Color(0x0EFFFFFF),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isHovering
                        ? brandColor.withOpacity(0.6)
                        : const Color(0x18FFFFFF),
                    width: 1,
                  ),
                  boxShadow: isHovering
                      ? [
                          BoxShadow(
                            color: brandColor.withOpacity(0.25),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ]
                      : [
                          const BoxShadow(
                            color: Color(0x30000000),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.iconPath != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          widget.iconPath!,
                          width: widget.isMobile ? 16 : 18,
                          height: widget.isMobile ? 16 : 18,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      widget.profilName,
                      style: GoogleFonts.inter(
                        color: isHovering ? Colors.white : CustomColors.whitePrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: widget.isMobile ? 12 : 14,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_outward_rounded,
                      size: widget.isMobile ? 12 : 13,
                      color: isHovering
                          ? brandColor
                          : CustomColors.whiteSecondary.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
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
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch ${widget.url}')),
        );
      }
    }
  }
}
