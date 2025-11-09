import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/social_profile.dart';
import 'package:portfolio/widgets/about_me.dart';

class MyProfile extends StatefulWidget {
  final bool isMobile;
  const MyProfile({super.key, required this.isMobile});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> with SingleTickerProviderStateMixin {
  bool isHovering = false;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: widget.isMobile ? 20 : 30,
        horizontal: widget.isMobile ? 15 : 25,
      ),
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Hero Section with Profile
          widget.isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
          
          const SizedBox(height: 30),
          
          // Social Links
          _buildSocialLinks(),
          
          const SizedBox(height: 25),
          
          // About Me Section
          AboutMe(isMobile: widget.isMobile),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Text
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Greeting
              Text(
                "Hello, I'm",
                style: GoogleFonts.ubuntu(
                  color: CustomColors.whiteSecondary,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              
              Text(
                "Kartik Kumar",
                style: GoogleFonts.playfairDisplay(
                  color: Colors.white,
                  fontSize: 56,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Animated Roles
              Row(
                children: [
                  Icon(
                    Icons.code_outlined,
                    color: CustomColors.primaryAccent,
                    size: 28,
                  ),
                  const SizedBox(width: 10),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Android Developer",
                        textStyle: GoogleFonts.ubuntu(
                          color: CustomColors.primaryAccent,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        "Software Engineer",
                        textStyle: GoogleFonts.ubuntu(
                          color: CustomColors.greenAccent,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        "Competitive Programmer",
                        textStyle: GoogleFonts.ubuntu(
                          color: CustomColors.yellowPrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        "Problem Solver",
                        textStyle: GoogleFonts.ubuntu(
                          color: CustomColors.secondaryAccent,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ],
              ),
              
              const SizedBox(height: 25),
              
              // Quick Stats
              Wrap(
                spacing: 20,
                runSpacing: 15,
                children: [
                  _buildStatChip("2+ Years", "Experience", CustomColors.primaryAccent),
                  _buildStatChip("10+", "Projects", CustomColors.greenAccent),
                  _buildStatChip("1800+", "Problems", CustomColors.yellowPrimary),
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(width: 50),
        
        // Right side - Profile Image
        Expanded(
          flex: 2,
          child: _buildProfileImage(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Profile Image
        _buildProfileImage(),
        
        const SizedBox(height: 30),
        
        // Text Content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hello, I'm",
              style: GoogleFonts.ubuntu(
                color: CustomColors.whiteSecondary,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            
            Text(
              "Kartik Kumar",
              style: GoogleFonts.playfairDisplay(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 15),
            
            // Animated Roles
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.code_outlined,
                  color: CustomColors.primaryAccent,
                  size: 20,
                ),
                const SizedBox(width: 10),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Android Developer",
                      textStyle: GoogleFonts.ubuntu(
                        color: CustomColors.primaryAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      "Software Engineer",
                      textStyle: GoogleFonts.ubuntu(
                        color: CustomColors.greenAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      "Competitive Programmer",
                      textStyle: GoogleFonts.ubuntu(
                        color: CustomColors.yellowPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      "Problem Solver",
                      textStyle: GoogleFonts.ubuntu(
                        color: CustomColors.secondaryAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            Wrap(
              spacing: 15,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _buildStatChip("2+ Years", "Experience", CustomColors.primaryAccent),
                _buildStatChip("10+", "Projects", CustomColors.greenAccent),
                _buildStatChip("1800+", "Problems", CustomColors.yellowPrimary),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: MouseRegion(
        onEnter: (event) => setState(() => isHovering = true),
        onExit: (event) => setState(() => isHovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Rotating gradient border (thinner and lighter)
              RotationTransition(
                turns: _rotationAnimation,
                child: Container(
                  width: widget.isMobile ? 200 : 300,
                  height: widget.isMobile ? 200 : 300,
                  padding: const EdgeInsets.all(3), // Thin border
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        CustomColors.primaryAccent.withOpacity(0.3),
                        CustomColors.purpleAccent.withOpacity(0.3),
                        CustomColors.secondaryAccent.withOpacity(0.3),
                        CustomColors.greenAccent.withOpacity(0.3),
                      ],
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.scaffoldBG,
                    ),
                  ),
                ),
              ),
              
              // Profile Image
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: widget.isMobile 
                    ? (isHovering ? 188 : 182) 
                    : (isHovering ? 288 : 282),
                height: widget.isMobile 
                    ? (isHovering ? 188 : 182) 
                    : (isHovering ? 288 : 282),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.primaryAccent.withOpacity(0.2),
                      blurRadius: isHovering ? 20 : 15,
                      spreadRadius: isHovering ? 3 : 1,
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage("assets/profile.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatChip(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.2),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.ubuntu(
              color: color,
              fontSize: widget.isMobile ? 18 : 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.ubuntu(
              color: CustomColors.textGrey,
              fontSize: widget.isMobile ? 11 : 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            CustomColors.cardBGLight.withOpacity(0.5),
            CustomColors.cardBG.withOpacity(0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: CustomColors.borderColorLight.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: [
          SocialProfile(
            profilName: "My Resume",
            iconPath: "assets/icons/code.png",
            bgColor: CustomColors.yellowPrimary,
            txtColor: Colors.black,
            isMobile: widget.isMobile,
            url: "https://drive.google.com/file/d/1noAQJumuiq1fuSMwoQjZqQx2JNGKiEsd/view?usp=sharing",
          ),
          SocialProfile(
            profilName: "LinkedIn",
            iconPath: "assets/icons/linkedin.png",
            bgColor: const Color(0xFF0077B5),
            txtColor: Colors.white,
            isMobile: widget.isMobile,
            url: "https://www.linkedin.com/in/kartik-kumar-4277b4235/",
          ),
          SocialProfile(
            profilName: "Github",
            iconPath: "assets/icons/github.jpg",
            bgColor: Colors.black,
            txtColor: Colors.white,
            isMobile: widget.isMobile,
            url: "https://github.com/itskartike910",
          ),
          SocialProfile(
            profilName: "LeetCode",
            iconPath: "assets/icons/leetcode.png",
            bgColor: const Color(0xFFFFA116),
            txtColor: Colors.black,
            isMobile: widget.isMobile,
            url: "https://leetcode.com/u/its_kartike/",
          ),
          SocialProfile(
            profilName: "GeeksForGeeks",
            iconPath: "assets/icons/gfg.jpg",
            bgColor: const Color(0xFF2F8D46),
            txtColor: Colors.white,
            isMobile: widget.isMobile,
            url: "https://www.geeksforgeeks.org/user/kumarkartik147359/",
          ),
          SocialProfile(
            profilName: "CodeChef",
            iconPath: "assets/icons/codechef.jpg",
            bgColor: const Color(0xFF5B4638),
            txtColor: Colors.white,
            isMobile: widget.isMobile,
            url: "https://www.codechef.com/users/its_kartike",
          ),
        ],
      ),
    );
  }
}
