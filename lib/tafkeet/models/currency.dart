/// Supported currencies
// ignore_for_file: constant_identifier_names
enum Currency {
  // Arabic currencies
  /// Saudi Riyal
  SAR('SAR', 'Saudi Riyal', 'ريال سعودي'),

  /// UAE Dirham
  AED('AED', 'UAE Dirham', 'درهم إماراتي'),

  /// Kuwaiti Dinar
  KWD('KWD', 'Kuwaiti Dinar', 'دينار كويتي'),

  /// Qatari Riyal
  QAR('QAR', 'Qatari Riyal', 'ريال قطري'),

  /// Omani Rial
  OMR('OMR', 'Omani Rial', 'ريال عماني'),

  /// Bahraini Dinar
  BHD('BHD', 'Bahraini Dinar', 'دينار بحريني'),

  /// Egyptian Pound
  EGP('EGP', 'Egyptian Pound', 'جنيه مصري'),

  /// Syrian Pound
  SYP('SYP', 'Syrian Pound', 'ليرة سورية'),

  /// Jordanian Dinar
  JOD('JOD', 'Jordanian Dinar', 'دينار أردني'),

  /// Lebanese Pound
  LBP('LBP', 'Lebanese Pound', 'ليرة لبنانية'),

  /// Iraqi Dinar
  IQD('IQD', 'Iraqi Dinar', 'دينار عراقي'),

  /// Yemeni Riyal
  YER('YER', 'Yemeni Riyal', 'ريال يمني'),

  /// Libyan Dinar
  LYD('LYD', 'Libyan Dinar', 'دينار ليبي'),

  /// Tunisian Dinar
  TND('TND', 'Tunisian Dinar', 'دينار تونسي'),

  /// Algerian Dinar
  DZD('DZD', 'Algerian Dinar', 'دينار جزائري'),

  /// Moroccan Dirham
  MAD('MAD', 'Moroccan Dirham', 'درهم مغربي'),

  /// Sudanese Pound
  SDG('SDG', 'Sudanese Pound', 'جنيه سوداني'),

  /// Somali Shilling
  SOS('SOS', 'Somali Shilling', 'شلن صومالي'),

  /// Mauritanian Ouguiya
  MRU('MRU', 'Mauritanian Ouguiya', 'أوقية موريتانية'),

  /// Djiboutian Franc
  DJF('DJF', 'Djiboutian Franc', 'فرنك جيبوتي'),

  /// Comorian Franc
  KMF('KMF', 'Comorian Franc', 'فرنك قمري'),

  // Major world currencies
  /// US Dollar
  USD('USD', 'US Dollar', 'دولار أمريكي'),

  /// Euro
  EUR('EUR', 'Euro', 'يورو'),

  /// British Pound
  GBP('GBP', 'British Pound', 'جنيه إسترليني'),

  /// Japanese Yen
  JPY('JPY', 'Japanese Yen', 'ين ياباني'),

  /// Swiss Franc
  CHF('CHF', 'Swiss Franc', 'فرنك سويسري'),

  /// Canadian Dollar
  CAD('CAD', 'Canadian Dollar', 'دولار كندي'),

  /// Australian Dollar
  AUD('AUD', 'Australian Dollar', 'دولار أسترالي'),

  /// New Zealand Dollar
  NZD('NZD', 'New Zealand Dollar', 'دولار نيوزيلندي'),

  /// Chinese Yuan
  CNY('CNY', 'Chinese Yuan', 'يوان صيني'),

  /// Indian Rupee
  INR('INR', 'Indian Rupee', 'روبية هندية'),

  /// Russian Ruble
  RUB('RUB', 'Russian Ruble', 'روبل روسي'),

  /// Brazilian Real
  BRL('BRL', 'Brazilian Real', 'ريال برازيلي'),

  /// South African Rand
  ZAR('ZAR', 'South African Rand', 'راند جنوب أفريقي'),

