import 'package:tafkeet/tafkeet.dart';

void main() {
  print('===== Tafkeet Package Examples =====\n');

  // Example 1: Convert simple number to Arabic
  print('1. Convert 120 to Arabic:');
  print(Tafkeet.convert(120, lang: Lang.ar));
  print('');

  // Example 2: Convert simple number to English
  print('2. Convert 120 to English:');
  print(Tafkeet.convert(120, lang: Lang.en));
  print('');

  // Example 3: Convert number with currency (Saudi Riyal)
  print('3. Convert 250.50 Saudi Riyal:');
  print(Tafkeet.convert(250.50, lang: Lang.ar, currency: Currency.SAR));
  print('');

  // Example 4: Convert number with currency in English
  print('4. Convert 100 USD in English:');
  print(Tafkeet.convert(100, lang: Lang.en, currency: Currency.USD));
  print('');

  // Example 5: Configure default currency
  print('5. Configure default currency (AED):');
  Tafkeet.configure(
    defaultLang: Lang.ar,
    defaultCurrency: Currency.AED,
  );
  print(Tafkeet.convert(75.25));
  print('');

  // Example 6: Using Egyptian Pound (available in Currency enum)
  print('6. Using Egyptian Pound:');
  print(
      '   Directly from enum: ${Tafkeet.convert(50, lang: Lang.ar, currency: Currency.EGP)}');
  print('');

  // Example 6.1: Customize existing currency settings (Egyptian Pound)
  print('6.1. Customize Egyptian Pound settings:');
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
  print(
      '   After customization: ${Tafkeet.convert(50, lang: Lang.ar, currency: Currency.EGP)}');
  print('');

  // Example 6.2: Add new custom currency (Bitcoin)
  print('6.2. Add new custom currency (Bitcoin):');
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
  // Use custom currency by code
  print('   ${Tafkeet.convert(3, lang: Lang.ar, currencyCode: 'BTC')}');
  print('');

  // Example 7: Using custom prefix and suffix
  print('7. Using custom prefix and suffix:');
  print(Tafkeet.convert(
    500,
    lang: Lang.ar,
    currency: Currency.SAR,
    prefix: 'Amount:',
    suffix: 'only',
  ));
  print('');

  // Example 8: Different currency examples
  print('8. Arabic and international currencies examples:');
  print(
      '   - SAR: ${Tafkeet.convert(100, lang: Lang.ar, currency: Currency.SAR)}');
  print(
      '   - KWD: ${Tafkeet.convert(100, lang: Lang.ar, currency: Currency.KWD)}');
  print(
      '   - EUR: ${Tafkeet.convert(100, lang: Lang.ar, currency: Currency.EUR)}');
  print(
      '   - GBP: ${Tafkeet.convert(100, lang: Lang.ar, currency: Currency.GBP)}');
  print('');

  // Example 9: Supported currencies statistics
  print('9. Currency statistics:');
  print('   Total supported currencies: ${Currency.values.length}');
  print('   Arabic currencies count: ${Currency.arabicCurrencies.length}');
  print('   Major currencies count: ${Currency.majorCurrencies.length}');
  print('');

  // Example 10: Large numbers
  print('10. Convert large numbers:');
  print(Tafkeet.convert(1234567, lang: Lang.ar, currency: Currency.SAR));
  print('');

  // Example 11: Syrian Pound (feminine currency)
  print('11. Convert amount in Syrian Pound (feminine currency):');
  print(Tafkeet.convert(200, lang: Lang.ar, currency: Currency.SYP));
  print('');

  // Example 12: Double extension
  print('12. Double extension:');
  print('   ${120.5.tafkeet(lang: Lang.ar)}');
  print('   ${120.5.tafkeet(lang: Lang.en)}');
  print('');

  // Example 13: Int extension
  print('13. Int extension:');
  print('   ${250.tafkeet(lang: Lang.ar)}');
  print('   ${250.tafkeet(lang: Lang.en)}');
  print('');

  // Example 14: Int with currency
  print('14. Int with currency:');
  print('   ${100.tafkeet(lang: Lang.ar, currency: Currency.SAR)}');
  print('   ${100.tafkeet(lang: Lang.en, currency: Currency.USD)}');
  print('');

  // Example 15: String with valid number
  print('15. String extension (valid number):');
  print('   ${'75.25'.tafkeet(lang: Lang.ar)}');
  print('   ${'75.25'.tafkeet(lang: Lang.en)}');
  print('');

  // Example 16: String with invalid number (returns original)
  print('16. String extension (invalid number - returns original):');
  print('   ${'Hello World'.tafkeet(lang: Lang.ar)}');
  print('   ${'Not a number'.tafkeet(lang: Lang.en)}');
  print('');

  // Example 17: String with currency
  print('17. String with currency (valid number):');
  print('   ${'500'.tafkeet(lang: Lang.ar, currency: Currency.EGP)}');
  print('   ${'500'.tafkeet(lang: Lang.en, currency: Currency.EUR)}');
  print('');

  // Example 18: Mixed types
  print('18. Mixed types:');
  final double doubleNum = 123.45;
  final int intNum = 200;
  final String stringNum = '350.75';
  final String nonNum = 'abc123';

  print('   Double: ${doubleNum.tafkeet(lang: Lang.ar)}');
  print('   Int: ${intNum.tafkeet(lang: Lang.ar)}');
  print('   String (valid): ${stringNum.tafkeet(lang: Lang.ar)}');
  print('   String (invalid): ${nonNum.tafkeet(lang: Lang.ar)}');
  print('');

  print('===== Examples Complete =====');
}
