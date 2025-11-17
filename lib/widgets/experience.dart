// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
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
        vertical: 20,
        horizontal: widget.isMobile ? 15 : 25,
      ),
      width: MediaQuery.of(context).size.width < 900
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width * 0.5,
      decoration: CustomColors.cardDecoration2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Latest Experience - Wootzapp Inc
          _buildExperienceItem(
            index: 0,
            company: "Wootzapp Inc.",
            role: "Software Engineer Intern",
            location: "Remote (DE, Delaware, USA)",
            duration: "Dec 2024 - Present",
            currentRole: true,
            responsibilities: [
              "Contributing to the development of a Chromium-based mobile browser that integrates an app store",
              "Enabling users to earn passive income through data labeling while browsing",
              "Gained hands-on experience in Android development and React-based extensions",
              "Applying theoretical knowledge to enhance browser functionalities",
            ],
            certificateUrl: null,
          ),
          
          const SizedBox(height: 20),
          
          // Second Experience - EISystems
          _buildExperienceItem(
            index: 1,
            company: "EISystems Technologies",
            role: "Summer Intern (AI)",
            location: "Internship",
            duration: "May 2024 - July 2024",
            currentRole: false,
            responsibilities: [
              "Interned as an AI Intern at EISystems Technologies (2 Months)",
              "Assisted with research projects & developed an NLP model to enhance sentiment analysis",
              "Honed expertise in deep learning architectures & NLP techniques",
            ],
            certificateUrl:
                "https://drive.google.com/file/d/1b22DfCz2wz-5YyWGl9ss0TPMhtYGF-vw/view?usp=sharing",
          ),
          
          const SizedBox(height: 20),
          
          // Third Experience - ByteVerse Hackathon
          _buildExperienceItem(
            index: 2,
            company: "ByteVerse Hackathon",
            role: "Android Developer",
            location: "Online Hackathon",
            duration: "13th April 2023",
            currentRole: false,
            responsibilities: [
              "Collaborated as an Android Developer during the ByteVerse online hackathon",
              "Developed 'AlertUs', a community emergency alert app using Flutter",
              "Designed an intuitive UI and implemented real-time notification functionality",
            ],
            certificateUrl:
                "https://drive.google.com/file/d/1NlKT-CzRPKpJsJ7jfoOgm63TXlI8339P/view?usp=sharing",
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
    required bool currentRole,
    required List<String> responsibilities,
    String? certificateUrl,
  }) {
    return FadeTransition(
      opacity: _animations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-0.3, 0),
          end: Offset.zero,
        ).animate(_animations[index]),
        child: Container(
          padding: const EdgeInsets.all(16),
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
              color: currentRole
                  ? CustomColors.primaryAccent.withOpacity(0.4)
                  : CustomColors.primaryAccent.withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: currentRole
                    ? CustomColors.primaryAccent.withOpacity(0.1)
                    : CustomColors.primaryAccent.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Timeline Indicator
                  Container(
                    width: 12,
                    height: 12,
                    margin: const EdgeInsets.only(top: 4, right: 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentRole
                          ? CustomColors.greenAccent
                          : CustomColors.primaryAccent,
                      boxShadow: [
                        BoxShadow(
                          color: currentRole
                              ? CustomColors.greenAccent.withOpacity(0.5)
                              : CustomColors.primaryAccent.withOpacity(0.5),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  
                  // Company & Role Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                company,
                                style: GoogleFonts.ubuntu(
                                  color: CustomColors.whitePrimary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: widget.isMobile ? 16 : 18,
                                ),
                              ),
                            ),
                            if (currentRole)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: CustomColors.greenAccent.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: CustomColors.greenAccent.withOpacity(0.5),
                                  ),
                                ),
                                child: Text(
                                  "CURRENT",
                                  style: GoogleFonts.ubuntu(
                                    color: CustomColors.greenAccent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          role,
                          style: GoogleFonts.ubuntu(
                            color: CustomColors.primaryAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: widget.isMobile ? 14 : 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: CustomColors.whiteSecondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              location,
                              style: GoogleFonts.ubuntu(
                                color: CustomColors.whiteSecondary,
                                fontWeight: FontWeight.w400,
                                fontSize: widget.isMobile ? 12 : 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Duration and Certificate Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 14,
                        color: CustomColors.yellowPrimary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        duration,
                        style: GoogleFonts.ubuntu(
                          color: CustomColors.yellowPrimary,
                          fontWeight: FontWeight.w500,
                          fontSize: widget.isMobile ? 12 : 14,
                        ),
                      ),
                    ],
                  ),
                  if (certificateUrl != null)
                    InkWell(
                      onTap: () => _launchURL(certificateUrl),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CustomColors.primaryAccent.withOpacity(0.2),
                              CustomColors.purpleAccent.withOpacity(0.2),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: CustomColors.primaryAccent.withOpacity(0.4),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.verified_outlined,
                              size: 14,
                              color: CustomColors.primaryAccent,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Certificate",
                              style: GoogleFonts.ubuntu(
                                color: CustomColors.primaryAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              
              const SizedBox(height: 12),
              Divider(
                color: CustomColors.borderColorLight.withOpacity(0.3),
                height: 1,
              ),
              const SizedBox(height: 12),
              
              // Responsibilities
              ...responsibilities.map((responsibility) => Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.only(top: 6, right: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.primaryAccent.withOpacity(0.7),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            responsibility,
                            style: GoogleFonts.ubuntu(
                              color: CustomColors.textGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: widget.isMobile ? 13 : 14,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
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
