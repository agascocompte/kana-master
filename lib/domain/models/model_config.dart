class ModelConfig {
  final String assetPath;
  final int inputSize;
  final int numClasses;
  final bool normalize;

  const ModelConfig({
    required this.assetPath,
    required this.inputSize,
    required this.numClasses,
    required this.normalize,
  });
}
