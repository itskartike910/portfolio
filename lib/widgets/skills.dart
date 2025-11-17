// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with TickerProviderStateMixin {
  // Categorized Skills
  final Map<String, List<Map<String, dynamic>>> skillCategories = {
    "Languages": [
      {"name": "C++", "level": 0.9, "icon": "assets/icons/c++.png", "iconData": null},
      {"name": "C", "level": 0.85, "icon": "assets/icons/c-.png", "iconData": null},
      {"name": "Java", "level": 0.8, "icon": null, "iconData": Icons.coffee_outlined},
      {"name": "Python", "level": 0.8, "icon": "assets/icons/python.png", "iconData": null},
      {"name": "JavaScript", "level": 0.8, "icon": null, "iconData": Icons.javascript_outlined},
      {"name": "Dart", "level": 0.8, "icon": "assets/icons/dart.png", "iconData": null},
      {"name": "SQL", "level": 0.75, "icon": null, "iconData": Icons.storage_outlined},
      {"name": "HTML/CSS", "level": 0.8, "icon": null, "iconData": Icons.html_outlined},
    ],
    "Frameworks & Tools": [
      {"name": "Chromium", "level": 0.7, "icon": "assets/icons/chromium.jpg", "iconData": null},
      {"name": "Flutter", "level": 0.85, "icon": "assets/icons/flutter.jpg", "iconData": null},
      {"name": "React.js", "level": 0.75, "icon": null, "iconData": Icons.web_outlined},
      {"name": "Android Dev", "level": 0.85, "icon": "assets/icons/androidDev.png", "iconData": null},
      {"name": "Android Studio", "level": 0.9, "icon": "assets/icons/astudio.png", "iconData": null},
      {"name": "Firebase", "level": 0.75, "icon": "assets/icons/firebase.png", "iconData": null},
      {"name": "Git", "level": 0.90, "icon": "assets/icons/git.png", "iconData": null},
      {"name": "GitHub", "level": 0.9, "icon": "assets/icons/github.jpg", "iconData": null},
      {"name": "Linux/Ubuntu", "level": 0.8, "icon": null, "iconData": Icons.terminal_outlined},
      {"name": "VS Code", "level": 0.9, "icon": "assets/icons/visual-basic.png", "iconData": Icons.code_outlined},
      {"name": "API Integration", "level": 0.85, "icon": null, "iconData": Icons.api_outlined},
    ],
    "Specializations": [
      {"name": "DSA", "level": 0.9, "icon": "assets/icons/programming.png", "iconData": null},
      {"name": "Competitive Programming", "level": 0.85, "icon": null, "iconData": Icons.emoji_events_outlined},
      {"name": "Machine Learning", "level": 0.75, "icon": "assets/icons/machinelearning.png", "iconData": null},
      // {"name": "Deep Learning", "level": 0.7, "icon": null, "iconData": Icons.psychology_outlined},
      {"name": "Database Management", "level": 0.75, "icon": "assets/icons/mysql.png", "iconData": null},
      {"name": "Web Development", "level": 0.75, "icon": null, "iconData": Icons.public_outlined},
      {"name": "Problem Solving", "level": 0.95, "icon": null, "iconData": Icons.lightbulb_outline},
      {"name": "UI/UX Design", "level": 0.8, "icon": null, "iconData": Icons.design_services_outlined},
    ],
  };

  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      skillCategories.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      ),
    );
    
    for (var i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
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
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width < 900
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width * 0.4,
      decoration: CustomColors.cardDecoration2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: skillCategories.entries.map((categoryEntry) {
          final index = skillCategories.keys.toList().indexOf(categoryEntry.key);
          return _buildSkillCategory(
            category: categoryEntry.key,
            skills: categoryEntry.value,
            index: index,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSkillCategory({
    required String category,
    required List<Map<String, dynamic>> skills,
    required int index,
  }) {
    final animation = CurvedAnimation(
      parent: _controllers[index],
      curve: Curves.easeOutCubic,
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.3, 0),
          end: Offset.zero,
        ).animate(animation),
        child: Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Header
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CustomColors.primaryAccent,
                          CustomColors.purpleAccent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    category,
                    style: GoogleFonts.ubuntu(
                      color: CustomColors.whitePrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Skills Grid
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: skills.asMap().entries.map((skillEntry) {
                  return _buildSkillChip(
                    name: skillEntry.value['name'],
                    level: skillEntry.value['level'],
                    iconPath: skillEntry.value['icon'],
                    iconData: skillEntry.value['iconData'],
                    delay: skillEntry.key * 100,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillChip({
    required String name,
    required double level,
    String? iconPath,
    IconData? iconData,
    required int delay,
  }) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 800 + delay),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: _SkillChipWidget(
            name: name,
            level: level,
            iconPath: iconPath,
            iconData: iconData,
          ),
        );
      },
    );
  }
}

class _SkillChipWidget extends StatefulWidget {
  final String name;
  final double level;
  final String? iconPath;
  final IconData? iconData;

  const _SkillChipWidget({
    required this.name,
    required this.level,
    this.iconPath,
    this.iconData,
  });

  @override
  State<_SkillChipWidget> createState() => _SkillChipWidgetState();
}

class _SkillChipWidgetState extends State<_SkillChipWidget> {
  bool isHovering = false;

  Color _getLevelColor() {
    if (widget.level >= 0.9) return CustomColors.greenAccent;
    if (widget.level >= 0.8) return CustomColors.primaryAccent;
    if (widget.level >= 0.7) return CustomColors.yellowPrimary;
    return CustomColors.whiteSecondary;
  }

  String _getLevelText() {
    if (widget.level >= 0.9) return "Expert";
    if (widget.level >= 0.8) return "Advanced";
    if (widget.level >= 0.7) return "Intermediate";
    return "Beginner";
  }

  @override
  Widget build(BuildContext context) {
    final levelColor = _getLevelColor();
    
    return MouseRegion(
      onEnter: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      child: Tooltip(
        message: "${widget.name} - ${_getLevelText()}",
        decoration: BoxDecoration(
          color: CustomColors.cardBG,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: levelColor.withOpacity(0.5)),
        ),
        textStyle: GoogleFonts.ubuntu(
          color: CustomColors.whitePrimary,
          fontSize: 12,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isHovering
                  ? [
                      levelColor.withOpacity(0.3),
                      levelColor.withOpacity(0.1),
                    ]
                  : [
                      CustomColors.cardBGLight.withOpacity(0.5),
                      CustomColors.cardBG.withOpacity(0.3),
                    ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovering
                  ? levelColor.withOpacity(0.6)
                  : CustomColors.borderColorLight.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: isHovering
                ? [
                    BoxShadow(
                      color: levelColor.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.iconPath != null)
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: levelColor.withOpacity(0.3),
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      widget.iconPath!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.code,
                          size: 16,
                          color: levelColor,
                        );
                      },
                    ),
                  ),
                )
              else if (widget.iconData != null)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Icon(
                    widget.iconData,
                    size: 18,
                    color: levelColor,
                  ),
                ),
              Text(
                widget.name,
                style: GoogleFonts.ubuntu(
                  color: isHovering ? levelColor : CustomColors.textGrey,
                  fontWeight: isHovering ? FontWeight.w700 : FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              if (isHovering) ...[
                const SizedBox(width: 6),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: levelColor,
                    boxShadow: [
                      BoxShadow(
                        color: levelColor.withOpacity(0.5),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

