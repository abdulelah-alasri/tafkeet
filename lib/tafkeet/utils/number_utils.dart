/// Utility functions for number processing
class NumberUtils {
  /// Split number into integer and decimal parts
  static NumberParts splitNumber(double number) {
    final isNegative = number < 0;
    final absNumber = number.abs();

    final integerPart = absNumber.floor();
    final decimalPart = ((absNumber - integerPart) * 100).round();

    return NumberParts(
      integerPart: integerPart,
      decimalPart: decimalPart,
      isNegative: isNegative,
    );
  }

  /// Validate if the value is a valid number
  static bool isValidNumber(dynamic value) {
    if (value == null) return false;
    if (value is num) return true;
    if (value is String) {
      return double.tryParse(value) != null;
    }
    return false;
  }

  /// Convert value to double
  static double? toDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  /// Format decimal part according to required precision
  static int formatDecimalPart(double number, int precision) {
    final absNumber = number.abs();
    final integerPart = absNumber.floor();
    final decimalPart = absNumber - integerPart;

    final multiplier = _pow(10, precision);
    return (decimalPart * multiplier).round();
  }

  /// Calculate power (alternative to math.pow)
  static int _pow(int base, int exponent) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= base;
    }
    return result;
  }

  /// Check if number is zero
  static bool isZero(double number) {
    return number.abs() < 0.000001;
  }

  /// Check if number is positive
  static bool isPositive(double number) {
    return number > 0;
  }

  /// Check if number is negative
  static bool isNegative(double number) {
    return number < 0;
  }

  /// Replace Arabic/Hindi numerals with English numerals
  ///
  /// Converts Arabic-Indic digits (٠١٢٣٤٥٦٧٨٩) to Western Arabic numerals (0123456789)
  ///
  /// Example:
  /// ```dart
  /// NumberUtils.replaceArabicNumber('١٢٣'); // Returns: '123'
  /// NumberUtils.replaceArabicNumber('١٢٣.٤٥'); // Returns: '123.45'
  /// NumberUtils.replaceArabicNumber('السعر: ٩٩٩'); // Returns: 'السعر: 999'
  /// ```
  static String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    return input;
  }

  /// Format number with thousand separators
  ///
  /// Formats numbers with comma separators every 3 digits and handles decimals
  ///
  /// [value] The value to format (can be num, int, double, or String)
  /// [digit] Number of decimal places to show (default: 0)
  ///
  /// Example:
  /// ```dart
  /// NumberUtils.amountFormat(1234567); // Returns: '1,234,567'
  /// NumberUtils.amountFormat(1234567.89, digit: 2); // Returns: '1,234,567.89'
  /// NumberUtils.amountFormat('9999.5', digit: 2); // Returns: '9,999.50'
  /// NumberUtils.amountFormat(1000); // Returns: '1,000'
  /// ```
  static String amountFormat(dynamic value, {int digit = 0}) {
    // Convert value to string
    String stringValue = value.toString();

    // Check if it has decimals
    bool hasDecimals = stringValue.contains('.') &&
        (double.tryParse(stringValue) ?? 0) % 1 != 0;

    double number = double.tryParse(stringValue) ?? 0;

    // Set decimal places
    String fixed =
        hasDecimals ? number.toStringAsFixed(digit) : number.toStringAsFixed(0);

    // Split integer and decimal parts
    List<String> parts = fixed.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : "";

    // Add thousand separators to integer part
    String formattedInt = integerPart.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => "${m[1]},",
    );

    // Combine result
    return hasDecimals && decimalPart.isNotEmpty
        ? "$formattedInt.$decimalPart"
        : formattedInt;
  }
}

/// Number parts (integer and decimal)
class NumberParts {
  /// Integer part
  final int integerPart;

  /// Decimal part
  final int decimalPart;

  /// Is the number negative?
  final bool isNegative;

  const NumberParts({
    required this.integerPart,
    required this.decimalPart,
    required this.isNegative,
  });

  @override
  String toString() {
    final sign = isNegative ? '-' : '';
    return '$sign$integerPart.$decimalPart';
  }
}
