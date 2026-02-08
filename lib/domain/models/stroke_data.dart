import 'dart:ui';

import 'package:kana_master/domain/models/stroke_number.dart';

class StrokeData {
  final List<Path> paths;
  final List<StrokeNumber> numbers;
  final Size viewBox;

  const StrokeData({
    required this.paths,
    required this.numbers,
    required this.viewBox,
  });
}
