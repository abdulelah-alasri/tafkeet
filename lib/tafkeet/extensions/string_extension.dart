import '../tafkeet.dart';
import '../models/language.dart';
import '../models/currency.dart';
import '../utils/number_utils.dart';

/// Extension for string numbers
extension TafkeetExtensionOnString on String {
  /// Convert string to words if it contains a valid number
  /// Returns the original string if it's not a valid number
  /// 
  /// Automatically converts Arabic-Indic numerals (٠١٢٣...) to Western numerals before conversion
  ///
  /// [lang] The desired language (if not specified, uses default language)
  /// [currency] The currency (if not specified, uses default currency or no currency)
  /// 
  /// Example:
  /// ```dart
  /// '123'.tafkeet(lang: Lang.ar); // Works with English numerals
  /// '١٢٣'.tafkeet(lang: Lang.ar); // Works with Arabic numerals
  /// ```
  String tafkeet({Language? lang, Currency? currency, String? currencyCode, String? prefix, String? suffix}) {
    // Convert Arabic numerals to English first
    final normalizedString = NumberUtils.replaceArabicNumber(this);
    final number = double.tryParse(normalizedString);
    if (number == null) {
      return this; // Return original string if not a valid number
    }
    return Tafkeet.convert(number, lang: lang, currency: currency,currencyCode: currencyCode,prefix: prefix,suffix: suffix);
  }

  /// Replace Arabic/Hindi numerals with English numerals
  /// 
  /// Converts Arabic-Indic digits (٠١٢٣٤٥٦٧٨٩) to Western Arabic numerals (0123456789)
  /// 
  /// Example:
  /// ```dart
  /// '١٢٣'.replaceArabicNumbers(); // Returns: '123'
  /// '١٢٣.٤٥'.replaceArabicNumbers(); // Returns: '123.45'
  /// 'السعر: ٩٩٩ ريال'.replaceArabicNumbers(); // Returns: 'السعر: 999 ريال'
  /// ```
  String replaceArabicNumbers() {
    return NumberUtils.replaceArabicNumber(this);
  }

  /// Format string containing number with thousand separators
  /// 
  /// [digit] Number of decimal places to show (default: 0)
  /// Returns original string if it doesn't contain a valid number
  /// 
  /// Example:
  /// ```dart
  /// '1234567'.amountFormat(); // Returns: '1,234,567'
  /// '1234567.89'.amountFormat(digit: 2); // Returns: '1,234,567.89'
  /// 'not a number'.amountFormat(); // Returns: 'not a number'
  /// ```
  String amountFormat({int digit = 0}) {
    final normalizedString = NumberUtils.replaceArabicNumber(this);
    final number = double.tryParse(normalizedString);
    if (number == null) {
      return this; // Return original string if not a valid number
    }
    return NumberUtils.amountFormat(number, digit: digit);
  }
}

