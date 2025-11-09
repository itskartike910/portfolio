// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/consts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_functions/cloud_functions.dart';

class ContactMe extends StatefulWidget {
  final bool isMobile;

  const ContactMe({super.key, required this.isMobile});

  @override
  // ignore: library_private_types_in_public_api
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
    try {
      final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendEmail');
      final response = await callable.call(<String, dynamic>{
        'name': _nameController.text,
        'email': _emailController.text,
        'subject': _subjectController.text,
        'message': _messageController.text,
        'to': 'kumarkartik147359@gmail.com',
      });
      if (response.data['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to send message.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: widget.isMobile ? 25 : 35,
        horizontal: widget.isMobile ? 20 : 30,
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width > 800
          ? MediaQuery.of(context).size.width * 0.6
          : MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.cardBGLight.withOpacity(0.8),
            CustomColors.cardBG.withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: CustomColors.primaryAccent.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.primaryAccent.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomColors.primaryAccent.withOpacity(0.3),
                        CustomColors.purpleAccent.withOpacity(0.3),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: CustomColors.primaryAccent.withOpacity(0.5),
                    ),
                  ),
                  child: Icon(
                    Icons.email_outlined,
                    color: CustomColors.primaryAccent,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Get In Touch",
                  style: GoogleFonts.playfairDisplay(
                    color: CustomColors.whitePrimary,
                    fontWeight: FontWeight.w800,
                    fontSize: widget.isMobile ? 24 : 28,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.primaryAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: CustomColors.primaryAccent.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.mail_outline,
                    color: CustomColors.primaryAccent,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "To: ",
                    style: GoogleFonts.ubuntu(
                      color: CustomColors.whiteSecondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "kumarkartik147359@gmail.com",
                      style: GoogleFonts.ubuntu(
                        color: CustomColors.primaryAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _nameController,
              label: "Name",
              hint: "Enter your name",
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            _buildTextField(
              controller: _emailController,
              label: "Email",
              hint: "Enter your email",
              icon: Icons.email_outlined,
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
            _buildTextField(
              controller: _subjectController,
              label: "Subject",
              hint: "What's this about?",
              icon: Icons.subject_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            _buildTextField(
              controller: _messageController,
              label: "Message",
              hint: "Your message here...",
              icon: Icons.message_outlined,
              maxLines: 6,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomColors.primaryAccent,
                    CustomColors.purpleAccent,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.primaryAccent.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendEmail();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Send Message',
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            Divider(
              color: CustomColors.borderColorLight.withOpacity(0.3),
              height: 1,
            ),
            
            const SizedBox(height: 25),
            
            Text(
              "Or connect with me on",
              style: GoogleFonts.ubuntu(
                color: CustomColors.whiteSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(height: 15),
            
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: CustomColors.cardBGLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: CustomColors.borderColorLight.withOpacity(0.2),
                ),
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildSocialButton(
                    icon: "assets/icons/instagram.png",
                    color: const Color(0xFFE4405F),
                    url: "https://www.instagram.com/its_kartike/",
                  ),
                  _buildSocialButton(
                    icon: "assets/icons/facebook.png",
                    color: const Color(0xFF1877F2),
                    url: "https://www.facebook.com/profile.php?id=100009156546709",
                  ),
                  _buildSocialButton(
                    icon: "assets/icons/discord.png",
                    color: const Color(0xFF5865F2),
                    url: "https://discord.com/channels/kartikkumar910",
                  ),
                  _buildSocialButton(
                    icon: "assets/icons/telegram.png",
                    color: const Color(0xFF0088CC),
                    url: "https://t.me/i_am_groot02",
                  ),
                  _buildSocialButton(
                    icon: "assets/icons/gmail.png",
                    color: const Color(0xFFEA4335),
                    url: "https://mail.google.com/mail/u/0/#all?compose=GTvVlcRwRrlnKMBLBwTJGkSjJwrcgFHKBVzlRltxblZdQlRnxNLcSHPrWbljSPwpZmQCdrRZgtBrR",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: CustomColors.primaryAccent,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.ubuntu(
                color: CustomColors.textGrey,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: GoogleFonts.ubuntu(
            color: CustomColors.whitePrimary,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.ubuntu(
              color: CustomColors.whiteSecondary.withOpacity(0.5),
              fontSize: 14,
            ),
            filled: true,
            fillColor: CustomColors.cardBG.withOpacity(0.5),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: CustomColors.borderColorLight.withOpacity(0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: CustomColors.borderColorLight.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: CustomColors.primaryAccent.withOpacity(0.6),
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.redAccent,
                width: 1.5,
              ),
            ),
          ),
          validator: validator,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSocialButton({
    required String icon,
    required Color color,
    required String url,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(url),
        child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.2),
                color.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withOpacity(0.4),
              width: 1.5,
            ),
          ),
          child: Image.asset(
            icon,
            fit: BoxFit.contain,
          ),
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
