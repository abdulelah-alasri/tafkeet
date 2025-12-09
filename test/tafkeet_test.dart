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
  });
}
