import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String? url;
  final String? imagePath;

  const ProjectCard({
    super.key,
    this.url,
    this.imagePath,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  Future<void> _launchURL() async {
    if (widget.url != null) {
      final uri = Uri.parse(widget.url!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch ${widget.url}')),
        );
      }
    }
  }
}
