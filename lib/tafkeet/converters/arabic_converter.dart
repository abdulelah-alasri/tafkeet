import '../models/currency_info.dart';
import '../utils/number_utils.dart';

/// Arabic number to words converter
class ArabicConverter {
  // Basic numbers
  static const List<String> _ones = [
    '',
    'واحد',
    'اثنان',
    'ثلاثة',
    'أربعة',
    'خمسة',
    'ستة',
    'سبعة',
    'ثمانية',
    'تسعة',
    'عشرة',
    'أحد عشر',
    'اثنا عشر',
    'ثلاثة عشر',
    'أربعة عشر',
    'خمسة عشر',
    'ستة عشر',
    'سبعة عشر',
    'ثمانية عشر',
    'تسعة عشر'
  ];

  static const List<String> _femininOnes = [
    '',
    'إحدى',
    'اثنتان',
    'ثلاث',
    'أربع',
    'خمس',
    'ست',
    'سبع',
    'ثمان',
    'تسع',
    'عشر',
    'إحدى عشرة',
    'اثنتا عشرة',
    'ثلاث عشرة',
    'أربع عشرة',
    'خمس عشرة',
    'ست عشرة',
    'سبع عشرة',
    'ثماني عشرة',
    'تسع عشرة'
  ];

  static const List<String> _tens = [
    'عشرون',
    'ثلاثون',
    'أربعون',
    'خمسون',
    'ستون',
    'سبعون',
    'ثمانون',
    'تسعون'
  ];

  static const List<String> _hundreds = [
    '',
    'مائة',
    'مئتان',
    'ثلاثمائة',
    'أربعمائة',
    'خمسمائة',
    'ستمائة',
    'سبعمائة',
    'ثمانمائة',
    'تسعمائة'
  ];

  static const List<String> _arabicAppendedTwos = [
    'مئتا',
    'ألفا',
    'مليونا',
    'مليارا',
    'تريليونا'
  ];

  static const List<String> _arabicGroups = [
    '',
    'ألف',
    'مليون',
    'مليار',
    'تريليون'
  ];

  static const List<String> _arabicPluralGroups = [
    '',
    'آلاف',
    'ملايين',
    'مليارات',
    'تريليونات'
  ];

  /// Convert number to Arabic words
  static String convert(
    double number,
    CurrencyInfo? currency, {
    String prefix = '',
    String suffix = '',
  }) {
    if (NumberUtils.isZero(number)) {
      return _buildResult('صفر', '', currency, prefix, suffix);
    }

    final parts = NumberUtils.splitNumber(number);
    final integerText = _convertInteger(parts.integerPart, currency);
    final decimalText = parts.decimalPart > 0
        ? _convertDecimal(parts.decimalPart, currency)
        : '';

    String result = integerText;
    if (decimalText.isNotEmpty) {
      result += ' و $decimalText';
    }

    if (parts.isNegative) {
      result = 'سالب $result';
    }

    return _buildResult(result, '', currency, prefix, suffix);
  }

  /// Build final result
  static String _buildResult(
    String text,
    String currencyText,
    CurrencyInfo? currency,
    String prefix,
    String suffix,
  ) {
    final parts = <String>[];
    if (prefix.isNotEmpty) parts.add(prefix);
    parts.add(text);
    if (currencyText.isNotEmpty) parts.add(currencyText);
    if (suffix.isNotEmpty) parts.add(suffix);
    return parts.join(' ');
  }

  /// Convert integer part
  static String _convertInteger(int number, CurrencyInfo? currency) {
    if (number == 0) return '';

    final groups = <int>[];
    int tempNumber = number;

    // Split number into groups of 3 digits
    while (tempNumber > 0) {
      groups.add(tempNumber % 1000);
      tempNumber = tempNumber ~/ 1000;
    }

    String result = '';
    for (int i = groups.length - 1; i >= 0; i--) {
      if (groups[i] == 0) continue;

      if (result.isNotEmpty) {
        result += ' و ';
      }

      final groupText = _processGroup(groups[i], i == 0, currency);
      result += groupText;

      // Add group name (thousand, million, etc.)
      if (i > 0) {
        result += ' ';
        if (groups[i] == 2) {
          result += _arabicAppendedTwos[i];
        } else if (groups[i] >= 3 && groups[i] <= 10) {
          result += _arabicPluralGroups[i];
        } else {
          result += _arabicGroups[i];
        }
      }
    }

    // Add currency name
    if (currency != null) {
      final remaining100 = number % 100;
      String currencyName;

      if (remaining100 == 0 || remaining100 == 1) {
        currencyName = currency.arabic1CurrencyName;
      } else if (remaining100 == 2) {
        if (number == 2) {
          currencyName = currency.arabic2CurrencyName;
        } else {
          currencyName = currency.arabic1CurrencyName;
        }
      } else if (remaining100 >= 3 && remaining100 <= 10) {
        currencyName = currency.arabic310CurrencyName;
      } else {
        currencyName = currency.arabic1199CurrencyName;
      }

      return '$result $currencyName';
    }

    return result;
  }

  /// Convert decimal part
  static String _convertDecimal(int number, CurrencyInfo? currency) {
    if (number == 0) return '';

    final result = _processGroup(number, true, currency);

    // Add currency part name
    if (currency != null) {
      final remaining100 = number % 100;
      String partName;

      if (remaining100 == 0 || remaining100 == 1) {
        partName = currency.arabic1CurrencyPartName;
      } else if (remaining100 == 2) {
        partName = currency.arabic2CurrencyPartName;
      } else if (remaining100 >= 3 && remaining100 <= 10) {
        partName = currency.arabic310CurrencyPartName;
      } else {
        partName = currency.arabic1199CurrencyPartName;
      }

      return '$result $partName';
    }

    return result;
  }

  /// Process a group of 3 digits
  static String _processGroup(
    int groupNumber,
    bool isLastGroup,
    CurrencyInfo? currency,
  ) {
    final tens = groupNumber % 100;
    final hundreds = groupNumber ~/ 100;
    String result = '';

    // Process hundreds
    if (hundreds > 0) {
      if (hundreds <= 9) {
        if (tens == 0 && hundreds == 2) {
          result = _arabicAppendedTwos[0];
        } else {
          result = _hundreds[hundreds];
        }
      }
    }

    // Process numbers less than 20
    if (tens > 0) {
      if (tens < 20) {
        if (result.isNotEmpty) result += ' و ';

        // Use feminine or masculine based on currency
        final isFeminine =
            isLastGroup && (currency?.isCurrencyNameFeminine ?? false);
        result += isFeminine ? _femininOnes[tens] : _ones[tens];
      } else {
        // Process tens
        final ones = tens % 10;
        final tensValue = (tens ~/ 10) - 2;

        if (ones > 0) {
          if (result.isNotEmpty) result += ' و ';
          final isFeminine =
              isLastGroup && (currency?.isCurrencyNameFeminine ?? false);
          result += isFeminine ? _femininOnes[ones] : _ones[ones];
        }

        if (result.isNotEmpty) result += ' و ';
        result += _tens[tensValue];
      }
    }

    return result;
  }
}
