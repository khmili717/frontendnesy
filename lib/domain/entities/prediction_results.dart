import 'package:freezed_annotation/freezed_annotation.dart';

part 'prediction_results.freezed.dart';
part 'prediction_results.g.dart';

@freezed
class PredictionResults with _$PredictionResults {
  const factory PredictionResults({
    required int ypred,
    required double proba,
    required List<String> features,
    required List<dynamic> values,
    required List<double> contributions,
    @JsonKey(name: 'ypred_original') required String ypredOriginal,
    @JsonKey(name: 'image_path') String? imagePath,
  }) = _PredictionResults;

  factory PredictionResults.fromJson(Map<String, dynamic> json) => 
      _$PredictionResultsFromJson(json);
}

// Extension for display and utility methods
extension PredictionResultsExtension on PredictionResults {
  String get predictionLabel {
    return ypredOriginal;
  }
  
  String get formattedProbability {
    return (proba * 100).toStringAsFixed(1);
  }
  
  bool get hasPrediction {
    return features.isNotEmpty && values.isNotEmpty && contributions.isNotEmpty;
  }
  
  // Get the feature with the highest positive contribution
  String? get mostInfluentialPositiveFeature {
    double maxContribution = 0;
    int maxIndex = -1;
    
    for (int i = 0; i < contributions.length; i++) {
      if (contributions[i] > maxContribution) {
        maxContribution = contributions[i];
        maxIndex = i;
      }
    }
    
    return maxIndex >= 0 ? features[maxIndex] : null;
  }
  
  // Get the feature with the highest negative contribution
  String? get mostInfluentialNegativeFeature {
    double minContribution = 0;
    int minIndex = -1;
    
    for (int i = 0; i < contributions.length; i++) {
      if (contributions[i] < minContribution) {
        minContribution = contributions[i];
        minIndex = i;
      }
    }
    
    return minIndex >= 0 ? features[minIndex] : null;
  }
} 