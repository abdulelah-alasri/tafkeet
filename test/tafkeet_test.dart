import 'package:flutter_test/flutter_test.dart';
import 'package:tafkeet/tafkeet.dart';

void main() {
  group('Tafkeet Tests', () {
    test('Convert simple number to Arabic', () {
      final result = Tafkeet.convert(120, lang: Lang.ar);
      expect(result, contains('مائة'));
      expect(result, contains('عشرون'));
    });

    test('Convert simple number to English', () {
      final result = Tafkeet.convert(120, lang: Lang.en);
      expect(result, contains('One Hundred'));
      expect(result, contains('Twenty'));
    });

    test('Convert number with currency in Arabic', () {
      Tafkeet.configure(defaultCurrency: Currency.SAR);
      final result =
          Tafkeet.convert(100, lang: Lang.ar, currency: Currency.SAR);
      expect(result, contains('ريال'));
    });

    test('Convert number with currency in English', () {
      final result =
          Tafkeet.convert(100, lang: Lang.en, currency: Currency.SAR);
      expect(result, contains('Riyal'));
    });

    test('Add custom currency', () {
      CurrencyConfig.addCurrency(
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

      expect(CurrencyConfig.hasCurrency('EGP'), true);
      final currency = CurrencyConfig.getCurrency('EGP');
      expect(currency?.currencyCode, 'EGP');
    });

    test('Get all currencies', () {
      final currencies = CurrencyConfig.getAllCurrencies();
      expect(currencies.isNotEmpty, true);
      expect(currencies.containsKey('SAR'), true);
      expect(currencies.containsKey('AED'), true);
      expect(currencies.containsKey('USD'), true);
    });

    test('Use Currency enum', () {
      final result =
          Tafkeet.convert(150, lang: Lang.ar, currency: Currency.YER);
      expect(result, contains('ريال'));
      expect(result, contains('يمني'));
    });

    test('Configure default language', () {
      Tafkeet.configure(defaultLang: Lang.en);
      expect(Tafkeet.defaultLang, Lang.en);

      Tafkeet.configure(defaultLang: Lang.ar);
      expect(Tafkeet.defaultLang, Lang.ar);
    });

    test('Double extension', () {
      final result = 120.5.tafkeet(lang: Lang.ar);
      expect(result, contains('مائة'));
      expect(result, contains('عشرون'));
    });

    test('Int extension', () {
      final result = 250.tafkeet(lang: Lang.en);
      expect(result, contains('Two Hundred'));
      expect(result, contains('Fifty'));
    });

    test('String extension with valid number', () {
      final result = '75.25'.tafkeet(lang: Lang.ar);
      expect(result, contains('خمسة'));
      expect(result, contains('سبعون'));
    });

    test('String extension with invalid number returns original', () {
      final result = 'Hello World'.tafkeet(lang: Lang.ar);
      expect(result, equals('Hello World'));
    });

    test('String extension with non-numeric text', () {
      final result = 'Not a number'.tafkeet(lang: Lang.en);
      expect(result, equals('Not a number'));
    });

    test('Replace Arabic numerals with English numerals', () {
      final result = NumberUtils.replaceArabicNumber('١٢٣');
      expect(result, equals('123'));
    });

    test('Replace Arabic numerals in decimal number', () {
      final result = NumberUtils.replaceArabicNumber('١٢٣.٤٥');
      expect(result, equals('123.45'));
    });

    test('Replace Arabic numerals in mixed text', () {
      final result = NumberUtils.replaceArabicNumber('السعر: ٩٩٩ ريال');
      expect(result, equals('السعر: 999 ريال'));
    });

    test('String extension replaceArabicNumbers', () {
      final result = '٥٠٠'.replaceArabicNumbers();
      expect(result, equals('500'));
    });

    test('String extension tafkeet with Arabic numerals', () {
      final result = '١٢٠'.tafkeet(lang: Lang.ar);
      expect(result, contains('مائة'));
      expect(result, contains('عشرون'));
    });

    test('String extension tafkeet with Arabic decimal numerals', () {
      final result = '١٢٣.٤٥'.tafkeet(lang: Lang.ar, currency: Currency.SAR);
      expect(result, contains('مائة'));
      expect(result, contains('عشرون'));
      expect(result, contains('ريال'));
    });

    test('NumberUtils replaceArabicNumber with all digits', () {
      final result = NumberUtils.replaceArabicNumber('٠١٢٣٤٥٦٧٨٩');
      expect(result, equals('0123456789'));
    });

    test('String extension replaceArabicNumbers with mixed content', () {
      final result = 'الرقم: ٩٨٧.٦٥ريال'.replaceArabicNumbers();
      expect(result, equals('الرقم: 987.65ريال'));
    });

    test('NumberUtils amountFormat with integer', () {
      final result = NumberUtils.amountFormat(1234567);
      expect(result, equals('1,234,567'));
    });

    test('NumberUtils amountFormat with decimal', () {
      final result = NumberUtils.amountFormat(1234567.89, digit: 2);
      expect(result, equals('1,234,567.89'));
    });

    test('NumberUtils amountFormat with string', () {
      final result = NumberUtils.amountFormat('9999.5', digit: 2);
      expect(result, equals('9,999.50'));
    });

    test('NumberUtils amountFormat with small number', () {
      final result = NumberUtils.amountFormat(1000);
      expect(result, equals('1,000'));
    });

    test('Double extension amountFormat', () {
      final result = 1234567.89.amountFormat(digit: 2);
      expect(result, equals('1,234,567.89'));
    });

    test('Int extension amountFormat', () {
      final result = 1234567.amountFormat();
      expect(result, equals('1,234,567'));
    });

    test('String extension amountFormat with valid number', () {
      final result = '1234567.89'.amountFormat(digit: 2);
      expect(result, equals('1,234,567.89'));
    });

    test('String extension amountFormat with Arabic numerals', () {
      final result = '١٢٣٤٥٦٧'.amountFormat();
      expect(result, equals('1,234,567'));
    });

    test('String extension amountFormat with invalid number', () {
      final result = 'not a number'.amountFormat();
      expect(result, equals('not a number'));
    });

    test('amountFormat with zero decimals', () {
      final result = NumberUtils.amountFormat(1234567.0);
      expect(result, equals('1,234,567'));
    });

    test('amountFormat with large number', () {
      final result = NumberUtils.amountFormat(1234567890.12, digit: 2);
      expect(result, equals('1,234,567,890.12'));
    });

    // Tests for thousands conversion fix (1000, 2000, etc.)
    test('Convert 1000 to Arabic should be "ألف" not "واحد ألف"', () {
      final result =
          Tafkeet.convert(1000, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('ألف ريال سعودي'));
      expect(result, isNot(contains('واحد')));
      expect(result, startsWith('ألف'));
    });

    test('Convert 1500 to Arabic should start with "ألف"', () {
      final result =
          Tafkeet.convert(1500, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('ألف و خمسمائة ريال سعودي'));
      expect(result, isNot(contains('واحد ألف')));
      expect(result, startsWith('ألف'));
    });

    test('Convert 1001 to Arabic should start with "ألف"', () {
      final result =
          Tafkeet.convert(1001, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('ألف و واحد ريال سعودي'));
      expect(result, isNot(contains('واحد ألف')));
      expect(result, startsWith('ألف'));
    });

    test('Convert 2000 to Arabic should be "ألفا" not "اثنان ألف"', () {
      final result =
          Tafkeet.convert(2000, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('ألفا ريال سعودي'));
      expect(result, isNot(contains('اثنان')));
      expect(result, startsWith('ألفا'));
    });

    test('Convert 2500 to Arabic should start with "ألفا"', () {
      final result =
          Tafkeet.convert(2500, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('ألفا و خمسمائة ريال سعودي'));
      expect(result, isNot(contains('اثنان ألف')));
      expect(result, startsWith('ألفا'));
    });

    test('Convert 3000 to Arabic should be "ثلاثة آلاف"', () {
      final result =
          Tafkeet.convert(3000, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('ثلاثة آلاف ريال سعودي'));
    });

    test('Convert 1000000 to Arabic should be "مليون" not "واحد مليون"', () {
      final result =
          Tafkeet.convert(1000000, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('مليون ريال سعودي'));
      expect(result, isNot(contains('واحد')));
      expect(result, startsWith('مليون'));
    });

    test('Convert 2000000 to Arabic should be "مليونا" not "اثنان مليون"', () {
      final result =
          Tafkeet.convert(2000000, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('مليونا ريال سعودي'));
      expect(result, isNot(contains('اثنان')));
      expect(result, startsWith('مليونا'));
    });

    test('Convert 3000000 to Arabic should be "ثلاثة ملايين"', () {
      final result =
          Tafkeet.convert(3000000, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('ثلاثة ملايين ريال سعودي'));
    });

    test('Convert 1001000 to Arabic should be "مليون و ألف"', () {
      final result =
          Tafkeet.convert(1001000, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('مليون و ألف ريال سعودي'));
      expect(result, isNot(contains('واحد مليون')));
      expect(result, isNot(contains('واحد ألف')));
    });

    test('Convert 2002000 to Arabic should be "مليونا و ألفا"', () {
      final result =
          Tafkeet.convert(2002000, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('مليونا و ألفا ريال سعودي'));
      expect(result, isNot(contains('اثنان')));
    });

    test('Convert 1234 to Arabic should work correctly', () {
      final result =
          Tafkeet.convert(1234, lang: Lang.ar, currency: Currency.SAR);
      expect(result, equals('ألف و مئتان و أربعة و ثلاثون ريالاً سعودياً'));
    });
  });
}
