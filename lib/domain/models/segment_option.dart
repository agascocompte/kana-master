class SegmentOption<T> {
  final T value;
  final String title;
  final String? subtitle;
  final String? symbol;

  const SegmentOption({
    required this.value,
    required this.title,
    this.subtitle,
    this.symbol,
  });
}
