extension StringExtensions on String {
  bool get hasOnlyWhitespaces => trim().isEmpty && isNotEmpty;

  bool get isNullOrEmpty => isEmpty;

  bool get isNotNullAndEmpty => trim().isNotEmpty;

  // String get orEmpty => this ?? '';

  String toSpaceSeparated() =>
      replaceAllMapped(RegExp(r'.{4}'), (match) => '${match.group(0)} ');

  String capitalizeFirstLetter() =>
      '${isNotEmpty ? this[0].toUpperCase() : this}${length > 1 ? substring(1).toLowerCase() : ''}';

  String splitLongStringForLogging() => splitMapJoin(
        RegExp('.{250}'),
        onMatch: (match) => '${match.group(0)}',
        onNonMatch: (last) => '\n$last',
      );

  String capitalizeAllWords() {
    return split(' ').map((word) {
      final String leftText =
          (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText.toLowerCase();
    }).join(' ');
  }

  String firstWord() {
    List<String> wordList = split(" ");
    return wordList.isNotEmpty ? wordList[0] : ' ';
  }

}
