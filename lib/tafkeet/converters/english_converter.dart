import '../models/currency_info.dart';
import '../utils/number_utils.dart';

/// English number to words converter
class EnglishConverter {
  static const List<String> _ones = [
    '',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Sixteen',
    'Seventeen',
    'Eighteen',
    'Nineteen'
  ];

  static const List<String> _tens = [
    'Twenty',
    'Thirty',
    'Forty',
    'Fifty',
    'Sixty',
    'Seventy',
    'Eighty',
    'Ninety'
  ];

  static const List<String> _groups = [
    'Hundred',
    'Thousand',
    'Million',
    'Billion',
    'Trillion'
  ];

  /// Convert number to English words
  static String convert(
    double number,
    CurrencyInfo? currency, {
    String prefix = '',
    String suffix = '',
  }) {
    if (NumberUtils.isZero(number)) {
      return _buildResult('Zero', '', currency, prefix, suffix);
    }

    final parts = NumberUtils.splitNumber(number);
    final integerText = _convertInteger(parts.integerPart, currency);
    final decimalText = parts.decimalPart > 0
        ? _convertDecimal(parts.decimalPart, currency)
        : '';

    String result = integerText;
    if (decimalText.isNotEmpty) {
      result += ' and $decimalText';
    }

    if (parts.isNegative) {
      result = 'Negative $result';
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

    String result = '';
    int groupIndex = 0;
    int tempNumber = number;

    while (tempNumber > 0) {
      final groupNumber = tempNumber % 1000;
      tempNumber = tempNumber ~/ 1000;

      if (groupNumber != 0) {
        final groupText = _processGroup(groupNumber);
        if (groupIndex > 0) {
          result = '${_groups[groupIndex]} $result';
        }
        result = '$groupText $result';
      }

      groupIndex++;
    }

    result = result.trim();

    // إضافة اسم العملة
    if (currency != null) {
      final currencyName = number == 1
          ? currency.englishCurrencyName
          : currency.englishPluralCurrencyName;
      result += ' $currencyName';
    }

    return result;
  }

  /// Convert decimal part
  static String _convertDecimal(int number, CurrencyInfo? currency) {
    if (number == 0) return '';

    final result = _processGroup(number);

    // Add currency part name
    if (currency != null) {
      final partName = number == 1
          ? currency.englishCurrencyPartName
          : currency.englishPluralCurrencyPartName;
      return '$result $partName';
    }

    return result;
  }

  /// Process a group of 3 digits
  static String _processGroup(int groupNumber) {
    final tens = groupNumber % 100;
    final hundreds = groupNumber ~/ 100;
    String retVal = '';

    // Process hundreds
    if (hundreds > 0) {
      retVal = '${_ones[hundreds]} ${_groups[0]}';
    }

    // Process tens and ones
    if (tens > 0) {
      if (tens < 20) {
        retVal += (retVal.isNotEmpty ? ' ' : '') + _ones[tens];
      } else {
        final ones = tens % 10;
        final tensValue = (tens ~/ 10) - 2;

        retVal += (retVal.isNotEmpty ? ' ' : '') + _tens[tensValue];

        if (ones > 0) {
          retVal += ' ${_ones[ones]}';
        }
      }
    }

    return retVal.trim();
  }
}
