# Tafkeet - تفقيط

A Flutter package for converting numbers to words in Arabic and English with currency support.

## Features

- ✅ Convert numbers to words in Arabic and English
- ✅ Support for 90+ world currencies
- ✅ Custom currency support
- ✅ Large number support (up to trillions)
- ✅ Decimal number support with automatic rounding based on currency precision
- ✅ Gender-aware conversion (masculine/feminine)
- ✅ Custom prefix and suffix
- ✅ Extensions on `double`, `int`, and `String`
- ✅ Extensible for more languages

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  tafkeet: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

### Simple Example

```dart
import 'package:tafkeet/tafkeet.dart';

void main() {
  // تحويل رقم إلى العربية
  print(Tafkeet.convert(120, lang: Lang.ar));
  // النتيجة: مائة و عشرون فقط لا غير

  // تحويل رقم إلى الإنجليزية
  print(Tafkeet.convert(120, lang: Lang.en));
  // النتيجة: One Hundred Twenty only
}
```

### Using Currencies

```dart
// تحويل مبلغ بالريال السعودي
print(Tafkeet.convert(250.50, lang: Lang.ar, currency: Currency.SAR));
// النتيجة: مئتان و خمسون ريالاً سعودياً و خمسون هللة فقط لا غير

// تحويل مبلغ بالدولار الأمريكي
print(Tafkeet.convert(100, lang: Lang.en, currency: Currency.USD));
// النتيجة: One Hundred US Dollars only
```

**Note:** Decimal numbers are automatically rounded based on the currency's precision (defined by `partPrecision`). Most currencies use 2 decimal places, but some like Bitcoin can support up to 8 decimal places.

```dart
// Example: 19002.989 will be rounded to 2 decimal places (99) for most currencies
print(Tafkeet.convert(19002.989, lang: Lang.ar, currency: Currency.SAR));
// Result: تسعة عشر ألف و اثنان ريال سعودي و تسعة و تسعون هللة فقط لا غير
```

### Configure Default Settings

```dart
// تحديد اللغة والعملة الافتراضية
Tafkeet.configure(
  defaultLang: Lang.ar,
  defaultCurrency: Currency.SAR,
);

// الآن يمكن استخدام convert بدون تحديد اللغة والعملة
print(Tafkeet.convert(100));
// النتيجة: مائة ريال سعودي فقط لا غير
```

### Using Available Currencies

All currencies in the `Currency` enum can be used directly:

```dart
// استخدام الجنيه المصري (موجود مسبقاً)
print(Tafkeet.convert(50, lang: Lang.ar, currency: Currency.EGP));
// النتيجة: خمسون جنيهاً مصرياً فقط لا غير

// استخدام الدينار الكويتي
print(Tafkeet.convert(100, lang: Lang.ar, currency: Currency.KWD));

// استخدام اليورو
print(Tafkeet.convert(200, lang: Lang.ar, currency: Currency.EUR));
```

### Customize Existing Currency

If you want to customize an existing currency (e.g., change part names):

```dart
CurrencyConfig.updateCurrency(
  'EGP',
  CurrencyInfo(
    currencyId: 10,
    currencyCode: 'EGP',
    isCurrencyNameFeminine: false,
    englishCurrencyName: 'Egyptian Pound',
    englishPluralCurrencyName: 'Egyptian Pounds',
    englishCurrencyPartName: 'Piaster',
    englishPluralCurrencyPartName: 'Piasters',
    arabic1CurrencyName: 'جنيه مصري',
    arabic2CurrencyName: 'جنيهان مصريان',
    arabic310CurrencyName: 'جنيهات مصرية',
    arabic1199CurrencyName: 'جنيهاً مصرياً',
    arabic1CurrencyPartName: 'قرش',
    arabic2CurrencyPartName: 'قرشان',
    arabic310CurrencyPartName: 'قروش',
    arabic1199CurrencyPartName: 'قرشاً',
    partPrecision: 2,
    isCurrencyPartNameFeminine: false,
  ),
);

// الآن استخدم العملة المخصصة
print(Tafkeet.convert(50, lang: Lang.ar, currency: Currency.EGP));
```

### Add New Currency

If you want to add a currency that's not in the `Currency` enum:

