class PredictionResults {
  final int ypred;
  final double proba;
  final List<String> features;
  final List<dynamic> values;
  final List<double> contributions;
  final String ypredOriginal;
  final String? imagePath;

  const PredictionResults({
    required this.ypred,
    required this.proba,
    required this.features,
    required this.values,
    required this.contributions,
    required this.ypredOriginal,
    this.imagePath,
  });
}