import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/constants/project_data.dart';
import 'package:portfolio/helpers/project_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> with TickerProviderStateMixin {
  String selectedCategory = "All";
  List<ProjectData> filteredProjects = allProjects;

  void _filterProjects(String category) {
    setState(() {
      selectedCategory = category;
      if (category == "All") {
        filteredProjects = allProjects;
      } else {
        filteredProjects =
            allProjects.where((project) => project.category == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration1,
      child: Column(
        children: [
          // Category Filter Chips
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: projectCategories.map((category) {
              final isSelected = category == selectedCategory;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: InkWell(
                  onTap: () => _filterProjects(category),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? LinearGradient(
                              colors: [
                                CustomColors.primaryAccent,
                                CustomColors.purpleAccent,
                              ],
                            )
                          : null,
                      color: isSelected
                          ? null
                          : CustomColors.cardBGLight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? CustomColors.primaryAccent
                            : CustomColors.borderColorLight.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: CustomColors.primaryAccent.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getCategoryIcon(category),
                          size: 16,
                          color: isSelected
                              ? Colors.white
                              : CustomColors.whiteSecondary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          category,
                          style: GoogleFonts.ubuntu(
                            color: isSelected
                                ? Colors.white
                                : CustomColors.whiteSecondary,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        if (category == "All")
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white.withOpacity(0.2)
                                  : CustomColors.primaryAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "${allProjects.length}",
                              style: GoogleFonts.ubuntu(
                                color: isSelected ? Colors.white : CustomColors.primaryAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          
          const SizedBox(height: 30),
          
          // Project Count
          Text(
            "${filteredProjects.length} ${filteredProjects.length == 1 ? 'Project' : 'Projects'}",
            style: GoogleFonts.ubuntu(
              color: CustomColors.whiteSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Projects Grid with Staggered Animation
          AnimationLimiter(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 25.0,
              runSpacing: 25.0,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: filteredProjects.asMap().entries.map((entry) {
                  return EnhancedProjectCard(
                    project: entry.value,
                    index: entry.key,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case "All":
        return Icons.apps_outlined;
      case "Machine Learning":
        return Icons.psychology_outlined;
      case "Mobile Development":
        return Icons.smartphone_outlined;
      case "Web Development":
        return Icons.web_outlined;
      case "Game Development":
        return Icons.sports_esports_outlined;
      case "Utility":
        return Icons.build_outlined;
      default:
        return Icons.code_outlined;
    }
  }
}
