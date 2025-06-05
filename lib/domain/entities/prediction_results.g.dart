// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionResultsImpl _$$PredictionResultsImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictionResultsImpl(
      ypred: (json['ypred'] as num).toInt(),
      proba: (json['proba'] as num).toDouble(),
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      values: json['values'] as List<dynamic>,
      contributions: (json['contributions'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      ypredOriginal: json['ypred_original'] as String,
      imagePath: json['image_path'] as String?,
    );

Map<String, dynamic> _$$PredictionResultsImplToJson(
        _$PredictionResultsImpl instance) =>
    <String, dynamic>{
      'ypred': instance.ypred,
      'proba': instance.proba,
      'features': instance.features,
      'values': instance.values,
      'contributions': instance.contributions,
      'ypred_original': instance.ypredOriginal,
      'image_path': instance.imagePath,
    };
