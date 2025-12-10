# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.1] - 2025-12-09

### 🔄 Changed

- **Default Prefix and Suffix**: Changed default values for `prefix` and `suffix` parameters to empty strings (`''`) instead of `'فقط لا غير'` (Arabic) and `'only'` (English)
  - This gives users full control over prefix and suffix text
  - Users can now add custom prefix/suffix only when needed
  - All examples in README updated to reflect this change

### 📚 Documentation

- Updated all examples in README.md to show empty default prefix/suffix
- Added clarification that prefix and suffix are empty by default
- Updated example outputs to remove default suffix text

---

## [1.2.0] - 2025-12-09

### ✨ New Features

#### Arabic-Indic Numerals Support
- **Automatic Conversion**: String extension now automatically converts Arabic-Indic digits (٠١٢٣٤٥٦٧٨٩) to Western digits
- **`replaceArabicNumber()`**: New static method in `NumberUtils` to convert Arabic numerals to English
- **`replaceArabicNumbers()`**: New extension on `String` for easy numeral conversion
- Works seamlessly with `tafkeet()` - Arabic numerals are automatically handled

```dart
'١٢٣'.tafkeet(lang: Lang.ar); // Automatically converts and processes
'٥٠٠'.replaceArabicNumbers(); // Returns: '500'
NumberUtils.replaceArabicNumber('السعر: ٩٩٩'); // Returns: 'السعر: 999'
```

#### Number Formatting
- **`amountFormat()`**: New method to format numbers with thousand separators (commas)
- **Extensions on all numeric types**: Available on `double`, `int`, and `String`
- **Decimal Precision Control**: Use `digit` parameter to control decimal places
- **Arabic Numerals Support**: Works with both Western and Arabic-Indic digits
- **Smart Validation**: Returns original string if input is not a valid number

```dart
// Format with thousand separators
1234567.amountFormat(); // Returns: '1,234,567'
1234567.89.amountFormat(digit: 2); // Returns: '1,234,567.89'

// Works with strings and Arabic numerals
'١٢٣٤٥٦٧'.amountFormat(); // Returns: '1,234,567'
'1234567.89'.amountFormat(digit: 2); // Returns: '1,234,567.89'

// Combine with tafkeet
final amount = 1234567.89;
print(amount.amountFormat(digit: 2)); // 1,234,567.89
print(amount.tafkeet(lang: Lang.ar, currency: Currency.SAR));
```

### 📚 Documentation

- Added comprehensive documentation for Arabic-Indic numerals support in README
- Added "Number Formatting" section with examples
- Updated all examples to showcase new features
- Added 7 new examples in `example/main.dart` (Examples 24-30)

### 🧪 Testing

- Added 11 new unit tests for `amountFormat()` functionality
- Added 8 new unit tests for Arabic numerals conversion
- Total test count: **32 tests** (all passing ✅)

### 📦 Package Updates

- Updated package description
- Package size: 21 KB (compressed)
- All code comments and documentation in English

---

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
  - **Arabic-Indic Numerals Support**: Automatically converts Arabic numerals (٠١٢٣٤٥٦٧٨٩) in String extension
- **Arabic Numerals Replacement**: 
  - `NumberUtils.replaceArabicNumber()` - Convert Arabic-Indic digits to Western digits
  - `String.replaceArabicNumbers()` extension - Convert numerals directly on strings
- **Number Formatting**:
  - `NumberUtils.amountFormat()` - Format numbers with thousand separators (commas)
  - `.amountFormat()` extension on `double`, `int`, and `String` - Format numbers directly
  - Supports decimal precision control with `digit` parameter
  - Works with Arabic-Indic numerals
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

// Arabic-Indic numerals support
'١٢٣'.tafkeet(lang: Lang.ar); // Automatically converts ١٢٣ to 123
'٥٠٠'.replaceArabicNumbers(); // Returns: '500'

// Number formatting with thousand separators
1234567.amountFormat(); // Returns: '1,234,567'
1234567.89.amountFormat(digit: 2); // Returns: '1,234,567.89'
'١٢٣٤٥٦٧'.amountFormat(); // Returns: '1,234,567'

// Configure defaults
Tafkeet.configure(defaultLang: Lang.ar, defaultCurrency: Currency.SAR);

// Decimal rounding (automatic based on partPrecision)
Tafkeet.convert(19002.989, lang: Lang.ar, currency: Currency.SAR);
// 19002.989 → rounded to 19002.99 (2 decimal places)
// Result: تسعة عشر ألف و اثنان ريال سعودي و تسعة و تسعون هللة
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
