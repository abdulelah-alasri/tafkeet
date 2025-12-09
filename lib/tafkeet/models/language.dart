/// Supported languages
enum Language {
  /// Arabic
  ar('ar', 'العربية'),

  /// English
  en('en', 'English');

  const Language(this.code, this.name);

  /// Language code
  final String code;

  /// Language name
  final String name;

  /// Get language from its code
  static Language fromCode(String code) {
    switch (code.toLowerCase()) {
      case 'ar':
      case 'arabic':
        return Language.ar;
      case 'en':
      case 'english':
        return Language.en;
      default:
        throw ArgumentError('Language "$code" is not supported');
    }
  }

  @override
  String toString() => name;
}

/// Language shorthand
typedef Lang = Language;