  /// Swedish Krona
  SEK('SEK', 'Swedish Krona', 'كرونا سويدية'),

  /// Norwegian Krone
  NOK('NOK', 'Norwegian Krone', 'كرونة نرويجية'),

  /// Danish Krone
  DKK('DKK', 'Danish Krone', 'كرونة دنماركية'),

  /// Polish Zloty
  PLN('PLN', 'Polish Zloty', 'زلوتي بولندي'),

  /// Turkish Lira
  TRY('TRY', 'Turkish Lira', 'ليرة تركية'),

  /// Indonesian Rupiah
  IDR('IDR', 'Indonesian Rupiah', 'روبية إندونيسية'),

  /// Malaysian Ringgit
  MYR('MYR', 'Malaysian Ringgit', 'رينغيت ماليزي'),

  /// Thai Baht
  THB('THB', 'Thai Baht', 'بات تايلاندي'),

  /// Philippine Peso
  PHP('PHP', 'Philippine Peso', 'بيزو فلبيني'),

  /// Singapore Dollar
  SGD('SGD', 'Singapore Dollar', 'دولار سنغافوري'),

  /// Hong Kong Dollar
  HKD('HKD', 'Hong Kong Dollar', 'دولار هونج كونج'),

  /// South Korean Won
  KRW('KRW', 'South Korean Won', 'وون كوري جنوبي'),

  /// Mexican Peso
  MXN('MXN', 'Mexican Peso', 'بيزو مكسيكي'),

  /// Argentine Peso
  ARS('ARS', 'Argentine Peso', 'بيزو أرجنتيني'),

  /// Chilean Peso
  CLP('CLP', 'Chilean Peso', 'بيزو تشيلي'),

  /// Taiwan Dollar
  TWD('TWD', 'Taiwan Dollar', 'دولار تايواني'),

  /// Vietnamese Dong
  VND('VND', 'Vietnamese Dong', 'دونج فيتنامي'),

  /// Bangladeshi Taka
  BDT('BDT', 'Bangladeshi Taka', 'تاكا بنغلاديشية'),

  /// Pakistani Rupee
  PKR('PKR', 'Pakistani Rupee', 'روبية باكستانية'),

  /// Zimbabwean Dollar
  ZWL('ZWL', 'Zimbabwean Dollar', 'دولار زيمبابوي'),

  /// Kenyan Shilling
  KES('KES', 'Kenyan Shilling', 'شلن كيني'),

  /// Nigerian Naira
  NGN('NGN', 'Nigerian Naira', 'نيرة نيجيرية'),

  /// Ghanaian Cedi
  GHS('GHS', 'Ghanaian Cedi', 'سيدي غاني'),

  /// Ethiopian Birr
  ETB('ETB', 'Ethiopian Birr', 'بير إثيوبي'),

  /// Tanzanian Shilling
  TZS('TZS', 'Tanzanian Shilling', 'شلن تنزاني'),

  /// Ugandan Shilling
  UGX('UGX', 'Ugandan Shilling', 'شلن أوغندي'),

  /// Zambian Kwacha
  ZMW('ZMW', 'Zambian Kwacha', 'كواشا زامبية'),

  /// Botswana Pula
  BWP('BWP', 'Botswana Pula', 'بولا بوتسوانية'),

  /// Swazi Lilangeni
  SZL('SZL', 'Swazi Lilangeni', 'ليلانجيني سوازيلاندي'),

  /// Sao Tome Dobra
  STN('STN', 'Sao Tome Dobra', 'دوبرا ساو تومي'),

  /// Cape Verdean Escudo
  CVE('CVE', 'Cape Verdean Escudo', 'إسكودو كابوفيردي'),

  /// Gambian Dalasi
  GMD('GMD', 'Gambian Dalasi', 'دالاسي غامبي'),

  /// Sierra Leonean Leone
  SLL('SLL', 'Sierra Leonean Leone', 'ليون سيراليوني'),

