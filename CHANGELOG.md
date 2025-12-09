# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-12-09

### 🎉 Initial Release

First stable release of Tafkeet - A comprehensive Flutter package for converting numbers to words in Arabic and English.

### ✨ Features

#### Core Functionality
- **Number to Words Conversion**: Convert numbers to words in Arabic and English
- **Dual Language Support**: Full support for Arabic (`Lang.ar`) and English (`Lang.en`)
- **Large Number Support**: Handle numbers up to trillions
- **Decimal Support**: Convert decimal numbers with automatic rounding based on currency precision (`partPrecision`)
- **Gender-Aware**: Correct masculine/feminine handling based on currency type

#### Currency Support
- **90+ World Currencies**: Support for over 90 currencies from around the world
- **21 Arabic Currencies**: SAR, AED, KWD, QAR, OMR, BHD, EGP, SYP, JOD, LBP, IQD, YER, LYD, TND, DZD, MAD, SDG, SOS, MRU, DJF, KMF
- **Major World Currencies**: USD, EUR, GBP, JPY, CHF, CAD, AUD, NZD, CNY, INR, RUB, BRL, ZAR, SEK, NOK, DKK, PLN, TRY, and more
- **Custom Currency Support**: Add, update, or remove custom currencies
- **Currency Groups**: `Currency.arabicCurrencies` and `Currency.majorCurrencies` getters

#### API & Extensions
- **Simple API**: `Tafkeet.convert(number, lang: Lang.ar, currency: Currency.SAR)`
- **Type Extensions**: Convert numbers directly with `.tafkeet()` method
  - `double` extension: `120.5.tafkeet(lang: Lang.ar)`
  - `int` extension: `250.tafkeet(lang: Lang.en)`
  - `String` extension: `'75.25'.tafkeet()` with automatic number validation
- **Configuration**: `Tafkeet.configure()` for setting default language and currency
- **Custom Prefix/Suffix**: Add custom text before and after converted numbers

#### Currency Management
- `CurrencyConfig.addCurrency()` - Add custom currencies
- `CurrencyConfig.updateCurrency()` - Update existing currency settings
- `CurrencyConfig.removeCurrency()` - Remove currencies
- `CurrencyConfig.getCurrency()` - Get currency information
- `CurrencyConfig.hasCurrency()` - Check if currency exists
- `CurrencyConfig.getAllCurrencies()` - Get all available currencies
- `CurrencyConfig.reset()` - Reset to default configuration

#### Developer Experience
- **Well-Organized Structure**: Clean folder structure with separate modules
- **Comprehensive Documentation**: Full English documentation with examples
- **Type Safety**: Strong typing with enums for languages and currencies
- **Extensible**: Easy to add new languages or currencies
- **Tested**: Full test coverage with 13+ unit tests

### 📦 Package Structure

```
lib/
├── tafkeet.dart                 # Main entry point
├── tafkeet/
│   ├── tafkeet.dart            # Core conversion class
│   ├── models/
│   │   ├── language.dart       # Language enum (Lang.ar, Lang.en)
│   │   ├── currency.dart       # Currency enum (90+ currencies)
│   │   └── currency_info.dart  # Currency information model
│   ├── config/
│   │   └── currency_config.dart # Currency configuration manager
│   ├── converters/
│   │   ├── arabic_converter.dart  # Arabic number conversion logic
│   │   └── english_converter.dart # English number conversion logic
│   ├── extensions/
│   │   ├── double_extension.dart  # Extension on double
│   │   ├── int_extension.dart     # Extension on int
│   │   └── string_extension.dart  # Extension on String
│   └── utils/
│       └── number_utils.dart      # Number utility functions
```

### 🔧 Technical Details

- **Minimum SDK**: Dart 3.0.0
- **Flutter**: 1.17.0 or higher
- **License**: MIT
- **Code Quality**: All code comments in English
- **Documentation**: Complete README.md with usage examples

### 📝 Examples

```dart
// Basic conversion
Tafkeet.convert(120, lang: Lang.ar);

// With currency
Tafkeet.convert(250.50, lang: Lang.ar, currency: Currency.SAR);

// Using extensions
120.tafkeet(lang: Lang.ar);
'75.25'.tafkeet(currency: Currency.USD);

// Configure defaults
Tafkeet.configure(defaultLang: Lang.ar, defaultCurrency: Currency.SAR);

// Decimal rounding (automatic based on partPrecision)
Tafkeet.convert(19002.989, lang: Lang.ar, currency: Currency.SAR);
// 19002.989 → rounded to 19002.99 (2 decimal places)
// Result: تسعة عشر ألف و اثنان ريال سعودي و تسعة و تسعون هللة فقط لا غير
```

### 🌍 Supported Languages

- Arabic (ar) - العربية
- English (en)

### 💰 Currency Support

- **Total**: 91 currencies
- **Arabic**: 21 currencies
- **Major**: 10+ major world currencies
- **Custom**: Unlimited custom currencies via configuration

---

## Future Plans

- Add more languages (French, Spanish, etc.)
- Add more currency configurations
- Improve performance for very large numbers
- Add more customization options