```dart
CurrencyConfig.addCurrency(
  'BTC',
  CurrencyInfo(
    currencyId: 999,
    currencyCode: 'BTC',
    isCurrencyNameFeminine: false,
    englishCurrencyName: 'Bitcoin',
    englishPluralCurrencyName: 'Bitcoins',
    englishCurrencyPartName: 'Satoshi',
    englishPluralCurrencyPartName: 'Satoshi',
    arabic1CurrencyName: 'بيتكوين',
    arabic2CurrencyName: 'بيتكوينان',
    arabic310CurrencyName: 'بيتكوينات',
    arabic1199CurrencyName: 'بيتكويناً',
    arabic1CurrencyPartName: 'ساتوشي',
    arabic2CurrencyPartName: 'ساتوشيان',
    arabic310CurrencyPartName: 'ساتوشيات',
    arabic1199CurrencyPartName: 'ساتوشياً',
    partPrecision: 8,
    isCurrencyPartNameFeminine: false,
  ),
);

// استخدام العملة المخصصة بالرمز
print(Tafkeet.convert(3, lang: Lang.ar, currencyCode: 'BTC'));
// النتيجة: ثلاثة بيتكوينات فقط لا غير
```

### Using Custom Prefix and Suffix

```dart
print(Tafkeet.convert(
  500,
  lang: Lang.ar,
  currency: Currency.SAR,
  prefix: 'المبلغ:',
  suffix: 'لا غير',
));
// النتيجة: المبلغ: خمسمائة ريال سعودي لا غير
```

## Using Extensions

The package provides useful extensions to convert numbers directly to words in an easier and shorter way:

### Extension on Double

```dart
// استخدام extension على double
120.5.tafkeet(lang: Lang.ar);
// النتيجة: مائة و عشرون و خمسون فقط لا غير

// مع عملة
250.75.tafkeet(lang: Lang.ar, currency: Currency.SAR);
// النتيجة: مئتان و خمسون ريالاً سعودياً و خمسة و سبعون هللة فقط لا غير
```

### Extension on Int

```dart
// استخدام extension على int
100.tafkeet(lang: Lang.en);
// النتيجة: One Hundred only

// مع عملة
500.tafkeet(lang: Lang.ar, currency: Currency.USD);
// النتيجة: خمسمائة دولار أمريكي فقط لا غير
```

### Extension on String

```dart
// استخدام extension على string (إذا كان النص رقمياً)
'75.25'.tafkeet(lang: Lang.ar);
// النتيجة: خمسة و سبعون و خمسة و عشرون فقط لا غير

// إذا كان النص غير رقمي، يُرجع النص الأصلي
'Hello World'.tafkeet(lang: Lang.ar);
// النتيجة: Hello World

// مع عملة
'1000'.tafkeet(lang: Lang.en, currency: Currency.EUR);
// النتيجة: One Thousand Euros only
```

### Comprehensive Extension Example

```dart
void main() {
  // تهيئة الإعدادات الافتراضية
  Tafkeet.configure(defaultLang: Lang.ar, defaultCurrency: Currency.SAR);
  
  // استخدام مع أنواع مختلفة
  final double amount1 = 123.45;
  final int amount2 = 200;
  final String amount3 = '350.75';
  final String text = 'not a number';
  
  print(amount1.tafkeet());  // يستخدم الإعدادات الافتراضية
  print(amount2.tafkeet(lang: Lang.en));
  print(amount3.tafkeet(currency: Currency.EGP));
  print(text.tafkeet());  // يُرجع: not a number
}
```

### Benefits of Using Extensions

- ✅ **Shorter and clearer code**: Instead of `Tafkeet.convert(120)` you can write `120.tafkeet()`
- ✅ **Better readability**: Code becomes more natural and easy to read
- ✅ **String support**: Convert numeric text directly, with protection from non-numeric text
- ✅ **Full flexibility**: Same parameters available in `Tafkeet.convert()`

## Supported Currencies

### 90+ World Currencies!

The package supports **more than 90 currencies** from around the world:

#### Arabic Currencies (21 currencies)
SAR, AED, KWD, QAR, OMR, BHD, EGP, SYP, JOD, LBP, IQD, YER, LYD, TND, DZD, MAD, SDG, SOS, MRU, DJF, KMF

#### Major World Currencies
USD, EUR, GBP, JPY, CHF, CAD, AUD, NZD, CNY, INR, RUB, BRL, ZAR, SEK, NOK, DKK, PLN, TRY, IDR, MYR, THB, PHP, SGD, HKD, KRW, MXN, and more...

### Usage Examples

