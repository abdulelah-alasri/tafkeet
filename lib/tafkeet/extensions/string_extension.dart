import '../tafkeet.dart';
import '../models/language.dart';
import '../models/currency.dart';

/// Extension for string numbers
extension TafkeetExtensionOnString on String {
  /// Convert string to words if it contains a valid number
  /// Returns the original string if it's not a valid number
  ///
  /// [lang] The desired language (if not specified, uses default language)
  /// [currency] The currency (if not specified, uses default currency or no currency)
  String tafkeet({Language? lang, Currency? currency}) {
    final number = double.tryParse(this);
    if (number == null) {
      return this; // Return original string if not a valid number
    }
    return Tafkeet.convert(number, lang: lang, currency: currency);
  }
}

