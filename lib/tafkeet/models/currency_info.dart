/// Currency information
class CurrencyInfo {
  /// Currency ID
  final int currencyId;

  /// Standard currency code (e.g., SAR, AED, USD)
  final String currencyCode;

  /// Is the currency name feminine?
  /// Example: ليرة سورية (feminine = true), درهم (masculine = false)
  final bool isCurrencyNameFeminine;

  /// Currency name in English (singular)
  /// Example: Saudi Riyal
  final String englishCurrencyName;

  /// Currency name in English (plural)
  /// Example: Saudi Riyals
  final String englishPluralCurrencyName;

  /// Currency part name in English (singular)
  /// Example: Halala
  final String englishCurrencyPartName;

  /// Currency part name in English (plural)
  /// Example: Halalas
  final String englishPluralCurrencyPartName;

  /// Currency name in Arabic for one unit
  /// Example: ريال سعودي
  final String arabic1CurrencyName;

  /// Currency name in Arabic for two units
  /// Example: ريالان سعوديان
  final String arabic2CurrencyName;

  /// Currency name in Arabic for 3 to 10 units
  /// Example: ريالات سعودية
  final String arabic310CurrencyName;

  /// Currency name in Arabic for 11 to 99 units
  /// Example: ريالاً سعودياً
  final String arabic1199CurrencyName;

  /// Currency part name in Arabic for one unit
  /// Example: هللة
  final String arabic1CurrencyPartName;

  /// Currency part name in Arabic for two units
  /// Example: هللتان
  final String arabic2CurrencyPartName;

  /// Currency part name in Arabic for 3 to 10 units
  /// Example: هللات
  final String arabic310CurrencyPartName;

  /// Currency part name in Arabic for 11 to 99 units
  /// Example: هللةً
  final String arabic1199CurrencyPartName;

  /// Decimal part precision
  /// Example: For Saudi Riyal = 2 (1 Riyal = 100 Halalas)
  /// For Tunisian Dinar = 3 (1 Dinar = 1000 Millimes)
  final int partPrecision;

  /// Is the currency part name feminine?
  /// Example: هللة (feminine = true), قرش (masculine = false)
  final bool isCurrencyPartNameFeminine;

  CurrencyInfo({
    required this.currencyId,
    required this.currencyCode,
    required this.isCurrencyNameFeminine,
    required this.englishCurrencyName,
    required this.englishPluralCurrencyName,
    required this.englishCurrencyPartName,
    required this.englishPluralCurrencyPartName,
    required this.arabic1CurrencyName,
    required this.arabic2CurrencyName,
    required this.arabic310CurrencyName,
    required this.arabic1199CurrencyName,
    required this.arabic1CurrencyPartName,
    required this.arabic2CurrencyPartName,
    required this.arabic310CurrencyPartName,
    required this.arabic1199CurrencyPartName,
    this.partPrecision = 2,
    required this.isCurrencyPartNameFeminine,
  });

  /// Copy the object with modified properties
  CurrencyInfo copyWith({
    int? currencyId,
    String? currencyCode,
    bool? isCurrencyNameFeminine,
    String? englishCurrencyName,
    String? englishPluralCurrencyName,
    String? englishCurrencyPartName,
    String? englishPluralCurrencyPartName,
    String? arabic1CurrencyName,
    String? arabic2CurrencyName,
    String? arabic310CurrencyName,
    String? arabic1199CurrencyName,
    String? arabic1CurrencyPartName,
    String? arabic2CurrencyPartName,
    String? arabic310CurrencyPartName,
    String? arabic1199CurrencyPartName,
    int? partPrecision,
    bool? isCurrencyPartNameFeminine,
  }) {
    return CurrencyInfo(
      currencyId: currencyId ?? this.currencyId,
      currencyCode: currencyCode ?? this.currencyCode,
      isCurrencyNameFeminine:
          isCurrencyNameFeminine ?? this.isCurrencyNameFeminine,
      englishCurrencyName: englishCurrencyName ?? this.englishCurrencyName,
      englishPluralCurrencyName:
          englishPluralCurrencyName ?? this.englishPluralCurrencyName,
      englishCurrencyPartName:
          englishCurrencyPartName ?? this.englishCurrencyPartName,
      englishPluralCurrencyPartName:
          englishPluralCurrencyPartName ?? this.englishPluralCurrencyPartName,
      arabic1CurrencyName: arabic1CurrencyName ?? this.arabic1CurrencyName,
      arabic2CurrencyName: arabic2CurrencyName ?? this.arabic2CurrencyName,
      arabic310CurrencyName:
          arabic310CurrencyName ?? this.arabic310CurrencyName,
      arabic1199CurrencyName:
          arabic1199CurrencyName ?? this.arabic1199CurrencyName,
      arabic1CurrencyPartName:
          arabic1CurrencyPartName ?? this.arabic1CurrencyPartName,
      arabic2CurrencyPartName:
          arabic2CurrencyPartName ?? this.arabic2CurrencyPartName,
      arabic310CurrencyPartName:
          arabic310CurrencyPartName ?? this.arabic310CurrencyPartName,
      arabic1199CurrencyPartName:
          arabic1199CurrencyPartName ?? this.arabic1199CurrencyPartName,
      partPrecision: partPrecision ?? this.partPrecision,
      isCurrencyPartNameFeminine:
          isCurrencyPartNameFeminine ?? this.isCurrencyPartNameFeminine,
    );
  }

  @override
  String toString() {
    return 'CurrencyInfo(currencyCode: $currencyCode, englishName: $englishCurrencyName, arabicName: $arabic1CurrencyName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrencyInfo && other.currencyCode == currencyCode;
  }

  @override
  int get hashCode => currencyCode.hashCode;
}
