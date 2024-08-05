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

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: widget.isMobile ? 10 : 20,
      ),
      width: MediaQuery.of(context).size.width < 900
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width * 0.5,
      decoration: CustomColors.cardDecoration2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• Summer Intern @ EISystems Technologies.",
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.whitePrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "   - Interned as an AI Intern at EISystems Technologies (2 Months).\n   - Assisted with the research projects & developed an NLP model to enhance sentiment analysis.\n   - Honed expertise in deep learning architectures & NLP techniques.",
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.whitePrimary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Tooltip(
                message: "Link to the Certificate",
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
                child: TextButton(
                  onPressed: () async {
                    await _launchURL(
                        "https://drive.google.com/file/d/1b22DfCz2wz-5YyWGl9ss0TPMhtYGF-vw/view?usp=sharing");
                  },
                  child: Text(
                    "Link",
                    style: GoogleFonts.ubuntu(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Text(
                "May 2024 \n - July 2024",
                style: GoogleFonts.ubuntu(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const Divider(
            height: 5,
            thickness: 1,
            color: Colors.blueGrey,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ByteVerse Hackathon.",
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.whitePrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "   - Android Developer.\n   - Work as a UI Developer in the ByteVerse(a online Hackathon) and created an android app named AlertUs.",
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.whitePrimary,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Tooltip(
                message: "Link to the Certificate",
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
                child: TextButton(
                  onPressed: () async {
                    await _launchURL(
                        "https://drive.google.com/file/d/1NlKT-CzRPKpJsJ7jfoOgm63TXlI8339P/view?usp=sharing");
                  },
                  child: Text(
                    "Link",
                    style: GoogleFonts.ubuntu(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Text(
                "13th April\n 2023",
                style: GoogleFonts.ubuntu(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ],
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
