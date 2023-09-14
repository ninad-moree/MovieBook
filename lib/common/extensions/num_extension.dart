extension NumExtension on num {
  String convertToPercentageString() {
    return '${((this) * 10).toStringAsFixed(0)}%';
  }
}
