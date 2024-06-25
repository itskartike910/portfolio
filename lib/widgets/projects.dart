import 'package:flutter/material.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:portfolio/helpers/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      width: double.maxFinite,
      decoration: CustomColors.cardDecoration1,
      child: const Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceAround,
        spacing: 20.0,
        runSpacing: 20.0,
        children: [
          ProjectCard(
            projectTitle: "ChatApp",
            imagePath: "assets/images/ChatBox.png",
            githubUrl: "https://github.com/itskartike910/chat_app",
            projectUrl: "https://github.com/itskartike910/chat_app/releases",
            webAvailable: false,
            otherSource: true,
            projectDescription:
                "ChatBox is a real-time chat application built with Flutter and Firebase.\nIt allows users to sign up, log in, chat with other users.",
            keyFeatures:
                "•  User Authentication: Sign up and log in using email and password.\n•  Real-time Messaging: Send and receive messages in real-time with time-stamp.\n•  Delete Messages: You can delete messages from both ends.\n•  User Profile: View and update user profile information.\n•  Search Users: Search for other users to start a chat.",
          ),
          ProjectCard(
            projectTitle: "Tic Tac Toe",
            imagePath: "assets/images/tictactoe.png",
            githubUrl: "https://github.com/itskartike910/tic_tac_toe",
            projectUrl: "https://github.com/itskartike910/tic_tac_toe/releases",
            otherSource: true,
            webAvailable: false,
            projectDescription:
                "Tic Tac Toe is a fun and interactive game that you can play in your free time.\nYou can either play with a friend or you can challenge the computer.",
            keyFeatures:
                "•  Play with a Friend: Challenge your friend to a game of Tic Tac Toe.\n•  Play with Computer: Play against the computer with the AI implemented i.e. MinMax Algorithm.\n•  Scoreboard: Keep track of the scores of the players.\n•  Reset Game: Reset the game to start a new game.",
          ),
          ProjectCard(
            projectTitle: "QRCode Scanner & Generator",
            // imagePath: "",
            githubUrl: "https://github.com/itskartike910/qr_code_sg",
            projectUrl: "https://github.com/itskartike910/qr_code_sg/releases",
            webAvailable: false,
            otherSource: true,
            projectDescription:
                "A Flutter application which scans the qr code and make the link copyable to clipboard, and a qr code generator which generates the qr code using input text or links.",
            keyFeatures:
                "•  Scan QR Code: Scan the QR Code and copy the link to the clipboard.\n•  Generate QR Code: Generate the QR Code using the input text or link.\n•  Copy to Clipboard: Copy the generated QR Code to the clipboard.\n•  Share QR Code: Share the generated QR Code with others.",
          ),
          ProjectCard(
            projectTitle: "Portfolio Web",
            // imagePath: "",
            githubUrl: "https://github.com/itskartike910/portfolio",
            projectUrl: "https://github.com/itskartike910/portfolio",
            webAvailable: true,
            otherSource: true,
            projectDescription:
                "A Flutter web application that showcases my projects, skills, and experience.\nIt is built using Flutter Web and hosted on GitHub Pages.",
            keyFeatures:
                "•  Responsive Design: The website is fully responsive and works on all devices.\n•  Dark Mode: Toggle between light and dark mode.\n•  Animated UI: The website has a clean and modern UI with animations.\n•  Contact Form: Contact me using the contact form.",
          ),
          // ProjectCard(
          //   projectTitle: "Calculator",
          //   // imagePath: "",
          //   githubUrl: "",
          // ),
        ],
      ),
    );
  }
}
