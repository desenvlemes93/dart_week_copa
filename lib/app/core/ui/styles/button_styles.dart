import 'package:dart_week_copa/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_copa/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyles? _instance;
  // Avoid self isntance
  ButtonStyles._();
  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.i.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.i.textPrimaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
  ButtonStyle get yellowOutlineButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: ColorsApp.i.yellow,
        ),
        textStyle: TextStyles.i.textPrimaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
  ButtonStyle get primartButton => ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.i.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        textStyle: TextStyles.i.textPrimaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
  ButtonStyle get primaryOutlineButton => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: ColorsApp.i.primary,
        ),
        textStyle: TextStyles.i.textPrimaryFontExtraBold.copyWith(
          fontSize: 14,
        ),
      );
}

extension ButtonStyleExtension on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