  /// Guinean Franc
  GNF('GNF', 'Guinean Franc', 'فرنك غيني'),

  /// Central African CFA Franc
  XAF('XAF', 'Central African CFA Franc', 'فرنك أفريقي وسطي'),

  /// West African CFA Franc
  XOF('XOF', 'West African CFA Franc', 'فرنك أفريقي غربي'),

  /// Albanian Lek
  ALL('ALL', 'Albanian Lek', 'ليك ألباني'),

  /// Colombian Peso
  COP('COP', 'Colombian Peso', 'بيزو كولومبي'),

  /// Peruvian Sol
  PEN('PEN', 'Peruvian Sol', 'سول بيروفي'),

  /// Bolivian Boliviano
  BOB('BOB', 'Bolivian Boliviano', 'بوليفيانو بوليفي'),

  /// Bahamian Dollar
  BSD('BSD', 'Bahamian Dollar', 'دولار باهامي'),

  /// Barbadian Dollar
  BBD('BBD', 'Barbadian Dollar', 'دولار بربادوسي'),

  /// Belize Dollar
  BZD('BZD', 'Belize Dollar', 'دولار بليزي'),

  /// Czech Koruna
  CZK('CZK', 'Czech Koruna', 'كورونا تشيكية'),

  /// Hungarian Forint
  HUF('HUF', 'Hungarian Forint', 'فورنت مجري'),

  /// Romanian Leu
  RON('RON', 'Romanian Leu', 'ليو روماني'),

  /// Ukrainian Hryvnia
  UAH('UAH', 'Ukrainian Hryvnia', 'هريفنيا أوكرانية'),

  /// Croatian Kuna
  HRK('HRK', 'Croatian Kuna', 'كونا كرواتية'),

  /// Serbian Dinar
  RSD('RSD', 'Serbian Dinar', 'دينار صربي'),

  /// Bulgarian Lev
  BGN('BGN', 'Bulgarian Lev', 'ليف بلغاري'),

  /// Georgian Lari
  GEL('GEL', 'Georgian Lari', 'لاري جورجي'),

  /// Azerbaijani Manat
  AZN('AZN', 'Azerbaijani Manat', 'مانات أذربيجاني'),

  /// Uzbekistani Som
  UZS('UZS', 'Uzbekistani Som', 'سوم أوزبكي'),

  /// Kazakhstani Tenge
  KZT('KZT', 'Kazakhstani Tenge', 'تنغي كازاخستاني'),

  /// Afghan Afghani
  AFN('AFN', 'Afghan Afghani', 'أفغاني أفغاني'),

  /// Iranian Rial
  IRR('IRR', 'Iranian Rial', 'ريال إيراني'),

  /// Iranian Toman
  IRT('IRT', 'Iranian Toman', 'تومان إيراني');

  const Currency(this.code, this.englishName, this.arabicName);

  /// Currency code
  final String code;

  /// Name in English
  final String englishName;

  /// Name in Arabic
  final String arabicName;

  /// Get currency from its code
  static Currency? fromCode(String code) {
    try {
      return Currency.values.firstWhere(
        (currency) => currency.code.toUpperCase() == code.toUpperCase(),
      );
    } catch (_) {
      return null;
    }
  }

  /// Check if a currency with a specific code exists
  static bool hasCode(String code) {
    return fromCode(code) != null;
  }

  /// Get all Arabic currencies
  static List<Currency> get arabicCurrencies => [
        SAR,
        AED,
        KWD,
        QAR,
        OMR,
        BHD,
        EGP,
        SYP,
        JOD,
        LBP,
        IQD,
        YER,
        LYD,
        TND,
        DZD,
        MAD,
        SDG,
        SOS,
        MRU,
        DJF,
        KMF
      ];

  /// Get all major currencies
  static List<Currency> get majorCurrencies =>
      [USD, EUR, GBP, JPY, CHF, CAD, AUD, CNY, INR, SAR];

  @override
  String toString() => '$arabicName ($code)';
}
