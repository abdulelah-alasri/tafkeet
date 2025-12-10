import '../tafkeet.dart';
import '../models/language.dart';
import '../models/currency.dart';
import '../utils/number_utils.dart';

/// Extension for integer numbers
extension TafkeetExtensionOnInt on int {
  /// Convert number to words in Arabic or English
  ///
  /// [lang] The desired language (if not specified, uses default language)
  /// [currency] The currency (if not specified, uses default currency or no currency)
  String tafkeet({Language? lang, Currency? currency, String? currencyCode, String? prefix, String? suffix}) {
    return Tafkeet.convert(toDouble(), lang: lang, currency: currency,currencyCode: currency?.code,prefix: prefix,suffix: suffix);
  }

  /// Format number with thousand separators
  /// 
  /// [digit] Number of decimal places to show (default: 0)
  /// 
  /// Example:
  /// ```dart
  /// 1234567.amountFormat(); // Returns: '1,234,567'
  /// ```
  String amountFormat({int digit = 0}) {
    return NumberUtils.amountFormat(this, digit: digit);
  }
}

