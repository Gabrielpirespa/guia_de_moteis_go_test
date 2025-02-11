import 'dart:ui';

abstract class AppColors {
  Color get primaryColor;
  Color get backgroundColor;
  Color get darkRed;
  Color get gray;
  Color get gray2;
  Color get lightGray;
  Color get lightGray2;
  Color get lightGray3;
  Color get lightGray4;
  Color get lightGray5;
  Color get white;
  Color get black;
  Color get green;
}

class AppColorsDefault implements AppColors {
  @override
  Color get primaryColor => const Color(0xFFD11621);
  @override
  Color get backgroundColor => const Color(0xFFF8F9Fb);
  @override
  Color get darkRed => const Color(0xFFB8000C);
  @override
  get gray => const Color(0xFFC2C2C2);
  @override
  get gray2 => const Color(0xFF979797);
  @override
  Color get lightGray => const Color(0xFFE5E5E5);
  @override
  Color get lightGray2 => const Color(0xFFF8F9FB);
  @override
  Color get lightGray3 => const Color(0xFFE8E8E8);
  @override
  Color get lightGray4 => const Color(0xFFEFEFEF);
  @override
  Color get lightGray5 => const Color(0xFFE9ECF1);
  @override
  Color get white => const Color(0xFFFDFEFE);
  @override
  Color get black => const Color(0xFF2C2C2C);
  @override
  Color get green => const Color(0xFF53A288);
}
