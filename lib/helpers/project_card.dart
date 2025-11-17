import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/constants/project_data.dart';
import 'package:url_launcher/url_launcher.dart';

class EnhancedProjectCard extends StatefulWidget {
  final ProjectData project;
  final int index;

  const EnhancedProjectCard({
    super.key,
    required this.project,
    required this.index,
  });

  @override
  State<EnhancedProjectCard> createState() => _EnhancedProjectCardState();
}

class _EnhancedProjectCardState extends State<EnhancedProjectCard>
    with SingleTickerProviderStateMixin {
  bool isHovering = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getCategoryColor() {
    switch (widget.project.category) {
      case "Machine Learning":
        return CustomColors.purpleAccent;
      case "Mobile Development":
        return CustomColors.primaryAccent;
      case "Web Development":
        return CustomColors.greenAccent;
      case "Game Development":
        return CustomColors.secondaryAccent;
      case "Utility":
        return CustomColors.yellowPrimary;
      default:
        return CustomColors.primaryAccent;
    }
  }

  IconData _getCategoryIcon() {
    switch (widget.project.category) {
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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() => isHovering = true);
        _controller.forward();
      },
      onExit: (event) {
        setState(() => isHovering = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTap: () => _showProjectDetails(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 350,
            height: 450,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CustomColors.cardBG.withOpacity(0.8),
                  CustomColors.cardBGLight.withOpacity(0.6),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isHovering
                    ? _getCategoryColor().withOpacity(0.6)
                    : CustomColors.borderColorLight.withOpacity(0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: isHovering
                      ? _getCategoryColor().withOpacity(0.3)
                      : Colors.black.withOpacity(0.2),
                  blurRadius: isHovering ? 25 : 15,
                  offset: const Offset(0, 8),
                  spreadRadius: isHovering ? 2 : 0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Category Badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Category Icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            _getCategoryColor().withOpacity(0.3),
                            _getCategoryColor().withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _getCategoryColor().withOpacity(0.5),
                        ),
                      ),
                      child: Icon(
                        _getCategoryIcon(),
                        color: _getCategoryColor(),
                        size: 28,
                      ),
                    ),
                    // Category Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _getCategoryColor().withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _getCategoryColor().withOpacity(0.5),
                        ),
                      ),
                      child: Text(
                        widget.project.category,
                        style: GoogleFonts.ubuntu(
                          color: _getCategoryColor(),
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Project Title
                Text(
                  widget.project.title,
                  style: GoogleFonts.playfairDisplay(
                    color: CustomColors.whitePrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 8),
                
                // Duration
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: CustomColors.whiteSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.project.duration,
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.whiteSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Description
                Expanded(
                  child: Text(
                    widget.project.description,
                    style: GoogleFonts.ubuntu(
                      color: CustomColors.textGrey,
                      fontSize: 14,
                      height: 1.6,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Technologies (Show first 3-4)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.project.technologies
                      .take(4)
                      .map((tech) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: CustomColors.primaryAccent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: CustomColors.primaryAccent.withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              tech,
                              style: GoogleFonts.ubuntu(
                                color: CustomColors.primaryAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 11,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                
                if (widget.project.technologies.length > 4)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "+${widget.project.technologies.length - 4} more",
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.whiteSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                
                const SizedBox(height: 16),
                
                // Action Buttons
                Row(
                  children: [
                    // View Details Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _showProjectDetails(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _getCategoryColor().withOpacity(0.2),
                          foregroundColor: _getCategoryColor(),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: _getCategoryColor().withOpacity(0.5),
                            ),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "View Details",
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(width: 10),
                    
                    // GitHub Button
                    if (widget.project.githubUrl != null) ...[
                      _buildIconButton(
                        icon: Icons.code,
                        onTap: () => _launchURL(widget.project.githubUrl!),
                        tooltip: "GitHub",
                      ),
                      const SizedBox(width: 8),
                    ],
                    
                    // Web/Android Button
                    if (widget.project.projectUrl != null)
                      _buildIconButton(
                        icon: widget.project.webAvailable
                            ? Icons.launch
                            : Icons.android,
                        onTap: () => _launchURL(widget.project.projectUrl!),
                        tooltip: widget.project.webAvailable
                            ? "Live Demo"
                            : "Download APK",
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: CustomColors.primaryAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: CustomColors.primaryAccent.withOpacity(0.3),
            ),
          ),
          child: Icon(
            icon,
            color: CustomColors.primaryAccent,
            size: 18,
          ),
        ),
      ),
    );
  }

  void _showProjectDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _ProjectDetailsDialog(
        project: widget.project,
        categoryColor: _getCategoryColor(),
        categoryIcon: _getCategoryIcon(),
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

// Detailed Project Dialog
class _ProjectDetailsDialog extends StatelessWidget {
  final ProjectData project;
  final Color categoryColor;
  final IconData categoryIcon;

  const _ProjectDetailsDialog({
    required this.project,
    required this.categoryColor,
    required this.categoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 50,
        vertical: isMobile ? 30 : 50,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.cardBG,
              CustomColors.cardBGLight,
            ],
          ),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: categoryColor.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: categoryColor.withOpacity(0.2),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      categoryColor.withOpacity(0.2),
                      categoryColor.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: categoryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: categoryColor.withOpacity(0.5),
                        ),
                      ),
                      child: Icon(
                        categoryIcon,
                        color: categoryColor,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: GoogleFonts.playfairDisplay(
                              color: CustomColors.whitePrimary,
                              fontSize: isMobile ? 22 : 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: categoryColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: categoryColor.withOpacity(0.5),
                                  ),
                                ),
                                child: Text(
                                  project.category,
                                  style: GoogleFonts.ubuntu(
                                    color: categoryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 14,
                                color: CustomColors.whiteSecondary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                project.duration,
                                style: GoogleFonts.ubuntu(
                                  color: CustomColors.whiteSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              
              // Content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Detailed Description
                    _buildSection(
                      title: "About This Project",
                      icon: Icons.description_outlined,
                      color: categoryColor,
                      child: Text(
                        project.detailedDescription,
                        style: GoogleFonts.ubuntu(
                          color: CustomColors.textGrey,
                          fontSize: 15,
                          height: 1.7,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Key Features
                    _buildSection(
                      title: "Key Features",
                      icon: Icons.star_outline,
                      color: categoryColor,
                      child: Column(
                        children: project.keyFeatures
                            .map((feature) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 6, right: 10),
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: categoryColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: categoryColor.withOpacity(0.5),
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          feature,
                                          style: GoogleFonts.ubuntu(
                                            color: CustomColors.textGrey,
                                            fontSize: 14,
                                            height: 1.6,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Technologies Used
                    _buildSection(
                      title: "Technologies Used",
                      icon: Icons.code_outlined,
                      color: categoryColor,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: project.technologies
                            .map((tech) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        categoryColor.withOpacity(0.2),
                                        categoryColor.withOpacity(0.1),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: categoryColor.withOpacity(0.4),
                                    ),
                                  ),
                                  child: Text(
                                    tech,
                                    style: GoogleFonts.ubuntu(
                                      color: categoryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Action Buttons
                    Row(
                      children: [
                        if (project.githubUrl != null)
                          Expanded(
                            child: _buildActionButton(
                              label: "View on GitHub",
                              icon: Icons.code,
                              color: categoryColor,
                              onTap: () => _launchURL(project.githubUrl!),
                            ),
                          ),
                        if (project.githubUrl != null && project.projectUrl != null)
                          const SizedBox(width: 12),
                        if (project.projectUrl != null)
                          Expanded(
                            child: _buildActionButton(
                              label: project.webAvailable
                                  ? "Live Demo"
                                  : "Download APK",
                              icon: project.webAvailable
                                  ? Icons.launch
                                  : Icons.download,
                              color: categoryColor,
                              onTap: () => _launchURL(project.projectUrl!),
                            ),
                          ),
                      ],
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

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Color color,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 10),
            Text(
              title,
              style: GoogleFonts.playfairDisplay(
                color: CustomColors.whitePrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.2),
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: color.withOpacity(0.5), width: 1.5),
        ),
        elevation: 0,
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

