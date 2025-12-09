import '../tafkeet.dart';
import '../models/language.dart';
import '../models/currency.dart';

/// Extension for double numbers
extension TafkeetExtensionOnDouble on double {
  /// Convert number to words in Arabic or English
  ///
  /// [lang] The desired language (if not specified, uses default language)
  /// [currency] The currency (if not specified, uses default currency or no currency)
  String tafkeet({Language? lang, Currency? currency}) {
    return Tafkeet.convert(this, lang: lang, currency: currency);
  }
}
