import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';

class ContactMe extends StatelessWidget {
  final bool isMobile;
  const ContactMe({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width > 700
          ? MediaQuery.of(context).size.width * 0.40
          : MediaQuery.of(context).size.width * 0.9,
      decoration: CustomColors.cardDecoration2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
              hintText: "Enter Your Name",
              filled: true,
              fillColor: Colors.white12,
              labelStyle: GoogleFonts.ubuntu(
                color: CustomColors.whitePrimary,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter Your Email",
              filled: true,
              fillColor: Colors.white12,
              labelStyle: GoogleFonts.ubuntu(
                color: CustomColors.whitePrimary,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            maxLines: null,
            selectionHeightStyle: BoxHeightStyle.max,
            decoration: InputDecoration(
              labelText: "Subject",
              hintText: "Enter Subject",
              filled: true,
              fillColor: Colors.white12,
              labelStyle: GoogleFonts.ubuntu(
                color: CustomColors.whitePrimary,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            maxLines: 6,
            selectionHeightStyle: BoxHeightStyle.max,
            decoration: InputDecoration(
              labelText: "Message",
              hintText: "Enter Your Message",
              filled: true,
              fillColor: Colors.white12,
              labelStyle: GoogleFonts.ubuntu(
                color: CustomColors.whitePrimary,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Send Message',
              style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}