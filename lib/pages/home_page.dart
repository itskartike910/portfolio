import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/colours.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBG,
      appBar: AppBar(
        backgroundColor: CustomColors.appBarBG,
        centerTitle: true,
        title: Text(
          "Portfolio",
          textAlign: TextAlign.center,
          style: GoogleFonts.playfair(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 28,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              //MAIN

              //SKILLS

              //PROJECTS

              //CONTACT
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
