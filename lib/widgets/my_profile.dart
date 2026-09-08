// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/glass_card.dart';
import 'package:portfolio/helpers/social_profile.dart';
import 'package:portfolio/widgets/about_me.dart';

class MyProfile extends StatefulWidget {
  final bool isMobile;
  const MyProfile({super.key, required this.isMobile});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> with SingleTickerProviderStateMixin {
  bool isHovering = false;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NeonGlassCard(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: widget.isMobile ? 22 : 36,
        horizontal: widget.isMobile ? 16 : 32,
      ),
      primaryGlow: CustomColors.primaryAccent,
      secondaryGlow: CustomColors.purpleAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Hero Section with Profile
          widget.isMobile ? _buildMobileLayout() : _buildDesktopLayout(),

          const SizedBox(height: 32),

          // Social Links in Frosted Glass Container
          _buildSocialLinks(),

          const SizedBox(height: 28),

          // About Me Section
          AboutMe(isMobile: widget.isMobile),

          const SizedBox(height: 32),

          // What I Bring to the Table Section
          _buildCapabilitiesSection(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Text
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Greeting badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: CustomColors.primaryAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: CustomColors.primaryAccent.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: CustomColors.greenAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Hello, I'm",
                      style: GoogleFonts.inter(
                        color: CustomColors.primaryAccent,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Name
              Text(
                "Kartik Kumar",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 54,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.2,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 18),

              // Animated Roles
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: CustomColors.primaryAccent.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.code_rounded,
                      color: CustomColors.primaryAccent,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Software Engineer",
                        textStyle: GoogleFonts.inter(
                          color: CustomColors.primaryAccent,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 90),
                      ),
                      TypewriterAnimatedText(
                        "AI & Agentic Systems Builder",
                        textStyle: GoogleFonts.inter(
                          color: CustomColors.purpleAccent,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 90),
                      ),
                      TypewriterAnimatedText(
                        "Backend & Systems Engineer",
                        textStyle: GoogleFonts.inter(
                          color: CustomColors.greenAccent,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 90),
                      ),
                      TypewriterAnimatedText(
                        "Chromium & Automation Specialist",
                        textStyle: GoogleFonts.inter(
                          color: CustomColors.yellowPrimary,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 90),
                      ),
                      TypewriterAnimatedText(
                        "Competitive Programmer (1829)",
                        textStyle: GoogleFonts.inter(
                          color: CustomColors.secondaryAccent,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 90),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Quick Stats Glass Chips
              Wrap(
                spacing: 14,
                runSpacing: 12,
                children: [
                  _buildStatChip("1+ Years", "Experience", CustomColors.primaryAccent),
                  _buildStatChip("15+", "Projects", CustomColors.greenAccent),
                  _buildStatChip("1000+", "DSA Solved", CustomColors.yellowPrimary),
                  _buildStatChip("1829", "LeetCode Peak", CustomColors.purpleAccent),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(width: 40),

        // Right side - Profile Image
        Expanded(
          flex: 2,
          child: _buildProfileImage(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Header Row: Greeting & Name on Left, Small Profile Avatar on Right
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left side - "Hello, I'm" & "Kartik Kumar"
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: CustomColors.primaryAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: CustomColors.primaryAccent.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: CustomColors.greenAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Hello, I'm",
                          style: GoogleFonts.inter(
                            color: CustomColors.primaryAccent,
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Name
                  Text(
                    "Kartik Kumar",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.8,
                      height: 1.15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Right side - Small profile image
            _buildProfileImage(size: 84),
          ],
        ),

        const SizedBox(height: 14),

        // Animated Roles
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: CustomColors.primaryAccent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.code_rounded,
                color: CustomColors.primaryAccent,
                size: 16,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Software Engineer",
                    textStyle: GoogleFonts.inter(
                      color: CustomColors.primaryAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    speed: const Duration(milliseconds: 90),
                  ),
                  TypewriterAnimatedText(
                    "AI & Agentic Builder",
                    textStyle: GoogleFonts.inter(
                      color: CustomColors.purpleAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    speed: const Duration(milliseconds: 90),
                  ),
                  TypewriterAnimatedText(
                    "Backend & Systems",
                    textStyle: GoogleFonts.inter(
                      color: CustomColors.greenAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    speed: const Duration(milliseconds: 90),
                  ),
                  TypewriterAnimatedText(
                    "Competitive Coder (1829)",
                    textStyle: GoogleFonts.inter(
                      color: CustomColors.secondaryAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    speed: const Duration(milliseconds: 90),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Quick Stats Glass Chips
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildStatChip("1+ Years", "Experience", CustomColors.primaryAccent),
            _buildStatChip("15+", "Projects", CustomColors.greenAccent),
            _buildStatChip("1000+", "DSA Solved", CustomColors.yellowPrimary),
            _buildStatChip("1829", "LeetCode Peak", CustomColors.purpleAccent),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage({double size = 290}) {
    final ringSize = size + (widget.isMobile ? 12 : 20);
    return Center(
      child: MouseRegion(
        onEnter: (event) => setState(() => isHovering = true),
        onExit: (event) => setState(() => isHovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Subtle dual-tone glow ring
              RotationTransition(
                turns: _rotationAnimation,
                child: Container(
                  width: ringSize,
                  height: ringSize,
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [
                        CustomColors.primaryAccent.withOpacity(0.55),
                        CustomColors.purpleAccent.withOpacity(0.55),
                        CustomColors.primaryAccent.withOpacity(0.2),
                        CustomColors.purpleAccent.withOpacity(0.55),
                        CustomColors.primaryAccent.withOpacity(0.55),
                      ],
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF080814),
                    ),
                  ),
                ),
              ),

              // Profile Image
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isHovering ? size + (widget.isMobile ? 2 : 6) : size,
                height: isHovering ? size + (widget.isMobile ? 2 : 6) : size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.primaryAccent.withOpacity(isHovering ? 0.35 : 0.2),
                      blurRadius: isHovering ? (widget.isMobile ? 14 : 28) : (widget.isMobile ? 10 : 18),
                      spreadRadius: isHovering ? 2 : 1,
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage("assets/profile.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatChip(String value, String label, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: widget.isMobile ? 11 : 18,
            vertical: widget.isMobile ? 7 : 12,
          ),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withOpacity(0.25),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: GoogleFonts.inter(
                  color: color,
                  fontSize: widget.isMobile ? 14 : 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: CustomColors.whiteSecondary,
                  fontSize: widget.isMobile ? 10 : 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0x0AFFFFFF),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0x14FFFFFF),
              width: 1,
            ),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 6,
            runSpacing: 6,
            children: [
              SocialProfile(
                profilName: "Resume",
                iconPath: "assets/icons/code.png",
                bgColor: CustomColors.yellowPrimary,
                txtColor: Colors.white,
                isMobile: widget.isMobile,
                url: "https://drive.google.com/file/d/1Cqrs-sYmVCJ_if73wZMkS4IUppMjzqbX/view?usp=sharing",
              ),
              SocialProfile(
                profilName: "LinkedIn",
                iconPath: "assets/icons/linkedin.png",
                bgColor: const Color(0xFF0A66C2),
                txtColor: Colors.white,
                isMobile: widget.isMobile,
                url: "https://www.linkedin.com/in/kartikskr/",
              ),
              SocialProfile(
                profilName: "GitHub",
                iconPath: "assets/icons/github.jpg",
                bgColor: const Color(0xFF24292E),
                txtColor: Colors.white,
                isMobile: widget.isMobile,
                url: "https://github.com/itskartike910",
              ),
              SocialProfile(
                profilName: "LeetCode",
                iconPath: "assets/icons/leetcode.png",
                bgColor: const Color(0xFFFFA116),
                txtColor: Colors.white,
                isMobile: widget.isMobile,
                url: "https://leetcode.com/u/its_kartike/",
              ),
              SocialProfile(
                profilName: "GFG",
                iconPath: "assets/icons/gfg.jpg",
                bgColor: const Color(0xFF2F8D46),
                txtColor: Colors.white,
                isMobile: widget.isMobile,
                url: "https://www.geeksforgeeks.org/user/kumarkartik147359/",
              ),
              SocialProfile(
                profilName: "CodeChef",
                iconPath: "assets/icons/codechef.jpg",
                bgColor: const Color(0xFF5B4638),
                txtColor: Colors.white,
                isMobile: widget.isMobile,
                url: "https://www.codechef.com/users/its_kartike",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCapabilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomColors.primaryAccent.withOpacity(0.14),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: CustomColors.primaryAccent.withOpacity(0.35)),
              ),
              child: const Icon(
                Icons.laptop_chromebook_rounded,
                color: CustomColors.primaryAccent,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              "What I Bring to the Table",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        _CapabilitiesGrid(isMobile: widget.isMobile),
      ],
    );
  }
}

// ── What I Bring to the Table (8-card Capability Grid) ────────────────────────

class _CapabilitiesGrid extends StatelessWidget {
  final bool isMobile;
  const _CapabilitiesGrid({required this.isMobile});

  static const List<Map<String, dynamic>> items = [
    {
      "icon": Icons.settings_suggest_rounded,
      "color": Color(0xFF00D9FF),
      "title": "Systems Architecture",
      "desc": "Rust, Tauri wrappers &\nlow-level OS APIs",
    },
    {
      "icon": Icons.psychology_rounded,
      "color": Color(0xFF9D4EDD),
      "title": "Agentic AI / LLMs",
      "desc": "LangGraph, PydanticAI &\nstructured agent planning",
    },
    {
      "icon": Icons.layers_rounded,
      "color": Color(0xFF06FFA5),
      "title": "Full-Stack Dev",
      "desc": "React, TypeScript, Flask &\nhigh-performance APIs",
    },
    {
      "icon": Icons.smart_toy_rounded,
      "color": Color(0xFF00D9FF),
      "title": "Browser Internals",
      "desc": "Chromium custom builds &\nV8 execution control",
    },
    {
      "icon": Icons.storage_rounded,
      "color": Color(0xFF5B7FFF),
      "title": "Database Design",
      "desc": "PostgreSQL, MySQL, SQLite\n& ORM data modeling",
    },
    {
      "icon": Icons.speed_rounded,
      "color": Color(0xFFFF006E),
      "title": "Latency Tuning",
      "desc": "Caching layers & optimizing\nrendering pipeline latency",
    },
    {
      "icon": Icons.emoji_events_rounded,
      "color": Color(0xFFFFBE0B),
      "title": "Problem Solving",
      "desc": "LeetCode (Max 1829) &\n2000+ competitive problems",
    },
    {
      "icon": Icons.science_rounded,
      "color": Color(0xFF06FFA5),
      "title": "Agent Tooling",
      "desc": "Docker sandboxes, Git CI/CD\n& terminal runtimes",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int crossAxisCount = constraints.maxWidth < 540
            ? 2
            : (constraints.maxWidth < 900 ? 2 : 4);
        final double spacing = isMobile ? 10 : 12;
        final double cardWidth =
            (constraints.maxWidth - ((crossAxisCount - 1) * spacing)) /
                crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items.map((item) {
            return SizedBox(
              width: cardWidth,
              child: _buildItemCard(item),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) {
    final color = item["color"] as Color;
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(isMobile ? 8 : 10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.14),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.35)),
            ),
            child: Icon(
              item["icon"] as IconData,
              color: color,
              size: isMobile ? 20 : 24,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 10),
          Text(
            item["title"] as String,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: isMobile ? 12.5 : 13.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            item["desc"] as String,
            style: GoogleFonts.inter(
              color: CustomColors.whiteSecondary,
              fontWeight: FontWeight.w400,
              fontSize: isMobile ? 10 : 11,
              height: 1.35,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
