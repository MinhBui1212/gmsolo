extension StringFormatting on String {
  String formatPhoneNumber() {
    if (contains('+84')) return replaceAll('+84', '0');
    return this;
  }
}