| Enum | Code | Arabic Name | English Name | Usage |
|------|------|-------------|--------------|-------|
| `Currency.SAR` | SAR  | ريال سعودي   | Saudi Riyal     | `Tafkeet.convert(100, currency: Currency.SAR)` |
| `Currency.EGP` | EGP  | جنيه مصري | Egyptian Pound | `Tafkeet.convert(100, currency: Currency.EGP)` |
| `Currency.KWD` | KWD  | دينار كويتي | Kuwaiti Dinar | `Tafkeet.convert(100, currency: Currency.KWD)` |
| `Currency.EUR` | EUR  | يورو | Euro | `Tafkeet.convert(100, currency: Currency.EUR)` |
| `Currency.GBP` | GBP  | جنيه إسترليني | British Pound | `Tafkeet.convert(100, currency: Currency.GBP)` |

### Getting Currency Lists

```dart
// جميع العملات المدعومة
print('عدد العملات: ${Currency.values.length}'); // 91+

// العملات العربية فقط
for (final currency in Currency.arabicCurrencies) {
  print('${currency.code}: ${currency.arabicName}');
}

// العملات الرئيسية
for (final currency in Currency.majorCurrencies) {
  print('${currency.code}: ${currency.arabicName}');
}
```

## CurrencyConfig Functions

```dart
// إضافة عملة
CurrencyConfig.addCurrency(code, currencyInfo);

// تحديث عملة موجودة
CurrencyConfig.updateCurrency(code, currencyInfo);

// حذف عملة
CurrencyConfig.removeCurrency(code);

// الحصول على عملة
CurrencyInfo? currency = CurrencyConfig.getCurrency(code);

// التحقق من وجود عملة
bool exists = CurrencyConfig.hasCurrency(code);

// الحصول على جميع العملات
Map<String, CurrencyInfo> currencies = CurrencyConfig.getAllCurrencies();

// الحصول على رموز العملات المتاحة
List<String> codes = CurrencyConfig.getAvailableCurrencyCodes();

// إعادة تعيين إلى الإعدادات الافتراضية
CurrencyConfig.reset();
```

## Additional Examples

### Convert Large Numbers

```dart
print(Tafkeet.convert(1234567, lang: Lang.ar, currency: Currency.SAR));
// النتيجة: واحد مليون و مئتان و أربعة و ثلاثون ألف و خمسمائة و سبعة و ستون ريالاً سعودياً فقط لا غير
```

### Handle Feminine Currencies

```dart
// الليرة السورية (عملة مؤنثة)
print(Tafkeet.convert(200, lang: Lang.ar, currency: Currency.SYP));
// النتيجة: مئتا ليرة سورية فقط لا غير
```

### Decimal Rounding

The package automatically rounds decimal numbers based on the currency's `partPrecision` setting:

```dart
// Most currencies use 2 decimal places
print(Tafkeet.convert(19002.989, lang: Lang.ar, currency: Currency.SAR));
// 19002.989 → rounded to 19002.99
// Result: تسعة عشر ألف و اثنان ريال سعودي و تسعة و تسعون هللة فقط لا غير

print(Tafkeet.convert(19002.989, lang: Lang.en, currency: Currency.USD));
// Result: Nineteen Thousand Two US Dollars and Ninety Nine Cents only

// Bitcoin supports up to 8 decimal places
CurrencyConfig.addCurrency('BTC', CurrencyInfo(
  // ... with partPrecision: 8
));
print(Tafkeet.convert(0.12345678, lang: Lang.en, currencyCode: 'BTC'));
// All 8 decimal places preserved
```

## Supported Languages

The package currently supports two languages with the ability to extend to other languages:

| Code | Name | Description | Usage |
|------|------|-------------|-------|
| `Lang.ar` | العربية | Arabic | `Tafkeet.convert(120, lang: Lang.ar)` |
| `Lang.en` | English | English | `Tafkeet.convert(120, lang: Lang.en)` |

### Language Usage Example

```dart
// استخدام العربية
print(Tafkeet.convert(1250, lang: Lang.ar, currency: Currency.SAR));
// النتيجة: واحد ألف و مئتان و خمسون ريالاً سعودياً فقط لا غير

// استخدام الإنجليزية
print(Tafkeet.convert(1250, lang: Lang.en, currency: Currency.SAR));
// النتيجة: One Thousand Two Hundred Fifty Saudi Riyals only

// بدون تحديد اللغة (يستخدم الافتراضي)
Tafkeet.configure(defaultLang: Lang.ar, defaultCurrency: Currency.SAR);
print(Tafkeet.convert(1250));
```

## License

This project is licensed under the MIT License.

## Contributing

Contributions are welcome! Please open an issue or pull request on GitHub.

## Support

If you encounter any issues or have suggestions, please open an issue on GitHub.
