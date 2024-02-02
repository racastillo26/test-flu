import 'package:app/res/colors/AppColors.dart';
import 'package:app/res/dimentions/AppDimension.dart';
import 'package:app/res/strings/SpanishStrings.dart';
import 'package:app/res/strings/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'strings/EnglishStrings.dart';

class Resources {
  final BuildContext _context;

  Resources(this._context);

  Strings get strings {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'es':
        return SpanishStrings();
      default:
        return EnglishStrings();
    }
  }

  AppColors get color {
    return AppColors();
  }

  AppDimention get dimension {
    return AppDimention();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
