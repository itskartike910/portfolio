// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/glass_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatefulWidget {
  final bool isMobile;
  const ContactMe({super.key, required this.isMobile});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  bool _copied = false;

  void _copyEmail() {
    Clipboard.setData(const ClipboardData(text: 'kumarkartik147359@gmail.com'));
    setState(() => _copied = true);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF13132B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: CustomColors.greenAccent, size: 18),
            const SizedBox(width: 10),
            Text(
              'Email copied to clipboard!',
              style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NeonGlassCard(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: widget.isMobile ? 24 : 34,
        horizontal: widget.isMobile ? 18 : 32,
      ),
      primaryGlow: CustomColors.primaryAccent,
      secondaryGlow: CustomColors.purpleAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
              // ── Header ──────────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: CustomColors.primaryAccent.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: CustomColors.primaryAccent.withOpacity(0.3),
                      ),
                    ),
                    child: const Icon(
                      Icons.mail_outline_rounded,
                      color: CustomColors.primaryAccent,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    "Let's Connect",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: widget.isMobile ? 22 : 26,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                "Open to collaborating on systems architecture, Chromium optimization, and agentic AI projects.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: CustomColors.whiteSecondary,
                  fontSize: widget.isMobile ? 12.5 : 14,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),

              // ── Email Quick Card with Copy ──────────────────────────────
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: _copyEmail,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0x0AFFFFFF),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _copied
                                ? CustomColors.greenAccent.withOpacity(0.5)
                                : CustomColors.primaryAccent.withOpacity(0.3),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (_copied
                                      ? CustomColors.greenAccent
                                      : CustomColors.primaryAccent)
                                  .withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: CustomColors.primaryAccent.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.alternate_email_rounded,
                                color: CustomColors.primaryAccent,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Direct Email",
                                    style: GoogleFonts.inter(
                                      color: CustomColors.whiteSecondary,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "kumarkartik147359@gmail.com",
                                    style: GoogleFonts.jetBrainsMono(
                                      color: CustomColors.whitePrimary,
                                      fontSize: widget.isMobile ? 12 : 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: _copied
                                    ? CustomColors.greenAccent.withOpacity(0.18)
                                    : CustomColors.primaryAccent.withOpacity(0.14),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _copied
                                        ? Icons.check_rounded
                                        : Icons.copy_rounded,
                                    color: _copied
                                        ? CustomColors.greenAccent
                                        : CustomColors.primaryAccent,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    _copied ? "Copied" : "Copy",
                                    style: GoogleFonts.inter(
                                      color: _copied
                                          ? CustomColors.greenAccent
                                          : CustomColors.primaryAccent,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Shoot an Email Button ────────────────────────────────────
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => _launchURL("mailto:kumarkartik147359@gmail.com"),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: CustomColors.primaryAccent.withOpacity(0.14),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: CustomColors.primaryAccent.withOpacity(0.35),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.primaryAccent.withOpacity(0.15),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.send_rounded, color: CustomColors.primaryAccent, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          "Shoot an Email",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ── Divider ──────────────────────────────────────────────────
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white.withOpacity(0.08),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "OR FIND ME ON",
                      style: GoogleFonts.inter(
                        color: CustomColors.whiteSecondary.withOpacity(0.7),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white.withOpacity(0.08),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // ── Social & Channel Badges ──────────────────────────────────
              const Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  _SocialPill(
                    name: "LinkedIn",
                    iconPath: "assets/icons/linkedin.png",
                    accent: Color(0xFF0A66C2),
                    url: "https://www.linkedin.com/in/kartikskr/",
                  ),
                  _SocialPill(
                    name: "GitHub",
                    iconPath: "assets/icons/github.jpg",
                    accent: Color(0xFF7B2FFE),
                    url: "https://github.com/itskartike910",
                  ),
                  _SocialPill(
                    name: "Telegram",
                    iconPath: "assets/icons/telegram.png",
                    accent: Color(0xFF0088CC),
                    url: "https://t.me/itskartike910",
                  ),
                  _SocialPill(
                    name: "Discord",
                    iconPath: "assets/icons/discord.png",
                    accent: Color(0xFF5865F2),
                    url: "https://discord.com/channels/kartikkumar910",
                  ),
                  _SocialPill(
                    name: "WhatsApp",
                    iconPath: "assets/icons/whatsapp.jpeg",
                    accent: Color(0xFF25D366),
                    url: "https://wa.me/+918434376401",
                  ),
                  _SocialPill(
                    name: "Instagram",
                    iconPath: "assets/icons/instagram.png",
                    accent: Color(0xFFE4405F),
                    url: "https://www.instagram.com/its_kartike/",
                  ),
                ],
              ),
            ],
          ),
        );
      }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _SocialPill extends StatefulWidget {
  final String name;
  final String iconPath;
  final Color accent;
  final String url;

  const _SocialPill({
    required this.name,
    required this.iconPath,
    required this.accent,
    required this.url,
  });

  @override
  State<_SocialPill> createState() => _SocialPillState();
}

class _SocialPillState extends State<_SocialPill> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, _hovered ? -3.0 : 0.0),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered
                ? widget.accent.withOpacity(0.18)
                : const Color(0x0AFFFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? widget.accent.withOpacity(0.55)
                  : const Color(0x14FFFFFF),
              width: 1,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.accent.withOpacity(0.2),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  widget.iconPath,
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                widget.name,
                style: GoogleFonts.inter(
                  color: _hovered ? Colors.white : CustomColors.whitePrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
