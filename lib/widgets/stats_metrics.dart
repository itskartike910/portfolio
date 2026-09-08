// ignore_for_file: deprecated_member_use

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/glass_card.dart';
import 'package:url_launcher/url_launcher.dart';

class StatsMetrics extends StatelessWidget {
  final bool isMobile;
  const StatsMetrics({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return NeonGlassCard(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: 32,
        horizontal: isMobile ? 14 : 26,
      ),
      primaryGlow: CustomColors.primaryAccent,
      secondaryGlow: CustomColors.purpleAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ═══════════════════════════════════════════════════════════════════
          // SECTION 1: 🏆 Competitive Programming & Achievements
          // ═══════════════════════════════════════════════════════════════════
          _buildSectionHeaderTitle(
            icon: Icons.emoji_events_rounded,
            iconColor: const Color(0xFFFFBE0B),
            title: "Competitive Programming & Achievements",
          ),
          const SizedBox(height: 18),

          if (isMobile)
            const Column(
              children: [
                _PlatformRankingsCard(),
                SizedBox(height: 16),
                _LeetCodePerformanceCard(),
              ],
            )
          else
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _PlatformRankingsCard()),
                SizedBox(width: 18),
                Expanded(flex: 6, child: _LeetCodePerformanceCard()),
              ],
            ),

          const SizedBox(height: 36),
          _buildDivider(),
          const SizedBox(height: 32),

          // ═══════════════════════════════════════════════════════════════════
          // SECTION 2: ⚡ Quick Stats / GitHub Analytics
          // ═══════════════════════════════════════════════════════════════════
          _buildSectionHeaderTitle(
            icon: Icons.bolt_rounded,
            iconColor: const Color(0xFFFFBE0B),
            title: "Quick Stats & GitHub Analytics",
          ),
          const SizedBox(height: 18),

          // Row 1: Streak & Productivity + Profile Summary
          if (isMobile)
            const Column(
              children: [
                _StreakProductivityCard(),
                SizedBox(height: 16),
                _GitHubProfileSummaryCard(),
              ],
            )
          else
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _StreakProductivityCard()),
                SizedBox(width: 18),
                Expanded(flex: 6, child: _GitHubProfileSummaryCard()),
              ],
            ),

          const SizedBox(height: 18),

          // Row 2: Top Languages (Repo & Commit) + Hourly Commits
          if (isMobile)
            const Column(
              children: [
                _TopLanguagesDonutCard(
                  title: "Top Languages by Repo",
                  subtitle: "Distribution across public & private repos",
                  data: [
                    {"name": "Dart", "pct": "35%", "color": Color(0xFF00D9FF), "val": 0.35},
                    {"name": "JavaScript", "pct": "25%", "color": Color(0xFFFFD43B), "val": 0.25},
                    {"name": "C++", "pct": "20%", "color": Color(0xFFFF375F), "val": 0.20},
                    {"name": "Java", "pct": "12%", "color": Color(0xFF5B7FFF), "val": 0.12},
                    {"name": "Python", "pct": "8%", "color": Color(0xFF3572A5), "val": 0.08},
                  ],
                ),
                SizedBox(height: 16),
                _TopLanguagesDonutCard(
                  title: "Top Languages by Commit",
                  subtitle: "Weighted by commit lines and git changes",
                  data: [
                    {"name": "Python", "pct": "32%", "color": Color(0xFF3572A5), "val": 0.32},
                    {"name": "JavaScript", "pct": "28%", "color": Color(0xFFFFD43B), "val": 0.28},
                    {"name": "C++", "pct": "20%", "color": Color(0xFFFF375F), "val": 0.20},
                    {"name": "Dart", "pct": "12%", "color": Color(0xFF00D9FF), "val": 0.12},
                    {"name": "Jupyter", "pct": "8%", "color": Color(0xFFDA5B0B), "val": 0.08},
                  ],
                ),
                SizedBox(height: 16),
                _CommitsHourlyCard(),
              ],
            )
          else
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _TopLanguagesDonutCard(
                    title: "Top Languages by Repo",
                    subtitle: "Distribution across repositories",
                    data: [
                      {"name": "Dart", "pct": "35%", "color": Color(0xFF00D9FF), "val": 0.35},
                      {"name": "JavaScript", "pct": "25%", "color": Color(0xFFFFD43B), "val": 0.25},
                      {"name": "C++", "pct": "20%", "color": Color(0xFFFF375F), "val": 0.20},
                      {"name": "Java", "pct": "12%", "color": Color(0xFF5B7FFF), "val": 0.12},
                      {"name": "Python", "pct": "8%", "color": Color(0xFF3572A5), "val": 0.08},
                    ],
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: _TopLanguagesDonutCard(
                    title: "Top Languages by Commit",
                    subtitle: "Weighted by git commit lines",
                    data: [
                      {"name": "Python", "pct": "32%", "color": Color(0xFF3572A5), "val": 0.32},
                      {"name": "JavaScript", "pct": "28%", "color": Color(0xFFFFD43B), "val": 0.28},
                      {"name": "C++", "pct": "20%", "color": Color(0xFFFF375F), "val": 0.20},
                      {"name": "Dart", "pct": "12%", "color": Color(0xFF00D9FF), "val": 0.12},
                      {"name": "Jupyter", "pct": "8%", "color": Color(0xFFDA5B0B), "val": 0.08},
                    ],
                  ),
                ),
                SizedBox(width: 14),
                Expanded(child: _CommitsHourlyCard()),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSectionHeaderTitle({
    required IconData icon,
    required Color iconColor,
    required String title,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.14),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: iconColor.withOpacity(0.35)),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: isMobile ? 15 : 18,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.white.withOpacity(0.08),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// 1. PLATFORM RANKINGS TABLE CARD (Image 2)
