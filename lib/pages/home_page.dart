// ignore_for_file: deprecated_member_use

import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/glass_card.dart';
import 'package:portfolio/widgets/contact_me.dart';
import 'package:portfolio/widgets/experience.dart';
import 'package:portfolio/widgets/my_profile.dart';
import 'package:portfolio/widgets/projects.dart';
import 'package:portfolio/widgets/skills.dart';
import 'package:portfolio/widgets/achievements.dart';
import 'package:portfolio/widgets/stats_metrics.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMobile = false;
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  final myProfileKey   = GlobalKey();
  final skillKey       = GlobalKey();
  final experienceKey  = GlobalKey();
  final achievementKey = GlobalKey();
  final projectKey     = GlobalKey();
  final contactMeKey   = GlobalKey();
  final statsKey       = GlobalKey();

  final String resumeUrl =
      "https://drive.google.com/file/d/1Cqrs-sYmVCJ_if73wZMkS4IUppMjzqbX/view?usp=sharing";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final scrolled = _scrollController.offset > 20;
    if (scrolled != _isScrolled) {
      setState(() {
        _isScrolled = scrolled;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    if (key.currentContext == null) return;
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    isMobile = screenWidth < 1000;

    return Scaffold(
      backgroundColor: CustomColors.scaffoldBG,
      drawer: isMobile ? _buildDrawer() : null,
      body: Stack(
        children: [
          // ── 1. Animated Glowing Blob Background ────────────────────────────
          Positioned.fill(
            child: Container(color: CustomColors.scaffoldBG),
          ),
          const Positioned(
            top: -150,
            left: -150,
            child: GlowBlob(
              color: CustomColors.blobPurple,
              size: 550,
              duration: Duration(seconds: 7),
            ),
          ),
          const Positioned(
            top: 200,
            right: -200,
            child: GlowBlob(
              color: CustomColors.blobCyan,
              size: 480,
              duration: Duration(seconds: 9),
              minOpacity: 0.04,
              maxOpacity: 0.10,
            ),
          ),
          const Positioned(
            top: 900,
            left: -100,
            child: GlowBlob(
              color: CustomColors.blobPink,
              size: 400,
              duration: Duration(seconds: 8),
              minOpacity: 0.04,
              maxOpacity: 0.09,
            ),
          ),
          const Positioned(
            bottom: 500,
            right: -150,
            child: GlowBlob(
              color: CustomColors.blobPurple,
              size: 460,
              duration: Duration(seconds: 10),
              minOpacity: 0.05,
              maxOpacity: 0.11,
            ),
          ),
          const Positioned(
            bottom: 100,
            left: 100,
            child: GlowBlob(
              color: CustomColors.blobCyan,
              size: 360,
              duration: Duration(seconds: 6),
              minOpacity: 0.03,
              maxOpacity: 0.08,
            ),
          ),

          // ── 2. Main Scrollable Page Content ────────────────────────────────
          SafeArea(
            top: false,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                top: isMobile ? 85 : 95,
                bottom: 40,
                left: isMobile ? 10 : 20,
                right: isMobile ? 10 : 20,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1800),
                  child: Column(
                    children: [
                      // ── My Profile ──────────────────────────────────────────
                      _SectionHeader(
                        key: myProfileKey,
                        label: "My Profile",
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 16),
                      MyProfile(isMobile: isMobile),
                      const SizedBox(height: 36),

                      // ── Experience & Skills (Side-by-Side on Desktop) ────────
                      if (!isMobile)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  _SectionHeader(
                                    key: experienceKey,
                                    label: "Experience",
                                    icon: Icons.work_outline,
                                  ),
                                  const SizedBox(height: 16),
                                  const Experience(isMobile: false),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  _SectionHeader(
                                    key: skillKey,
                                    label: "My Skills",
                                    icon: Icons.code_outlined,
                                  ),
                                  const SizedBox(height: 16),
                                  const Skills(),
                                ],
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            _SectionHeader(
                              key: experienceKey,
                              label: "Experience",
                              icon: Icons.work_outline,
                            ),
                            const SizedBox(height: 16),
                            const Experience(isMobile: true),
                            const SizedBox(height: 36),
                            _SectionHeader(
                              key: skillKey,
                              label: "My Skills",
                              icon: Icons.code_outlined,
                            ),
                            const SizedBox(height: 16),
                            const Skills(),
                          ],
                        ),

                      const SizedBox(height: 36),

                      // ── Stats & Metrics ─────────────────────────────────────
                      _SectionHeader(
                        key: statsKey,
                        label: "Stats & Metrics",
                        icon: Icons.bar_chart_rounded,
                      ),
                      const SizedBox(height: 16),
                      StatsMetrics(isMobile: isMobile),
                      const SizedBox(height: 36),

                      // ── Achievements ────────────────────────────────────────
                      _SectionHeader(
                        key: achievementKey,
                        label: "Achievements",
                        icon: Icons.emoji_events_outlined,
                      ),
                      const SizedBox(height: 16),
                      Achievements(isMobile: isMobile),
                      const SizedBox(height: 36),

                      // ── Projects ────────────────────────────────────────────
                      _SectionHeader(
                        key: projectKey,
                        label: "My Projects",
                        icon: Icons.folder_outlined,
                      ),
                      const SizedBox(height: 16),
                      const Projects(),
                      const SizedBox(height: 36),

                      // ── Contact ─────────────────────────────────────────────
                      _SectionHeader(
                        key: contactMeKey,
                        label: "Contact Me",
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 16),
                      ContactMe(isMobile: isMobile),
                      const SizedBox(height: 36),

                      // ── Footer Badges & Copyright ─────────────────────────
                      const SizedBox(height: 10),
                      const Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 8,
                        children: [
                          _FooterBadgePill(
                            icon: Icons.flutter_dash,
                            label: "Made with",
                            value: "Flutter",
                            accentColor: Color(0xFF02569B),
                          ),
                          _FooterBadgePill(
                            icon: Icons.code_rounded,
                            label: "Developed By",
                            value: "Kartik",
                            accentColor: Color(0xFF7B2FFE),
                          ),
                          _FooterBadgePill(
                            icon: Icons.coffee_rounded,
                            label: "Fueled by",
                            value: "Coffee ☕",
                            accentColor: Color(0xFF6F4E37),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── 3. CodeHelp-Style Animated Floating Translucent Glassy AppBar ──
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildCodeHelpFloatingAppBar(context, isMobile),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // CodeHelp-Style Floating Animated Translucent Glassy AppBar
  // ═══════════════════════════════════════════════════════════════════════════

  Widget _buildCodeHelpFloatingAppBar(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    final floatingWidth = math.min(1750.0, screenWidth - (isMobile ? 20.0 : 48.0));

    return SafeArea(
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          width: _isScrolled ? floatingWidth : screenWidth,
          margin: EdgeInsets.only(
            top: _isScrolled ? 12 : 0,
          ),
          height: _isScrolled ? 58 : 66,
          decoration: BoxDecoration(
            color: _isScrolled
                ? const Color(0x40080818) // Translucent dark glass
                : const Color(0x1F060612), // Subtle top docked header
            borderRadius: BorderRadius.circular(_isScrolled ? 100 : 0),
            border: Border.all(
              color: _isScrolled
                  ? Colors.white.withOpacity(0.14)
                  : Colors.white.withOpacity(0.06),
              width: 1.0,
            ),
            boxShadow: _isScrolled
                ? [
                    const BoxShadow(
                      color: Color(0x60000000),
                      blurRadius: 24,
                      offset: Offset(0, 8),
                    ),
                    BoxShadow(
                      color: CustomColors.purpleAccent.withOpacity(0.12),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_isScrolled ? 100 : 0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 20,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : (_isScrolled ? 22 : 28),
                ),
                child: Row(
                  children: [
                    // Brand Logo
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _scrollTo(myProfileKey),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.primaryAccent.withOpacity(0.12),
                                border: Border.all(
                                  color: CustomColors.primaryAccent.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: const Icon(
                                Icons.code_rounded,
                                color: CustomColors.primaryAccent,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Kartik",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 17,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Desktop Navigation items
                    if (!isMobile) ...[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNavButton("Profile", Icons.person_outline, () => _scrollTo(myProfileKey)),
                          _buildNavButton("Experience", Icons.work_outline, () => _scrollTo(experienceKey)),
                          _buildNavButton("Skills", Icons.code_outlined, () => _scrollTo(skillKey)),
                          _buildNavButton("Stats", Icons.bar_chart_rounded, () => _scrollTo(statsKey)),
                          _buildNavButton("Achievements", Icons.emoji_events_outlined, () => _scrollTo(achievementKey)),
                          _buildNavButton("Projects", Icons.folder_outlined, () => _scrollTo(projectKey)),
                          _buildNavButton("Contact", Icons.email_outlined, () => _scrollTo(contactMeKey)),
                        ],
                      ),
                      const SizedBox(width: 12),

                      // CodeHelp-style clean frosted glass CTA button ("Resume")
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => launchUrl(Uri.parse(resumeUrl)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: CustomColors.primaryAccent.withOpacity(0.14),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: CustomColors.primaryAccent.withOpacity(0.35),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomColors.primaryAccent.withOpacity(0.12),
                                  blurRadius: 12,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.description_outlined, color: CustomColors.primaryAccent, size: 14),
                                const SizedBox(width: 6),
                                Text(
                                  "Resume",
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],

                    // Mobile Menu Toggle
                    if (isMobile)
                      Builder(
                        builder: (ctx) => IconButton(
                          onPressed: () => Scaffold.of(ctx).openDrawer(),
                          icon: const Icon(Icons.menu_rounded, color: Colors.white),
                        ),
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

  Widget _buildNavButton(String label, IconData icon, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: CustomColors.whitePrimary.withOpacity(0.85),
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }

  // ── Mobile Drawer ──────────────────────────────────────────────────────────
  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF0A0A16),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
                decoration: BoxDecoration(
                  color: const Color(0x18FFFFFF),
                  border: Border(
                    bottom: BorderSide(color: Colors.white.withOpacity(0.08)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.primaryAccent.withOpacity(0.15),
                        border: Border.all(
                          color: CustomColors.primaryAccent.withOpacity(0.3),
                        ),
                      ),
                      child: const Icon(Icons.code_rounded, color: CustomColors.primaryAccent, size: 26),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Kartik Kumar",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Software Engineer · AI & Systems",
                      style: GoogleFonts.inter(
                        color: CustomColors.whiteSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  children: [
                    _drawerItem(Icons.person_outline, "Profile", () => _scrollTo(myProfileKey)),
                    _drawerItem(Icons.work_outline, "Experience", () => _scrollTo(experienceKey)),
                    _drawerItem(Icons.code_outlined, "Skills", () => _scrollTo(skillKey)),
                    _drawerItem(Icons.bar_chart_rounded, "Stats & Metrics", () => _scrollTo(statsKey)),
                    _drawerItem(Icons.emoji_events_outlined, "Achievements", () => _scrollTo(achievementKey)),
                    _drawerItem(Icons.folder_outlined, "Projects", () => _scrollTo(projectKey)),
                    _drawerItem(Icons.email_outlined, "Contact", () => _scrollTo(contactMeKey)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "© Built with Flutter Web",
                  style: GoogleFonts.inter(color: Colors.white24, fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Future.delayed(const Duration(milliseconds: 300), onTap);
      },
      leading: Icon(icon, color: CustomColors.primaryAccent, size: 20),
      title: Text(
        label,
        style: GoogleFonts.inter(
          color: CustomColors.whitePrimary,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      hoverColor: CustomColors.primaryAccent.withOpacity(0.08),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
    );
  }
}

// ── Section Header Widget with Clean Frosted Capsule ─────────────────────────

class _SectionHeader extends StatelessWidget {
  final String label;
  final IconData icon;

  const _SectionHeader({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: 32,
          color: Colors.white.withOpacity(0.08),
        ),
        const SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0x12FFFFFF),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.white.withOpacity(0.12),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 14, color: CustomColors.primaryAccent),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 1,
          width: 32,
          color: Colors.white.withOpacity(0.08),
        ),
      ],
    );
  }
}

// ── Footer Badge Pill Widget (GitHub Shields Style) ──────────────────────────

class _FooterBadgePill extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color accentColor;

  const _FooterBadgePill({
    required this.icon,
    required this.label,
    required this.value,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white.withOpacity(0.12), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Left label side
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              color: const Color(0xFF1E1E2E),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 13, color: Colors.white70),
                  const SizedBox(width: 5),
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Right value side
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
              color: accentColor,
              child: Text(
                value,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
