import 'config/currency_config.dart';
import 'converters/arabic_converter.dart';
import 'converters/english_converter.dart';
import 'models/currency_info.dart';
import 'models/currency.dart';
import 'models/language.dart';
import 'utils/number_utils.dart';

/// Main class for converting numbers to words
class Tafkeet {
  static Language _defaultLanguage = Language.ar;
  static Currency? _defaultCurrency;

  /// Configure the package
  /// 
  /// [defaultLang] Default language
  /// [defaultCurrency] Default currency
  static void configure({
    Language? defaultLang,
    Currency? defaultCurrency,
  }) {
    if (defaultLang != null) {
      _defaultLanguage = defaultLang;
    }
    if (defaultCurrency != null) {
      _defaultCurrency = defaultCurrency;
    }
  }

  /// Convert a number to words
  /// 
  /// [number] The number to convert
  /// [lang] The desired language (if not specified, uses default language)
  /// [currency] The currency (if not specified, uses default currency or no currency)
  /// [currencyCode] Currency code (alternative to currency, can be used for custom currencies)
  /// [prefix] Text before the converted number
  /// [suffix] Text after the converted number
  static String convert(
    double number, {
    Language? lang,
    Currency? currency,
    String? currencyCode,
    String? prefix,
    String? suffix,
  }) {
    // Validate the number
    if (!NumberUtils.isValidNumber(number)) {
      throw ArgumentError('Invalid number input');
    }

    // Determine the language
    final selectedLang = lang ?? _defaultLanguage;

    // Determine the currency
    CurrencyInfo? currencyInfo;
    
    // If currency enum is specified
    if (currency != null) {
      currencyInfo = CurrencyConfig.getCurrencyFromEnum(currency);
      if (currencyInfo == null) {
        throw ArgumentError('Currency "${currency.code}" not found in configuration');
      }
    }
    // If currencyCode is specified
    else if (currencyCode != null) {
      currencyInfo = CurrencyConfig.getCurrency(currencyCode);
      if (currencyInfo == null) {
        throw ArgumentError('Currency "$currencyCode" not found in configuration');
      }
    }
    // Use default currency
    else if (_defaultCurrency != null) {
      currencyInfo = CurrencyConfig.getCurrencyFromEnum(_defaultCurrency!);
    }

    // Determine prefix and suffix
    String actualPrefix = prefix ?? '';
    String actualSuffix = suffix ?? '';

    // Convert based on language
    switch (selectedLang) {
      case Language.ar:
        return ArabicConverter.convert(
          number,
          currencyInfo,
          prefix: actualPrefix,
          suffix: actualSuffix,
        );
      case Language.en:
        return EnglishConverter.convert(
          number,
          currencyInfo,
          prefix: actualPrefix,
          suffix: actualSuffix,
        );
    }
  }

  /// Reset settings to default values
  static void reset() {
    _defaultLanguage = Language.ar;
    _defaultCurrency = null;
    CurrencyConfig.reset();
  }

  /// Get the current default language
  static Language get defaultLang => _defaultLanguage;

  /// Get the current default currency
  static Currency? get defaultCurrency => _defaultCurrency;
}

