class SegmentOption<T> {
  final T value;
  final String title;
  final String? subtitle;
  final String? symbol;
  final bool enabled;

  const SegmentOption({
    required this.value,
    required this.title,
    this.subtitle,
    this.symbol,
    this.enabled = true,
  });
}
