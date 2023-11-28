extension StringExtension on String {
  /// Only first latter capitalized, also can be used for "Sentence style capitalization"
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// To "Book Style Capitalization"
  String toBookStyleCapitalization() => split(' ').map((e) => e.capitalize()).join(' ');
}
