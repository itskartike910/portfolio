import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatefulWidget {
  final bool isMobile;

  const ContactMe({super.key, required this.isMobile});

  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> sendEmail() async {
    final String username = 'your_email@gmail.com'; // Your email
    final String password = 'your_app_password'; // Your email App Password

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Your Name')
      ..recipients.add('kumarkartik147359@gmail.com')
      ..subject = _subjectController.text
      ..text = 'Name: ${_nameController.text}\n'
          'Email: ${_emailController.text}\n'
          'Message: ${_messageController.text}';

    try {
      final sendReport = await send(message, smtpServer);
      log('Message sent: $sendReport');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );
    } on MailerException catch (e) {
      log('Message not sent. MailerException: \n$e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send message. MailerException.')),
      );
      for (var p in e.problems) {
        log('Problem: ${p.code}: ${p.msg}');
      }
    } catch (e) {
      log('Unexpected error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred.')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width > 800
          ? MediaQuery.of(context).size.width * 0.6
          : MediaQuery.of(context).size.width * 0.9,
      decoration: CustomColors.cardDecoration2,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              readOnly: true,
              initialValue: "kumarkartik147359@gmail.com",
              decoration: InputDecoration(
                labelText: "To",
                hintText: "kumarkartik147359@gmail.com",
                filled: true,
                fillColor: const Color.fromARGB(0, 255, 255, 255),
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
              controller: _nameController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _subjectController,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _messageController,
              maxLines: 6,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  sendEmail();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.center,
              decoration: CustomColors.cardDecoration3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: "Instagram",
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
                      onPressed: () async {
                        _launchURL("https://www.instagram.com/its_kartike/");
                      },
                      hoverColor: CustomColors.hintLight,
                      icon: Image.asset(
                        "assets/icons/instagram.png",
                        height: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Tooltip(
                    message: "Facebook",
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
                      onPressed: () {
                        _launchURL(
                            "https://www.facebook.com/profile.php?id=100009156546709");
                      },
                      hoverColor: CustomColors.hintLight,
                      icon: Image.asset(
                        "assets/icons/facebook.png",
                        height: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Tooltip(
                    message: "Discord",
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
                      onPressed: () {
                        _launchURL(
                            "https://discord.com/channels/kartikkumar910");
                      },
                      hoverColor: CustomColors.hintLight,
                      icon: Image.asset(
                        "assets/icons/discord.png",
                        height: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Tooltip(
                    message: "Telegram",
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
                      onPressed: () {
                        _launchURL("https://t.me/i_am_groot02");
                      },
                      hoverColor: CustomColors.hintLight,
                      icon: Image.asset(
                        "assets/icons/telegram.png",
                        height: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Tooltip(
                    message: "GMail",
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
                      onPressed: () {
                        _launchURL(
                            "https://mail.google.com/mail/u/0/#all?compose=GTvVlcRwRrlnKMBLBwTJGkSjJwrcgFHKBVzlRltxblZdQlRnxNLcSHPrWbljSPwpZmQCdrRZgtBrR");
                      },
                      hoverColor: CustomColors.hintLight,
                      icon: Image.asset(
                        "assets/icons/gmail.png",
                        height: 30,
                      ),
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

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {}
  }
}
