import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String? projectUrl;
  final String? githubUrl;
  final String? imagePath;
  final String? projectTitle;
  final String? projectDescription;
  final String? keyFeatures;
  final bool? webAvailable;
  final bool? otherSource;

  const ProjectCard({
    super.key,
    this.projectUrl,
    this.githubUrl,
    this.imagePath,
    this.projectTitle,
    this.projectDescription,
    this.keyFeatures,
    this.webAvailable,
    this.otherSource,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovering = true),
      onExit: (event) => setState(() => isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: isHovering ? 320 : 300,
        height: isHovering ? 470 : 450,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            colors: [
              Color.fromARGB(255, 60, 60, 60),
              Color.fromARGB(255, 85, 85, 85),
            ],
          ),
          border: Border.all(
            color: isHovering
                ? Colors.yellow.withOpacity(0.75)
                : const Color.fromARGB(255, 0, 30, 85),
            width: 3,
          ),
          image: widget.imagePath != null
              ? DecorationImage(
                  image: AssetImage(
                    widget.imagePath.toString(),
                  ),
                  opacity: 0.1,
                  fit: BoxFit.fill,
                )
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.projectTitle.toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Divider(
                    height: 8,
                    thickness: 2,
                    color: CustomColors.whitePrimary,
                  ),
                  Text(
                    "--Description--",
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.projectDescription.toString(),
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "--Key-Features--",
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.keyFeatures.toString(),
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: CustomColors.whitePrimary,
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: const RadialGradient(
                  colors: [
                    Color.fromARGB(255, 55, 55, 55),
                    Color.fromARGB(255, 60, 60, 60),
                  ],
                ),
                border: Border.all(
                  color: CustomColors.borderColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      " Available on: ",
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  widget.otherSource!
                      ? Tooltip(
                          message:
                              widget.webAvailable! ? "Web Page" : "Android App",
                          textStyle: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: CustomColors.whitePrimary,
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                            icon: widget.webAvailable!
                                ? const Icon(Icons.desktop_windows)
                                : const Icon(Icons.android),
                            iconSize: 18,
                            hoverColor: CustomColors.hintLight,
                            color: CustomColors.whitePrimary,
                            onPressed: () async {
                              _launchURL(widget.projectUrl!);
                            },
                          ),
                        )
                      : const Text(""),
                  Tooltip(
                    message: "Github Repository",
                    textStyle: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: CustomColors.whitePrimary,
                        width: 1,
                      ),
                    ),
                    child: IconButton(
                      icon: ClipOval(
                        child: Image.asset(
                          "assets/icons/github.jpg",
                          height: 18,
                          width: 18,
                          fit: BoxFit.contain,
                        ),
                      ),
                      iconSize: 18,
                      hoverColor: CustomColors.hintLight,
                      color: CustomColors.whitePrimary,
                      onPressed: () async {
                        _launchURL(widget.githubUrl!);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }
}
