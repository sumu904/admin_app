class StringFormater {
  static String formatString(String input) {
    List<String> words = input.split('_').map((word) => word[0].toUpperCase() + word.substring(1)).toList();
    return words.join(' ');
  }
}