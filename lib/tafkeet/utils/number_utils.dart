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

