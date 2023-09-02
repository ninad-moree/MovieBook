class Tabs {
  final int index;
  final String title;

  const Tabs({
    required this.index,
    required this.title,
  }) : assert(index >= 0, 'index cannot be negative');
}
