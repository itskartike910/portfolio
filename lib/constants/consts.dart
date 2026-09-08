// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomColors {
  // ── Background ─────────────────────────────────────────────────────────────
  static const Color scaffoldBG   = Color(0xFF060610);
  static const Color appBarBG     = Color(0xFF07070E);

  // ── Glass Morphism Colors ───────────────────────────────────────────────────
  static const Color glassWhite     = Color(0x0EFFFFFF); // ~5.5% white fill
  static const Color glassBorder    = Color(0x18FFFFFF); // ~9.5% white border
  static const Color glassHighlight = Color(0x30FFFFFF); // ~19% white highlight

  // ── Ambient Background Blobs ────────────────────────────────────────────────
  static const Color blobPurple = Color(0xFF7B2FFE);
  static const Color blobCyan   = Color(0xFF00D9FF);
  static const Color blobPink   = Color(0xFFFF1493);

  // ── Card Background Colors (kept for compatibility) ────────────────────────
  static const Color cardBG      = Color(0xFF0E0E1A);
  static const Color cardText    = Colors.white;
  static const Color cardBGLight = Color(0xFF13131F);

  // ── Text Field ─────────────────────────────────────────────────────────────
  static const Color txtFieldbg = Color(0xFF0E0E1A);
  static const Color hintDark   = Color(0xff666874);
  static const Color hintLight  = Color(0xffb0b0b0);

  // ── Accent Colors ──────────────────────────────────────────────────────────
  static const Color primaryAccent   = Color(0xFF00D9FF);
  static const Color secondaryAccent = Color(0xFFFF006E);
  static const Color tertiaryAccent  = Color(0xFF8338EC);
  static const Color yellowPrimary   = Color(0xFFFFBE0B);
  static const Color yellowSecondary = Colors.yellowAccent;
  static const Color redPrimary      = Colors.red;
  static const Color redSecondary    = Color.fromARGB(255, 255, 109, 109);
  static const Color greenAccent     = Color(0xFF06FFA5);
  static const Color purpleAccent    = Color(0xFF9D4EDD);

  // ── Text Colors ────────────────────────────────────────────────────────────
  static const Color whitePrimary   = Colors.white;
  static const Color whiteSecondary = Color(0xFF8892B0);
  static const Color textGrey       = Color(0xFFCCD6F6);

  // ── Border Colors ──────────────────────────────────────────────────────────
  static const Color borderColor      = Color(0xFF1A1A2E);
  static const Color borderColorLight = Color(0xFF2D2D44);

  // ── Legacy gradient refs ────────────────────────────────────────────────────
  static const Color bgDark1  = Color(0xFF060610);
  static const Color bgDark2  = Color(0xFF0C0C20);
  static const Color bgLight1 = Colors.black26;
  static const Color bgLight2 = Colors.black12;
  static const Color dark     = Colors.black;

  // ── Gradients ──────────────────────────────────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF00D9FF), Color(0xFF7B2FFE)],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF6B6B), Color(0xFFFFE66D)],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF060610), Color(0xFF0A0A1A), Color(0xFF060610)],
  );

  // ── Glass Card Decorations ─────────────────────────────────────────────────
  // Actual blur is applied by the GlassCard widget (BackdropFilter).
  // These decorations handle fill, border, and shadow only.

  static BoxDecoration get glassCard => BoxDecoration(
    color: const Color(0x0EFFFFFF),
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    border: Border.all(color: const Color(0x18FFFFFF), width: 1),
    boxShadow: const [
      BoxShadow(color: Color(0x40000000), blurRadius: 40, offset: Offset(0, 12)),
    ],
  );

  static BoxDecoration glassCardAccent(Color accent, {double radius = 20}) =>
      BoxDecoration(
        color: const Color(0x0AFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: accent.withOpacity(0.28), width: 1),
        boxShadow: [
          BoxShadow(color: accent.withOpacity(0.08), blurRadius: 24, offset: const Offset(0, 8)),
          const BoxShadow(color: Color(0x33000000), blurRadius: 20, offset: Offset(0, 6)),
        ],
      );

  // ── Card decorations (glass-styled) ────────────────────────────────────────
  static BoxDecoration cardDecoration1 = BoxDecoration(
    color: const Color(0x0EFFFFFF),
    border: Border.all(color: const Color(0x18FFFFFF), width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    boxShadow: [
      BoxShadow(color: primaryAccent.withOpacity(0.05), blurRadius: 30, offset: const Offset(0, 10)),
      const BoxShadow(color: Color(0x44000000), blurRadius: 30, offset: Offset(0, 8)),
    ],
  );

  static BoxDecoration cardDecoration2 = BoxDecoration(
    color: const Color(0x0EFFFFFF),
    border: Border.all(color: const Color(0x18FFFFFF), width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    boxShadow: [
      BoxShadow(color: purpleAccent.withOpacity(0.05), blurRadius: 30, offset: const Offset(0, 10)),
      const BoxShadow(color: Color(0x44000000), blurRadius: 30, offset: Offset(0, 8)),
    ],
  );

  static BoxDecoration cardDecoration3 = BoxDecoration(
    color: const Color(0x0EFFFFFF),
    border: Border.all(color: const Color(0x18FFFFFF), width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    boxShadow: [
      BoxShadow(color: greenAccent.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 6)),
      const BoxShadow(color: Color(0x44000000), blurRadius: 20, offset: Offset(0, 6)),
    ],
  );

  static BoxDecoration glassDecoration = BoxDecoration(
    color: const Color(0x0EFFFFFF),
    border: Border.all(color: const Color(0x1AFFFFFF), width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    boxShadow: const [
      BoxShadow(color: Color(0x40000000), blurRadius: 30, offset: Offset(0, 10)),
    ],
  );
}
