import '../tafkeet.dart';
import '../models/language.dart';
import '../models/currency.dart';

/// Extension for integer numbers
extension TafkeetExtensionOnInt on int {
  /// Convert number to words in Arabic or English
  ///
  /// [lang] The desired language (if not specified, uses default language)
  /// [currency] The currency (if not specified, uses default currency or no currency)
  String tafkeet({Language? lang, Currency? currency}) {
    return Tafkeet.convert(toDouble(), lang: lang, currency: currency);
  }
}

