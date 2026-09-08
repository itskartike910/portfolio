// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';

class AboutMe extends StatelessWidget {
  final bool isMobile;
  const AboutMe({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 24 : 32,
            horizontal: isMobile ? 16 : 28,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: const Color(0x0EFFFFFF),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0x18FFFFFF), width: 1),
            boxShadow: [
              BoxShadow(
                color: CustomColors.primaryAccent.withOpacity(0.04),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
              const BoxShadow(
                color: Color(0x40000000),
                blurRadius: 24,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── macOS Window Header Bar ────────────────────────────────────
              Row(
                children: [
                  // macOS traffic light buttons
                  Container(
                    width: 11,
                    height: 11,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF5F56),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(
                    width: 11,
                    height: 11,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFBD2E),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(
                    width: 11,
                    height: 11,
                    decoration: const BoxDecoration(
                      color: Color(0xFF27C93F),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0x0EFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0x15FFFFFF)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.terminal_rounded,
                          size: 13,
                          color: CustomColors.primaryAccent,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "kartik.config.ts",
                          style: GoogleFonts.jetBrainsMono(
                            color: CustomColors.whiteSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: CustomColors.greenAccent.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: CustomColors.greenAccent.withOpacity(0.3),
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
                        const SizedBox(width: 5),
                        Text(
                          isMobile ? "OPEN" : "OPEN TO OPPORTUNITIES",
                          style: GoogleFonts.inter(
                            color: CustomColors.greenAccent,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ── Grid of Glass Info Cards ───────────────────────────────────
              isMobile
                  ? const Column(
                      children: [
                        _AboutCard(
                          icon: Icons.school_outlined,
                          title: "Education",
                          accent: CustomColors.primaryAccent,
                          content:
                              "B.Tech in Computer Science and Engineering @ National Institute of Technology, Patna (2021–2025) · CGPA: 7.52/10",
                          tag: "NIT Patna",
                        ),
                        SizedBox(height: 12),
                        _AboutCard(
                          icon: Icons.psychology_outlined,
                          title: "Agentic AI & Orchestration",
                          accent: CustomColors.purpleAccent,
                          content:
                              "Designing autonomous workflows with LangGraph, PydanticAI, and multi-model LLM orchestration (Gemini, Claude, OpenAI). Architected OpenSarthi desktop voice & automation agent.",
                          tag: "AI Systems",
                        ),
                        SizedBox(height: 12),
                        _AboutCard(
                          icon: Icons.memory_outlined,
                          title: "Systems & Internals",
                          accent: CustomColors.yellowPrimary,
                          content:
                              "Rust, Chromium custom builds, DevTools protocol, Android network interception, low-latency caching (reduced latency 98%), and high-concurrency Tauri desktop runtimes.",
                          tag: "Low Latency",
                        ),
                        SizedBox(height: 12),
                        _AboutCard(
                          icon: Icons.hub_outlined,
                          title: "Full-Stack & APIs",
                          accent: CustomColors.greenAccent,
                          content:
                              "React, TypeScript, Flask, FastAPI, PostgreSQL. Built DRDO technology readiness platform with 30+ secured REST APIs, RBAC, and automated reporting.",
                          tag: "Enterprise",
                        ),
                      ],
                    )
                  : const Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _AboutCard(
                                icon: Icons.school_outlined,
                                title: "Education",
                                accent: CustomColors.primaryAccent,
                                content:
                                    "B.Tech in Computer Science and Engineering @ National Institute of Technology, Patna (2021–2025) · CGPA: 7.52/10",
                                tag: "NIT Patna",
                              ),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: _AboutCard(
                                icon: Icons.psychology_outlined,
                                title: "Agentic AI & Orchestration",
                                accent: CustomColors.purpleAccent,
                                content:
                                    "Designing autonomous workflows with LangGraph, PydanticAI, and multi-model LLM orchestration (Gemini, Claude, OpenAI). Architected OpenSarthi desktop voice & automation agent.",
                                tag: "AI Systems",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _AboutCard(
                                icon: Icons.memory_outlined,
                                title: "Systems & Internals",
                                accent: CustomColors.yellowPrimary,
                                content:
                                    "Rust, Chromium custom builds, DevTools protocol, Android network interception, low-latency caching (reduced latency 98%), and high-concurrency Tauri desktop runtimes.",
                                tag: "Low Latency",
                              ),
                            ),
                            SizedBox(width: 14),
                            Expanded(
                              child: _AboutCard(
                                icon: Icons.hub_outlined,
                                title: "Full-Stack & APIs",
                                accent: CustomColors.greenAccent,
                                content:
                                    "React, TypeScript, Flask, FastAPI, PostgreSQL. Built DRDO technology readiness platform with 30+ secured REST APIs, RBAC, and automated reporting.",
                                tag: "Enterprise",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

              const SizedBox(height: 20),

              // ── Quote / Motto Banner ────────────────────────────────────────
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: CustomColors.primaryAccent.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: CustomColors.primaryAccent.withOpacity(0.25),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: CustomColors.primaryAccent.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.auto_awesome_rounded,
                            color: CustomColors.primaryAccent,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Software engineer building high-performance systems and autonomous AI agents — bridging LLM intelligence with real-world OS and browser automation.",
                            style: GoogleFonts.inter(
                              color: CustomColors.textGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: isMobile ? 12 : 13.5,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;
  final Color accent;
  final String tag;

  const _AboutCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.accent,
    required this.tag,
  });

  @override
  State<_AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<_AboutCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _hovered
              ? widget.accent.withOpacity(0.09)
              : const Color(0x08FFFFFF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? widget.accent.withOpacity(0.45)
                : widget.accent.withOpacity(0.16),
            width: 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.accent.withOpacity(0.12),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: widget.accent.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Icon(widget.icon, color: widget.accent, size: 16),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.inter(
                      color: CustomColors.whitePrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: widget.accent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    widget.tag,
                    style: GoogleFonts.inter(
                      color: widget.accent,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.content,
              style: GoogleFonts.inter(
                color: CustomColors.textGrey,
                fontWeight: FontWeight.w400,
                fontSize: 12.5,
                height: 1.55,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
