import '../models/currency_info.dart';
import '../models/currency.dart';

/// Currency configuration management
class CurrencyConfig {
  static final Map<String, CurrencyInfo> _currencies = {};
  static bool _initialized = false;

  /// Initialize default currencies
  static void _initializeDefaultCurrencies() {
    if (_initialized) return;

    // Main Arabic currencies

    // Saudi Riyal
    _currencies['SAR'] = CurrencyInfo(
      currencyId: 1,
      currencyCode: 'SAR',
      isCurrencyNameFeminine: false,
      englishCurrencyName: 'Saudi Riyal',
      englishPluralCurrencyName: 'Saudi Riyals',
      englishCurrencyPartName: 'Halala',
      englishPluralCurrencyPartName: 'Halalas',
      arabic1CurrencyName: 'ريال سعودي',
      arabic2CurrencyName: 'ريالان سعوديان',
      arabic310CurrencyName: 'ريالات سعودية',
      arabic1199CurrencyName: 'ريالاً سعودياً',
      arabic1CurrencyPartName: 'هللة',
      arabic2CurrencyPartName: 'هللتان',
      arabic310CurrencyPartName: 'هللات',
      arabic1199CurrencyPartName: 'هللة',
      partPrecision: 2,
      isCurrencyPartNameFeminine: true,
    );

    // UAE Dirham
    _currencies['AED'] = CurrencyInfo(
      currencyId: 2,
      currencyCode: 'AED',
      isCurrencyNameFeminine: false,
      englishCurrencyName: 'UAE Dirham',
      englishPluralCurrencyName: 'UAE Dirhams',
      englishCurrencyPartName: 'Fils',
      englishPluralCurrencyPartName: 'Fils',
      arabic1CurrencyName: 'درهم إماراتي',
      arabic2CurrencyName: 'درهمان إماراتيان',
      arabic310CurrencyName: 'دراهم إماراتية',
      arabic1199CurrencyName: 'درهماً إماراتياً',
      arabic1CurrencyPartName: 'فلس',
      arabic2CurrencyPartName: 'فلسان',
      arabic310CurrencyPartName: 'فلوس',
      arabic1199CurrencyPartName: 'فلساً',
      partPrecision: 2,
      isCurrencyPartNameFeminine: false,
    );

    // US Dollar
    _currencies['USD'] = CurrencyInfo(
      currencyId: 3,
      currencyCode: 'USD',
      isCurrencyNameFeminine: false,
      englishCurrencyName: 'US Dollar',
      englishPluralCurrencyName: 'US Dollars',
      englishCurrencyPartName: 'Cent',
      englishPluralCurrencyPartName: 'Cents',
      arabic1CurrencyName: 'دولار أمريكي',
      arabic2CurrencyName: 'دولاران أمريكيان',
      arabic310CurrencyName: 'دولارات أمريكية',
      arabic1199CurrencyName: 'دولاراً أمريكياً',
      arabic1CurrencyPartName: 'سنت',
      arabic2CurrencyPartName: 'سنتان',
      arabic310CurrencyPartName: 'سنتات',
      arabic1199CurrencyPartName: 'سنتاً',
      partPrecision: 2,
      isCurrencyPartNameFeminine: false,
    );

    // Syrian Pound
    _currencies['SYP'] = CurrencyInfo(
      currencyId: 4,
      currencyCode: 'SYP',
      isCurrencyNameFeminine: true,
      englishCurrencyName: 'Syrian Pound',
      englishPluralCurrencyName: 'Syrian Pounds',
      englishCurrencyPartName: 'Piaster',
      englishPluralCurrencyPartName: 'Piasters',
      arabic1CurrencyName: 'ليرة سورية',
      arabic2CurrencyName: 'ليرتان سوريتان',
      arabic310CurrencyName: 'ليرات سورية',
      arabic1199CurrencyName: 'ليرة سورية',
      arabic1CurrencyPartName: 'قرش',
      arabic2CurrencyPartName: 'قرشان',
      arabic310CurrencyPartName: 'قروش',
      arabic1199CurrencyPartName: 'قرشاً',
      partPrecision: 2,
      isCurrencyPartNameFeminine: false,
    );

    // Yemeni Riyal
    _currencies['YER'] = CurrencyInfo(
      currencyId: 5,
      currencyCode: 'YER',
      isCurrencyNameFeminine: false,
      englishCurrencyName: 'Yemeni Riyal',
      englishPluralCurrencyName: 'Yemeni Riyals',
      englishCurrencyPartName: 'Fils',
      englishPluralCurrencyPartName: 'Fils',
      arabic1CurrencyName: 'ريال يمني',
      arabic2CurrencyName: 'ريالان يمنيان',
      arabic310CurrencyName: 'ريالات يمنية',
      arabic1199CurrencyName: 'ريالاً يمنياً',
      arabic1CurrencyPartName: 'فلس',
      arabic2CurrencyPartName: 'فلسان',
      arabic310CurrencyPartName: 'فلوس',
      arabic1199CurrencyPartName: 'فلساً',
      partPrecision: 2,
      isCurrencyPartNameFeminine: false,
    );

    // Egyptian Pound
    _currencies['EGP'] = CurrencyInfo(
      currencyId: 6,
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
    );

    // Kuwaiti Dinar
    _currencies['KWD'] = CurrencyInfo(
      currencyId: 7,
      currencyCode: 'KWD',
      isCurrencyNameFeminine: false,
      englishCurrencyName: 'Kuwaiti Dinar',
      englishPluralCurrencyName: 'Kuwaiti Dinars',
      englishCurrencyPartName: 'Fils',
      englishPluralCurrencyPartName: 'Fils',
      arabic1CurrencyName: 'دينار كويتي',
      arabic2CurrencyName: 'ديناران كويتيان',
      arabic310CurrencyName: 'دنانير كويتية',
      arabic1199CurrencyName: 'ديناراً كويتياً',
      arabic1CurrencyPartName: 'فلس',
      arabic2CurrencyPartName: 'فلسان',
      arabic310CurrencyPartName: 'فلوس',
      arabic1199CurrencyPartName: 'فلساً',
      partPrecision: 3,
      isCurrencyPartNameFeminine: false,
    );

    // Jordanian Dinar
    _currencies['JOD'] = CurrencyInfo(
      currencyId: 8,
      currencyCode: 'JOD',
      isCurrencyNameFeminine: false,
      englishCurrencyName: 'Jordanian Dinar',
      englishPluralCurrencyName: 'Jordanian Dinars',
      englishCurrencyPartName: 'Piaster',
      englishPluralCurrencyPartName: 'Piasters',
      arabic1CurrencyName: 'دينار أردني',
      arabic2CurrencyName: 'ديناران أردنيان',
      arabic310CurrencyName: 'دنانير أردنية',
      arabic1199CurrencyName: 'ديناراً أردنياً',
      arabic1CurrencyPartName: 'قرش',
      arabic2CurrencyPartName: 'قرشان',
      arabic310CurrencyPartName: 'قروش',
      arabic1199CurrencyPartName: 'قرشاً',
      partPrecision: 2,
      isCurrencyPartNameFeminine: false,
    );

    _initialized = true;
  }

