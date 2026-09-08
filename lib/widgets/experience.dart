// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/glass_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Experience extends StatefulWidget {
  final bool isMobile;
  const Experience({super.key, required this.isMobile});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      3,
      (index) => AnimationController(
        duration: Duration(milliseconds: 600 + (index * 120)),
        vsync: this,
      ),
    );
    _animations = _controllers
        .map((c) => CurvedAnimation(parent: c, curve: Curves.easeOutCubic))
        .toList();

    for (var i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 160), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NeonGlassCard(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: 28,
        horizontal: widget.isMobile ? 18 : 28,
      ),
      primaryGlow: CustomColors.purpleAccent,
      secondaryGlow: CustomColors.primaryAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BLG Technologies
          _buildExperienceItem(
            index: 0,
            company: "BLG Technologies",
            role: "Software Development Engineer I",
            location: "Ranchi, India · IIM Ranchi – DRDO Project",
            duration: "Mar 2026 – May 2026",
            accentColor: CustomColors.primaryAccent,
            responsibilities: [
              "Developed major components of a DRDO-sponsored full-stack TRL assessment platform using React, TypeScript, Flask, SQLAlchemy, and PostgreSQL.",
              "Designed and implemented 30+ RESTful APIs with JWT authentication and RBAC, enabling workflow automation across 3 organizational roles.",
              "Built role-aware dashboards, assessment scheduling, report generation and data export, reducing manual tracking effort by ~60%.",
              "Engineered backend services and PostgreSQL data models spanning 13+ relational entities.",
            ],
            certificateUrl: null,
          ),

          _buildDivider(),

          // Wootzapp
          _buildExperienceItem(
            index: 1,
            company: "Wootzapp Inc.",
            role: "Software Developer Intern",
            location: "Remote · HQ: Delaware, USA",
            duration: "Dec 2024 – Jan 2026",
            accentColor: CustomColors.greenAccent,
            responsibilities: [
              "Developed an AI-driven browser automation agent within a Chromium-based Android browser, enabling autonomous multi-step web workflows.",
              "Implemented offline caching & URL remapping for RL environments — reduced page load latency from 500-1000 ms to ~10 ms (80–98% improvement).",
              "Built network interception for Twitter/X data extraction and integrated REST APIs for automated backend ingestion.",
              "Debugged Chromium internals and resolved platform-specific issues, improving cross-device reliability and reducing cold-start crashes.",
            ],
            certificateUrl: "https://drive.google.com/file/d/144E90vDk6_8r92G7j4xXy9Z1X2_34567/view?usp=sharing",
          ),

          _buildDivider(),

          // EISystems
          _buildExperienceItem(
            index: 2,
            company: "EISystems Technologies",
            role: "AI Research Intern",
            location: "Internship · 2 Months",
            duration: "May 2024 – Jul 2024",
            accentColor: CustomColors.yellowPrimary,
            responsibilities: [
              "Assisted with research projects and developed an NLP model to enhance sentiment analysis.",
              "Gained hands-on experience with deep learning architectures and NLP techniques.",
            ],
            certificateUrl:
                "https://drive.google.com/file/d/1b22DfCz2wz-5YyWGl9ss0TPMhtYGF-vw/view?usp=sharing",
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(width: 40, height: 1, color: Colors.white.withOpacity(0.08)),
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.08), Colors.transparent],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required int index,
    required String company,
    required String role,
    required String location,
    required String duration,
    required Color accentColor,
    required List<String> responsibilities,
    String? certificateUrl,
  }) {
    return FadeTransition(
      opacity: _animations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(_animations[index]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline column
            Column(
              children: [
                // Glowing dot
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accentColor,
                    boxShadow: [
                      BoxShadow(
                        color: accentColor.withOpacity(0.6),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                // Line
                Container(
                  width: 2,
                  height: 120 + (responsibilities.length * 28.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        accentColor.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 18),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company name
                  Text(
                    company,
                    style: GoogleFonts.inter(
                      color: accentColor,
                      fontSize: widget.isMobile ? 15 : 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Role
                  Text(
                    role,
                    style: GoogleFonts.inter(
                      color: CustomColors.whitePrimary,
                      fontSize: widget.isMobile ? 13 : 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Location + Duration chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      _buildMiniChip(Icons.location_on_outlined, location, accentColor),
                      _buildMiniChip(Icons.calendar_today_outlined, duration, accentColor),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Responsibilities
                  ...responsibilities.map((r) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: accentColor.withOpacity(0.8),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                r,
                                style: GoogleFonts.inter(
                                  color: CustomColors.textGrey,
                                  fontSize: widget.isMobile ? 12 : 13,
                                  fontWeight: FontWeight.w400,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  if (certificateUrl != null) ...[
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse(certificateUrl)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                            decoration: BoxDecoration(
                              color: accentColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: accentColor.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.open_in_new_rounded, size: 13, color: accentColor),
                                const SizedBox(width: 6),
                                Text(
                                  "View Certificate",
                                  style: GoogleFonts.inter(
                                    color: accentColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniChip(IconData icon, String label, Color accent) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: accent.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: accent.withOpacity(0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: accent.withOpacity(0.8)),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.inter(
              color: accent.withOpacity(0.9),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
