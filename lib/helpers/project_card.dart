import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String? projectUrl;
  final String? imagePath;
  final String? projectTitle;
  final String? projectDescription;

  const ProjectCard({
    super.key,
    this.projectUrl,
    this.imagePath,
    this.projectTitle,
    this.projectDescription,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _launchURL();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        width: 250,
        height: 350,
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            colors: [
              Color.fromARGB(255, 60, 60, 60),
              Color.fromARGB(255, 85, 85, 85),
            ],
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 30, 84),
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Image.asset(
              widget.imagePath.toString(),
              width: 250,
              height: 175,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.projectTitle.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.projectDescription.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    if (widget.projectUrl != null) {
      final uri = Uri.parse(widget.projectUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch ${widget.projectUrl}')),
        );
      }
    }
  }
}
