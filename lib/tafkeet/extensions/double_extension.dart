import '../tafkeet.dart';
import '../models/language.dart';
import '../models/currency.dart';
import '../utils/number_utils.dart';

/// Extension for double numbers
extension TafkeetExtensionOnDouble on double {
  /// Convert number to words in Arabic or English
  ///
  /// [lang] The desired language (if not specified, uses default language)
  /// [currency] The currency (if not specified, uses default currency or no currency)
  String tafkeet({Language? lang, Currency? currency}) {
    return Tafkeet.convert(this, lang: lang, currency: currency);
  }

  /// Format number with thousand separators
  /// 
  /// [digit] Number of decimal places to show (default: 0)
  /// 
  /// Example:
  /// ```dart
  /// 1234567.89.amountFormat(digit: 2); // Returns: '1,234,567.89'
  /// ```
  String amountFormat({int digit = 0}) {
    return NumberUtils.amountFormat(this, digit: digit);
  }
}