// ═══════════════════════════════════════════════════════════════════════════════

class _PlatformRankingsCard extends StatelessWidget {
  const _PlatformRankingsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.military_tech_rounded, color: Color(0xFFFFBE0B), size: 18),
              const SizedBox(width: 8),
              Text(
                "Platform Rankings",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0x12FFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Platform",
                    style: GoogleFonts.inter(
                      color: CustomColors.whiteSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Achievement",
                    style: GoogleFonts.inter(
                      color: CustomColors.whiteSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Rows
          _buildTableRow(
            dotColor: const Color(0xFFFFA116),
            platform: "LeetCode",
            achievement: "Max Rating 1829 · 844+ Solved (Top 7.16%)",
            url: "https://leetcode.com/u/its_kartike/",
          ),
          _buildTableRow(
            dotColor: const Color(0xFFFFBE0B),
            platform: "CodeChef",
            achievement: "3-Star · Peak Rating 1636",
            url: "https://www.codechef.com/users/its_kartike",
          ),
          _buildTableRow(
            dotColor: const Color(0xFF2F8D46),
            platform: "GFG",
            achievement: "1000+ Problems Solved",
            url: "https://www.geeksforgeeks.org/user/kumarkartik147359/",
          ),
          _buildTableRow(
            dotColor: const Color(0xFF9D4EDD),
            platform: "Robotics",
            achievement: "🏆 Winner — \"Machine Mayhem\"",
            url: null,
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow({
    required Color dotColor,
    required String platform,
    required String achievement,
    String? url,
  }) {
    return MouseRegion(
      cursor: url != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: url != null ? () => launchUrl(Uri.parse(url)) : null,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0x08FFFFFF),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withOpacity(0.06)),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: dotColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: dotColor.withOpacity(0.6), blurRadius: 6),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      platform,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  achievement,
                  style: GoogleFonts.inter(
                    color: CustomColors.textGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.5,
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

// ═══════════════════════════════════════════════════════════════════════════════
// 2. LEETCODE PERFORMANCE CARD WITH DONUT & HEATMAP (Image 2 & 5)
// ═══════════════════════════════════════════════════════════════════════════════

class _LeetCodePerformanceCard extends StatelessWidget {
  const _LeetCodePerformanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFFFA116).withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFA116).withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFA116).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.code_rounded, color: Color(0xFFFFA116), size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "its_kartike",
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Rank #57,379 · Top 7.16% (Knight)",
                      style: GoogleFonts.inter(
                        color: CustomColors.whiteSecondary,
                        fontSize: 11,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFA116).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFFFA116).withOpacity(0.4)),
                ),
                child: Text(
                  "1,829 RATING",
                  style: GoogleFonts.inter(
                    color: const Color(0xFFFFA116),
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Donut Circle + Difficulty Progress
          Row(
            children: [
              // Circular Progress Ring
              SizedBox(
                width: 90,
                height: 90,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(90, 90),
                      painter: _LeetCodeDonutPainter(
                        easy: 276 / 4047,
                        medium: 469 / 4047,
                        hard: 99 / 4047,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "844",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            height: 1.0,
                          ),
                        ),
                        Text(
                          "Solved",
                          style: GoogleFonts.inter(
                            color: CustomColors.whiteSecondary,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              // Breakdown Bars
              Expanded(
                child: Column(
                  children: [
                    _buildDiffBar("Easy", "276", "963", 276 / 963, const Color(0xFF00B8A3)),
                    const SizedBox(height: 8),
                    _buildDiffBar("Medium", "469", "2111", 469 / 2111, const Color(0xFFFFC01E)),
                    const SizedBox(height: 8),
                    _buildDiffBar("Hard", "99", "973", 99 / 973, const Color(0xFFFF375F)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Bottom Stats (52-week heatmap preview & summary)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0x0CFFFFFF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.06)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Heatmap (Last 52 Weeks) · 197 Submissions",
                      style: GoogleFonts.inter(
                        color: CustomColors.whiteSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "21 Badges (500 Days)",
                      style: GoogleFonts.inter(
                        color: const Color(0xFF00D9FF),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const _HeatmapDotsRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiffBar(String name, String solved, String total, double fraction, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 52,
          child: Text(
            name,
            style: GoogleFonts.inter(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: 6,
              color: const Color(0x18FFFFFF),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: fraction.clamp(0.0, 1.0),
                child: Container(color: color),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "$solved / $total",
          style: GoogleFonts.jetBrainsMono(
            color: CustomColors.whitePrimary,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _LeetCodeDonutPainter extends CustomPainter {
  final double easy;
  final double medium;
  final double hard;

  _LeetCodeDonutPainter({required this.easy, required this.medium, required this.hard});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;
    const strokeWidth = 6.0;

    final bgPaint = Paint()
      ..color = const Color(0x20FFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, bgPaint);

    double startAngle = -math.pi / 2;

    void drawSegment(double frac, Color color) {
      final sweep = frac * 2 * math.pi * 3.5; // Visual scale for donut
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweep,
        false,
        paint,
      );
      startAngle += sweep + 0.1;
    }

    drawSegment(easy, const Color(0xFF00B8A3));
    drawSegment(medium, const Color(0xFFFFC01E));
    drawSegment(hard, const Color(0xFFFF375F));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HeatmapDotsRow extends StatelessWidget {
  const _HeatmapDotsRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(32, (col) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (row) {
              final active = ((col * 3 + row * 7) % 5 == 0) || (col >= 14 && col <= 20);
              final intensity = active
                  ? (((col + row) % 3 == 0) ? const Color(0xFF27C93F) : const Color(0xFF0E7A23))
                  : const Color(0x18FFFFFF);
              return Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: intensity,
                  borderRadius: BorderRadius.circular(1.5),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}



// ═══════════════════════════════════════════════════════════════════════════════
// 4. STREAK & PRODUCTIVITY CARD (Image 4)
// ═══════════════════════════════════════════════════════════════════════════════

class _StreakProductivityCard extends StatelessWidget {
  const _StreakProductivityCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.local_fire_department_rounded, color: Color(0xFFFF6B6B), size: 18),
              const SizedBox(width: 8),
              Text(
                "Streak & Productivity",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              // Total Contributions
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "849",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Total Contributions",
                      style: GoogleFonts.inter(
                        color: CustomColors.whiteSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Dec 14, 2021 – Present",
                      style: GoogleFonts.inter(
                        color: Colors.white24,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),

              // Middle Divider with Ring
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF7B2FFE), width: 4),
                      ),
                      child: Center(
                        child: Text(
                          "0",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Current Streak",
                      style: GoogleFonts.inter(
                        color: const Color(0xFF00D9FF),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // Longest Streak
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "8",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Longest Streak",
                      style: GoogleFonts.inter(
                        color: CustomColors.whiteSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "May 24 – May 31",
                      style: GoogleFonts.inter(
                        color: Colors.white24,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// 5. GITHUB PROFILE SUMMARY CARD WITH AREA GRAPH (Image 4)
// ═══════════════════════════════════════════════════════════════════════════════

class _GitHubProfileSummaryCard extends StatelessWidget {
  const _GitHubProfileSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.show_chart_rounded, color: Color(0xFF06FFA5), size: 18),
              const SizedBox(width: 8),
              Text(
                "Profile Summary",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Details
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "itskartike910",
                      style: GoogleFonts.jetBrainsMono(
                        color: const Color(0xFF5B7FFF),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildSummaryLine(Icons.commit_rounded, "849 Contributions"),
                    _buildSummaryLine(Icons.folder_outlined, "13 Public Repos"),
                    _buildSummaryLine(Icons.schedule_rounded, "Joined GitHub 4y ago"),
                    _buildSummaryLine(Icons.email_outlined, "kumarkartik147359@gmail.com"),
                  ],
                ),
              ),

              // Right Wave Area Chart
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: 90,
                  child: CustomPaint(
                    painter: _GitHubAreaGraphPainter(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryLine(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 12, color: CustomColors.whiteSecondary),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: CustomColors.textGrey,
                fontSize: 11,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _GitHubAreaGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final points = [
      Offset(0, size.height * 0.85),
      Offset(size.width * 0.2, size.height * 0.8),
      Offset(size.width * 0.35, size.height * 0.9),
      Offset(size.width * 0.5, size.height * 0.7),
      Offset(size.width * 0.65, size.height * 0.4),
      Offset(size.width * 0.8, size.height * 0.15),
      Offset(size.width * 0.9, size.height * 0.3),
      Offset(size.width, size.height * 0.8),
    ];

    path.moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < points.length; i++) {
      final p0 = points[i - 1];
      final p1 = points[i];
      path.quadraticBezierTo(
        (p0.dx + p1.dx) / 2,
        (p0.dy + p1.dy) / 2,
        p1.dx,
        p1.dy,
      );
    }

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF06FFA5).withOpacity(0.5),
          const Color(0xFF06FFA5).withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);

    final linePaint = Paint()
      ..color = const Color(0xFF06FFA5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ═══════════════════════════════════════════════════════════════════════════════
// 6. TOP LANGUAGES DONUT CARD (Image 4)
// ═══════════════════════════════════════════════════════════════════════════════

class _TopLanguagesDonutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Map<String, dynamic>> data;

  const _TopLanguagesDonutCard({
    required this.title,
    required this.subtitle,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13.5,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              color: CustomColors.whiteSecondary,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              // Donut
              SizedBox(
                width: 70,
                height: 70,
                child: CustomPaint(
                  painter: _MultiSliceDonutPainter(data: data),
                ),
              ),
              const SizedBox(width: 14),

              // Legend
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.map((item) {
                    final color = item["color"] as Color;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              item["name"] as String,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            item["pct"] as String,
                            style: GoogleFonts.jetBrainsMono(
                              color: CustomColors.whiteSecondary,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MultiSliceDonutPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;
  _MultiSliceDonutPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;
    double startAngle = -math.pi / 2;

    for (var item in data) {
      final sweep = (item["val"] as double) * 2 * math.pi;
      final paint = Paint()
        ..color = item["color"] as Color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10.0;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweep - 0.05,
        false,
        paint,
      );
      startAngle += sweep;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ═══════════════════════════════════════════════════════════════════════════════
// 7. COMMITS HOURLY HISTOGRAM CARD (Image 4)
// ═══════════════════════════════════════════════════════════════════════════════

class _CommitsHourlyCard extends StatelessWidget {
  const _CommitsHourlyCard();

  @override
  Widget build(BuildContext context) {
    // 24 hour distribution matching the profile screenshot histogram
    const hourlyBars = [
      18, 12, 4, 1, 0, 0, 2, 4, 3, 2, 1, 6, 14, 25, 12, 16, 14, 9, 8, 10, 15, 14, 8, 6
    ];
    const maxVal = 25;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Commits (UTC +5.50)",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.5,
                ),
              ),
              Text(
                "Per day hour",
                style: GoogleFonts.inter(
                  color: CustomColors.whiteSecondary,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(24, (i) {
                final count = hourlyBars[i];
                final frac = count / maxVal;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.5),
                    child: Container(
                      height: (frac * 60).clamp(4.0, 60.0),
                      decoration: BoxDecoration(
                        color: count > 10 ? const Color(0xFF06FFA5) : const Color(0xFF00D9FF).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 6),

          // Axis Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("0h", style: GoogleFonts.jetBrainsMono(color: Colors.white24, fontSize: 9)),
              Text("6h", style: GoogleFonts.jetBrainsMono(color: Colors.white24, fontSize: 9)),
              Text("12h", style: GoogleFonts.jetBrainsMono(color: Colors.white24, fontSize: 9)),
              Text("18h", style: GoogleFonts.jetBrainsMono(color: Colors.white24, fontSize: 9)),
              Text("23h", style: GoogleFonts.jetBrainsMono(color: Colors.white24, fontSize: 9)),
            ],
          ),
        ],
      ),
    );
  }
}
