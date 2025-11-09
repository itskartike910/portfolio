import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:url_launcher/url_launcher.dart';

class Achievements extends StatefulWidget {
  final bool isMobile;
  const Achievements({super.key, required this.isMobile});

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      4,
      (index) => AnimationController(
        duration: Duration(milliseconds: 600 + (index * 100)),
        vsync: this,
      ),
    );
    _animations = _controllers
        .map((controller) => CurvedAnimation(
              parent: controller,
              curve: Curves.easeOutCubic,
            ))
        .toList();

    for (var i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 150), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25,
        horizontal: widget.isMobile ? 15 : 25,
      ),
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Competitive Programming Stats
          _buildSectionHeader(
            title: "Competitive Programming",
            icon: Icons.code_outlined,
            color: CustomColors.primaryAccent,
          ),
          
          const SizedBox(height: 20),
          
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 15,
            children: [
              _buildStatCard(
                index: 0,
                platform: "LeetCode",
                rating: "1814",
                achievement: "Maximum Rating",
                icon: Icons.emoji_events_outlined,
                color: CustomColors.yellowPrimary,
                url: "https://leetcode.com/u/its_kartike/",
                stars: 4,
              ),
              _buildStatCard(
                index: 1,
                platform: "CodeChef",
                rating: "1636",
                achievement: "Peak Rating (3-Star)",
                icon: Icons.star_outline,
                color: CustomColors.greenAccent,
                url: "https://www.codechef.com/users/its_kartike",
                stars: 3,
              ),
            ],
          ),
          
          const SizedBox(height: 30),
          
          // Achievements & Awards
          _buildSectionHeader(
            title: "Awards & Recognitions",
            icon: Icons.military_tech_outlined,
            color: CustomColors.secondaryAccent,
          ),
          
          const SizedBox(height: 20),
          
          _buildAchievementItem(
            index: 2,
            title: "Machine Mayhem Winner",
            organization: "Robotics Club",
            date: "Nov 2022",
            amount: "₹10,000 Cash Prize",
            description: "Won the Robotics Club's \"Machine Mayhem\" competition",
            icon: Icons.smart_toy_outlined,
            color: CustomColors.purpleAccent,
          ),
          
          const SizedBox(height: 16),
          
          _buildAchievementItem(
            index: 3,
            title: "Problem Solving Excellence",
            organization: "Multiple Platforms",
            date: "Ongoing",
            amount: "1800+ Problems Solved",
            description:
                "Solved 1000+ DSA problems across HackerRank, LeetCode, and CodeChef, demonstrating strong problem-solving skills and algorithmic expertise",
            icon: Icons.track_changes_outlined,
            color: CustomColors.primaryAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.3),
                color.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withOpacity(0.5),
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            color: CustomColors.whitePrimary,
            fontSize: widget.isMobile ? 20 : 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required int index,
    required String platform,
    required String rating,
    required String achievement,
    required IconData icon,
    required Color color,
    required String url,
    required int stars,
  }) {
    return FadeTransition(
      opacity: _animations[index],
      child: ScaleTransition(
        scale: _animations[index],
        child: InkWell(
          onTap: () => _launchURL(url),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: widget.isMobile
                ? double.maxFinite
                : MediaQuery.of(context).size.width * 0.35,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.15),
                  color.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: color.withOpacity(0.4),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                // Platform Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      platform,
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.whitePrimary,
                        fontSize: widget.isMobile ? 20 : 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: color.withOpacity(0.5),
                        ),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Rating Display
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      rating,
                      style: GoogleFonts.ubuntu(
                        color: color,
                        fontSize: widget.isMobile ? 36 : 48,
                        fontWeight: FontWeight.w900,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Rating",
                        style: GoogleFonts.ubuntu(
                          color: CustomColors.whiteSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Achievement Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    achievement,
                    style: GoogleFonts.ubuntu(
                      color: CustomColors.textGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Star Rating
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < stars ? Icons.star : Icons.star_border,
                      color: index < stars ? color : color.withOpacity(0.3),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementItem({
    required int index,
    required String title,
    required String organization,
    required String date,
    required String amount,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return FadeTransition(
      opacity: _animations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.3, 0),
          end: Offset.zero,
        ).animate(_animations[index]),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.cardBGLight.withOpacity(0.5),
                CustomColors.cardBG.withOpacity(0.3),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.3),
                      color.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: color.withOpacity(0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: GoogleFonts.ubuntu(
                              color: CustomColors.whitePrimary,
                              fontSize: widget.isMobile ? 16 : 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: color.withOpacity(0.5),
                            ),
                          ),
                          child: Text(
                            date,
                            style: GoogleFonts.ubuntu(
                              color: color,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 6),
                    
                    Text(
                      organization,
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.primaryAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CustomColors.yellowPrimary.withOpacity(0.2),
                            CustomColors.yellowPrimary.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: CustomColors.yellowPrimary.withOpacity(0.4),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.emoji_events,
                            size: 16,
                            color: CustomColors.yellowPrimary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            amount,
                            style: GoogleFonts.ubuntu(
                              color: CustomColors.yellowPrimary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    
                    Text(
                      description,
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.textGrey,
                        fontSize: widget.isMobile ? 13 : 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    }
  }
}

