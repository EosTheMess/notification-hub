// Neon Rush Theme Configuration
// Electric Green (#00FFB4) on Charcoal/Deep Black backgrounds

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeonRushTheme {
  // Core Colors
  static const Color neonGreen = Color(0xFF00FFB4);
  static const Color neonGreenDim = Color(0x3300FFB4);
  static const Color neonGreenGlow = Color(0x8000FFB4);

  static const Color deepBlack = Color(0xFF0A0A0A);
  static const Color charcoal = Color(0xFF141414);
  static const Color charcoalLight = Color(0xFF1E1E1E);
  static const Color charcoalLighter = Color(0xFF282828);

  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFE0E0E0);
  static const Color grayText = Color(0xFF888888);
  static const Color darkGray = Color(0xFF444444);

  // Semantic Colors
  static const Color success = Color(0xFF00FF88);
  static const Color warning = Color(0xFFFFB800);
  static const Color error = Color(0xFFFF3366);
  static const Color info = Color(0xFF00D4FF);

  // Gradient Definitions
  static const LinearGradient neonGlowGradient = LinearGradient(
    colors: [neonGreen, Color(0xFF00D4AA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [charcoal, charcoalLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [neonGreen, Color(0xFF00CC99)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient glowGradient = RadialGradient(
    colors: [neonGreenGlow, Colors.transparent],
    center: Alignment.center,
    radius: 1.5,
  );

  // Text Styles
  static TextStyle get heading1 => GoogleFonts.spaceGrotesk(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: pureWhite,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static TextStyle get heading2 => GoogleFonts.spaceGrotesk(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: pureWhite,
    letterSpacing: -0.3,
    height: 1.3,
  );

  static TextStyle get heading3 => GoogleFonts.spaceGrotesk(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: pureWhite,
    letterSpacing: -0.2,
    height: 1.4,
  );

  static TextStyle get bodyLarge => GoogleFonts.jetBrainsMono(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: offWhite,
    height: 1.5,
  );

  static TextStyle get bodyMedium => GoogleFonts.jetBrainsMono(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: offWhite,
    height: 1.5,
  );

  static TextStyle get bodySmall => GoogleFonts.jetBrainsMono(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: grayText,
    height: 1.4,
  );

  static TextStyle get labelLarge => GoogleFonts.spaceGrotesk(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: pureWhite,
    letterSpacing: 0.5,
  );

  static TextStyle get labelMedium => GoogleFonts.spaceGrotesk(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: offWhite,
    letterSpacing: 0.3,
  );

  static TextStyle get monoLarge => GoogleFonts.jetBrainsMono(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: neonGreen,
    height: 1.4,
  );

  static TextStyle get monoMedium => GoogleFonts.jetBrainsMono(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: neonGreen,
    height: 1.4,
  );

  static TextStyle get monoSmall => GoogleFonts.jetBrainsMono(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: neonGreen,
    height: 1.3,
  );

  // Box Shadows
  static List<BoxShadow> get neonGlow => [
    BoxShadow(
      color: neonGreenGlow,
      blurRadius: 20,
      spreadRadius: 2,
      offset: Offset.zero,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get subtleGlow => [
    BoxShadow(
      color: neonGreen.withOpacity(0.3),
      blurRadius: 12,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: neonGreen.withOpacity(0.1),
      blurRadius: 8,
      spreadRadius: 1,
    ),
  ];

  static List<BoxShadow> get innerGlow => [
    BoxShadow(
      color: neonGreen.withOpacity(0.1),
      blurRadius: 8,
      spreadRadius: -2,
    ),
  ];

  // Border Radius
  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(16));
  static const BorderRadius buttonRadius = BorderRadius.all(Radius.circular(12));
  static const BorderRadius inputRadius = BorderRadius.all(Radius.circular(10));
  static const BorderRadius chipRadius = BorderRadius.all(Radius.circular(8));
  static const BorderRadius avatarRadius = BorderRadius.all(Radius.circular(12));

  // Borders
  static Border get neonBorder => Border.all(
    color: neonGreen.withOpacity(0.5),
    width: 1.5,
  );

  static Border get subtleBorder => Border.all(
    color: darkGray,
    width: 1,
  );

  static Border get glowBorder => Border.all(
    color: neonGreen,
    width: 2,
  );

  // Animation Durations
  static const Duration fastAnimation = Duration(milliseconds: 150);
  static const Duration normalAnimation = Duration(milliseconds: 300);
  static const Duration slowAnimation = Duration(milliseconds: 500);
  static const Duration pulseAnimation = Duration(milliseconds: 1500);

  // Spacing
  static const double spacingXS = 4;
  static const double spacingSM = 8;
  static const double spacingMD = 16;
  static const double spacingLG = 24;
  static const double spacingXL = 32;
  static const double spacingXXL = 48;

  // Icon Sizes
  static const double iconXS = 16;
  static const double iconSM = 20;
  static const double iconMD = 24;
  static const double iconLG = 32;
  static const double iconXL = 48;

  // ThemeData for MaterialApp
  static ThemeData get themeData => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: deepBlack,

    colorScheme: const ColorScheme.dark(
      primary: neonGreen,
      secondary: Color(0xFF00D4AA),
      tertiary: Color(0xFF00D4FF),
      surface: charcoal,
      surfaceContainerHighest: charcoalLighter,
      onSurface: pureWhite,
      onSurfaceVariant: offWhite,
      outline: darkGray,
      outlineVariant: Color(0xFF333333),
      error: error,
      onError: pureWhite,
    ),

    textTheme: TextTheme(
      displayLarge: heading1,
      displayMedium: heading2,
      displaySmall: heading3,
      headlineLarge: heading1,
      headlineMedium: heading2,
      headlineSmall: heading3,
      titleLarge: heading3,
      titleMedium: labelLarge,
      titleSmall: labelMedium,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: monoSmall,
    ),

    cardTheme: CardThemeData(
      color: charcoal,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: cardRadius,
        side: subtleBorder,
      ),
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: deepBlack,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
        textStyle: labelLarge,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return charcoalLighter;
          return Colors.transparent;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return grayText;
          return deepBlack;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) return neonGreen.withOpacity(0.3);
          if (states.contains(WidgetState.hovered)) return neonGreen.withOpacity(0.1);
          return Colors.transparent;
        }),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: neonGreen,
        side: neonBorder,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
        textStyle: labelLarge,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) return neonGreenDim;
          if (states.contains(WidgetState.pressed)) return neonGreen.withOpacity(0.2);
          return Colors.transparent;
        }),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) return glowBorder;
          return neonBorder;
        }),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: neonGreen,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
        textStyle: labelMedium,
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) return neonGreenDim;
          return Colors.transparent;
        }),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: charcoalLight,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: inputRadius,
        borderSide: subtleBorder,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: inputRadius,
        borderSide: subtleBorder,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: inputRadius,
        borderSide: glowBorder,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: inputRadius,
        borderSide: BorderSide(color: error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: inputRadius,
        borderSide: BorderSide(color: error, width: 2),
      ),
      labelStyle: labelMedium.copyWith(color: grayText),
      hintStyle: bodySmall,
      floatingLabelStyle: labelMedium.copyWith(color: neonGreen),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: charcoalLight,
      selectedColor: neonGreenDim,
      disabledColor: darkGray.withOpacity(0.5),
      labelStyle: labelMedium,
      secondaryLabelStyle: labelMedium.copyWith(color: deepBlack),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: chipRadius,
        side: subtleBorder,
      ),
      side: subtleBorder,
      brightness: Brightness.dark,
    ),

    dividerTheme: DividerThemeData(
      color: darkGray,
      thickness: 1,
      space: spacingMD,
    ),

    listTileTheme: ListTileThemeData(
      tileColor: Colors.transparent,
      selectedTileColor: neonGreenDim,
      iconColor: offWhite,
      textColor: offWhite,
      shape: RoundedRectangleBorder(borderRadius: cardRadius),
      contentPadding: const EdgeInsets.symmetric(horizontal: spacingMD, vertical: spacingSM),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: charcoal,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: cardRadius,
        side: neonBorder,
      ),
      titleTextStyle: heading3,
      contentTextStyle: bodyMedium,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: charcoal,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      modalBackgroundColor: charcoal,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: charcoal,
      elevation: 0,
      indicatorColor: neonGreenDim,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return labelMedium.copyWith(color: neonGreen, fontWeight: FontWeight.w600);
        }
        return labelMedium.copyWith(color: grayText);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: neonGreen, size: iconMD);
        }
        return IconThemeData(color: grayText, size: iconMD);
      }),
    ),

    tabBarTheme: TabBarThemeData(
      labelColor: neonGreen,
      unselectedLabelColor: grayText,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: neonGreen, width: 3),
        ),
      ),
      labelStyle: labelMedium.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: labelMedium,
      dividerColor: Colors.transparent,
    ),

    sliderTheme: SliderThemeData(
      activeTrackColor: neonGreen,
      inactiveTrackColor: darkGray,
      thumbColor: neonGreen,
      overlayColor: neonGreenDim,
      valueIndicatorColor: neonGreen,
      valueIndicatorTextStyle: monoSmall.copyWith(color: deepBlack),
      trackHeight: 4,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return neonGreen;
        return grayText;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return neonGreenDim;
        return darkGray;
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return neonGreen;
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(deepBlack),
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return BorderSide(color: neonGreen, width: 2);
        return subtleBorder;
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),

    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return neonGreen;
        return grayText;
      }),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: neonGreen,
      linearTrackColor: darkGray,
      circularTrackColor: darkGray,
    ),

    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: charcoalLighter,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: darkGray),
        boxShadow: cardShadow,
      ),
      textStyle: bodySmall,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: charcoalLighter,
      contentTextStyle: bodyMedium,
      actionTextColor: neonGreen,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: cardRadius,
        side: subtleBorder,
      ),
      elevation: 0,
    ),

    extensions: <ThemeExtension<dynamic>>[
      _NeonRushExtension(),
    ],
  );
}

class _NeonRushExtension extends ThemeExtension<_NeonRushExtension> {
  @override
  _NeonRushExtension copyWith() => _NeonRushExtension();

  @override
  _NeonRushExtension lerp(ThemeExtension<_NeonRushExtension>? other, double t) => this;
}

// Extension for easy access
extension NeonRushThemeExtension on BuildContext {
  NeonRushTheme get neon => NeonRushTheme();
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get text => Theme.of(this).textTheme;
}