  /// Add a new currency
  static void addCurrency(String code, CurrencyInfo currency) {
    _initializeDefaultCurrencies();
    _currencies[code.toUpperCase()] = currency;
  }

  /// Update an existing currency
  static void updateCurrency(String code, CurrencyInfo currency) {
    _initializeDefaultCurrencies();
    final upperCode = code.toUpperCase();
    if (!_currencies.containsKey(upperCode)) {
      throw ArgumentError('Currency "$code" not found');
    }
    _currencies[upperCode] = currency;
  }

  /// Remove a currency
  static void removeCurrency(String code) {
    _initializeDefaultCurrencies();
    _currencies.remove(code.toUpperCase());
  }

  /// Get a currency by code
  static CurrencyInfo? getCurrency(String code) {
    _initializeDefaultCurrencies();
    return _currencies[code.toUpperCase()];
  }

  /// Get a currency from enum
  static CurrencyInfo? getCurrencyFromEnum(Currency currency) {
    _initializeDefaultCurrencies();

    // If the currency exists in configuration, return it
    if (_currencies.containsKey(currency.code)) {
      return _currencies[currency.code];
    }

    // If not found, generate default information
    return _generateDefaultCurrencyInfo(currency);
  }

  /// Generate default currency information from Currency enum
  static CurrencyInfo _generateDefaultCurrencyInfo(Currency currency) {
    return CurrencyInfo(
      currencyId: 0,
      currencyCode: currency.code,
      isCurrencyNameFeminine: false,
      englishCurrencyName: currency.englishName,
      englishPluralCurrencyName: '${currency.englishName}s',
      englishCurrencyPartName: 'Cent',
      englishPluralCurrencyPartName: 'Cents',
      arabic1CurrencyName: currency.arabicName,
      arabic2CurrencyName: '${currency.arabicName}ان',
      arabic310CurrencyName: '${currency.arabicName}ات',
      arabic1199CurrencyName: '${currency.arabicName}اً',
      arabic1CurrencyPartName: 'سنت',
      arabic2CurrencyPartName: 'سنتان',
      arabic310CurrencyPartName: 'سنتات',
      arabic1199CurrencyPartName: 'سنتاً',
      partPrecision: 2,
      isCurrencyPartNameFeminine: false,
    );
  }

  /// Get all currencies
  static Map<String, CurrencyInfo> getAllCurrencies() {
    _initializeDefaultCurrencies();
    return Map.unmodifiable(_currencies);
  }

  /// Check if a currency exists
  static bool hasCurrency(String code) {
    _initializeDefaultCurrencies();
    return _currencies.containsKey(code.toUpperCase());
  }

  /// Reset currencies to default values
  static void reset() {
    _currencies.clear();
    _initialized = false;
    _initializeDefaultCurrencies();
  }

  /// Get list of available currency codes
  static List<String> getAvailableCurrencyCodes() {
    _initializeDefaultCurrencies();
    return _currencies.keys.toList();
  }
}
