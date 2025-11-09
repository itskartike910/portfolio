import 'package:flutter/material.dart';

class CustomColors {
  // Modern Background Colors
  static const Color scaffoldBG = Color(0xFF0A0E27);
  static const Color appBarBG = Color(0xFF0D1117);
  static const Color appBarText = Colors.white;
  
  // Card Colors
  static const Color cardBG = Color(0xFF1C2333);
  static const Color cardText = Colors.white;
  static const Color cardBGLight = Color(0xFF252D3F);
  
  // Background Gradients
  static const Color bgDark1 = Color(0xFF0A0E27);
  static const Color bgDark2 = Color(0xFF161B33);
  static const Color bgLight1 = Colors.black26;
  static const Color bgLight2 = Colors.black12;
  static const Color dark = Colors.black;
  
  // Text Field & Input
  static const Color txtFieldbg = Color(0xFF1E2738);
  static const Color hintDark = Color(0xff666874);
  static const Color hintLight = Color(0xffb0b0b0);
  
  // Accent Colors
  static const Color primaryAccent = Color(0xFF00D9FF);
  static const Color secondaryAccent = Color(0xFFFF006E);
  static const Color tertiaryAccent = Color(0xFF8338EC);
  static const Color yellowPrimary = Color(0xFFFFBE0B);
  static const Color yellowSecondary = Colors.yellowAccent;
  static const Color redPrimary = Colors.red;
  static const Color redSecondary = Colors.redAccent;
  static const Color greenAccent = Color(0xFF06FFA5);
  static const Color purpleAccent = Color(0xFF9D4EDD);
  
  // Text Colors
  static const Color whitePrimary = Colors.white;
  static const Color whiteSecondary = Color(0xFF8892B0);
  static const Color textGrey = Color(0xFFCCD6F6);
  
  // Border Colors
  static const Color borderColor = Color(0xFF2D3748);
  static const Color borderColorLight = Color(0xFF4A5568);

  // Modern Gradient Backgrounds
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF667EEA),
      Color(0xFF764BA2),
    ],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF6B6B),
      Color(0xFFFFE66D),
    ],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0A0E27),
      Color(0xFF161B33),
      Color(0xFF0A0E27),
    ],
  );

  // Enhanced Card Decorations with Modern Design
  static BoxDecoration cardDecoration1 = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF1C2333).withOpacity(0.9),
        const Color(0xFF252D3F).withOpacity(0.8),
      ],
    ),
    border: Border.all(
      color: CustomColors.borderColorLight.withOpacity(0.3),
      width: 1.5,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    boxShadow: [
      BoxShadow(
        color: CustomColors.primaryAccent.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ],
  );
  
  static BoxDecoration cardDecoration2 = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF252D3F).withOpacity(0.8),
        const Color(0xFF1C2333).withOpacity(0.9),
      ],
    ),
    border: Border.all(
      color: CustomColors.borderColorLight.withOpacity(0.3),
      width: 1.5,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    boxShadow: [
      BoxShadow(
        color: CustomColors.purpleAccent.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ],
  );
  
  static BoxDecoration cardDecoration3 = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xFF1E2738).withOpacity(0.9),
        const Color(0xFF252D3F).withOpacity(0.8),
      ],
    ),
    border: Border.all(
      color: CustomColors.borderColorLight.withOpacity(0.3),
      width: 1.5,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: CustomColors.greenAccent.withOpacity(0.05),
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
  );

  // Glassmorphism Style
  static BoxDecoration glassDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withOpacity(0.1),
        Colors.white.withOpacity(0.05),
      ],
    ),
    border: Border.all(
      color: Colors.white.withOpacity(0.2),
      width: 1,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );
}
