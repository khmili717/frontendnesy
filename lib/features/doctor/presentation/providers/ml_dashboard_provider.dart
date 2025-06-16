import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Simple data models for ML dashboard
class MLDashboardData {
  final Map<String, double> featureImportance;
  final List<Map<String, dynamic>> dataset;
  final List<PatientAnalysis> patientAnalyses;
  final String responseLabel;

  const MLDashboardData({
    required this.featureImportance,
    required this.dataset,
    required this.patientAnalyses,
    this.responseLabel = 'Suicide Risk',
  });
}

class PatientAnalysis {
  final String patientId;
  final int prediction;
  final double probability;
  final List<FeatureContribution> contributions;

  const PatientAnalysis({
    required this.patientId,
    required this.prediction,
    required this.probability,
    required this.contributions,
  });

  String get riskLevel => prediction == 1 ? 'High Risk' : 'Low Risk';
}

class FeatureContribution {
  final String feature;
  final dynamic value;
  final double contribution;
  final String displayName;

  const FeatureContribution({
    required this.feature,
    required this.value,
    required this.contribution,
    String? displayName,
  }) : displayName = displayName ?? feature;

  bool get isPositive => contribution > 0;
}

enum ContributionFilter { all, positive, negative }

class DashboardFilter {
  final ContributionFilter contributionFilter;
  final double threshold;
  final int maxFeatures;
  final String? selectedPatientId;
  final String? selectedFeature;

  const DashboardFilter({
    this.contributionFilter = ContributionFilter.all,
    this.threshold = 0.0,
    this.maxFeatures = 15,
    this.selectedPatientId,
    this.selectedFeature,
  });

  DashboardFilter copyWith({
    ContributionFilter? contributionFilter,
    double? threshold,
    int? maxFeatures,
    String? selectedPatientId,
    String? selectedFeature,
  }) {
    return DashboardFilter(
      contributionFilter: contributionFilter ?? this.contributionFilter,
      threshold: threshold ?? this.threshold,
      maxFeatures: maxFeatures ?? this.maxFeatures,
      selectedPatientId: selectedPatientId ?? this.selectedPatientId,
      selectedFeature: selectedFeature ?? this.selectedFeature,
    );
  }
}

class MLDashboardState {
  final bool isLoading;
  final MLDashboardData? data;
  final String? error;
  final DashboardFilter filter;
  final bool hasLoadedOnce;

  const MLDashboardState({
    this.isLoading = false,
    this.data,
    this.error,
    this.filter = const DashboardFilter(),
    this.hasLoadedOnce = false,
  });

  MLDashboardState copyWith({
    bool? isLoading,
    MLDashboardData? data,
    String? error,
    DashboardFilter? filter,
    bool? hasLoadedOnce,
  }) {
    return MLDashboardState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
      filter: filter ?? this.filter,
      hasLoadedOnce: hasLoadedOnce ?? this.hasLoadedOnce,
    );
  }

  bool get hasData => data != null;
  bool get hasError => error != null;
}

class MLDashboardNotifier extends StateNotifier<MLDashboardState> {
  MLDashboardNotifier() : super(const MLDashboardState());

  Future<void> loadDashboardData({bool forceReload = false}) async {
    if (state.isLoading) {
      print('[ML_DASHBOARD] Already loading, skipping request');
      return;
    }
    
    if (state.hasLoadedOnce && !forceReload) {
      print('[ML_DASHBOARD] Data already loaded, skipping request');
      return;
    }

    print('[ML_DASHBOARD] Starting data load...');
    state = state.copyWith(isLoading: true, error: null);

    try {
      final uri = Uri.parse("http://10.0.2.2:5000/admin");
      print('[ML_DASHBOARD] Making request to: $uri');
      
      final response = await http
          .get(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
            },
          )
          .timeout(const Duration(seconds: 30))
          .onError((error, stackTrace) {
            print('[ML_DASHBOARD] HTTP Error: $error');
            print('[ML_DASHBOARD] Stack trace: $stackTrace');
            return http.Response('Error', 500);
          });

      print('[ML_DASHBOARD] Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('[ML_DASHBOARD] Response body length: ${response.body.length}');
        print('[ML_DASHBOARD] Response preview: ${response.body.substring(0, response.body.length > 200 ? 200 : response.body.length)}...');
        
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final data = _processResponse(jsonData);
        
        state = state.copyWith(
          isLoading: false,
          data: data,
          error: null,
          hasLoadedOnce: true,
        );
        
        print('[ML_DASHBOARD] Data loaded successfully');
      } else {
        throw Exception('Server returned status code: ${response.statusCode}');
      }
    } catch (e) {
      print('[ML_DASHBOARD] Error loading data: $e');
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load dashboard data: ${e.toString()}',
        hasLoadedOnce: true,
      );
    }
  }

  MLDashboardData _processResponse(Map<String, dynamic> jsonData) {
    print('[ML_DASHBOARD] Processing response data...');
    
    // Extract feature importance
    final importance = <String, double>{};
    final importanceData = jsonData['feature_importance'] ?? {};
    if (importanceData is Map) {
      importanceData.forEach((key, value) {
        if (value is num) {
          importance[key.toString()] = value.toDouble();
        }
      });
    }
    print('[ML_DASHBOARD] Found ${importance.length} features');

    // Extract dataset
    final dataset = <Map<String, dynamic>>[];
    final datasetList = jsonData['dataset'] ?? [];
    if (datasetList is List) {
      for (final item in datasetList) {
        if (item is Map<String, dynamic>) {
          dataset.add(item);
        }
      }
    }
    print('[ML_DASHBOARD] Found ${dataset.length} dataset records');

    // Extract patient analyses
    final analyses = <PatientAnalysis>[];
    final predictionsData = jsonData['predictions'] ?? [];
    if (predictionsData is List) {
      for (final pred in predictionsData) {
        if (pred is Map<String, dynamic>) {
          final contributions = <FeatureContribution>[];
          final explanationData = pred['local_explanation'] ?? [];

          if (explanationData is List) {
            for (final feature in explanationData) {
              if (feature is Map<String, dynamic>) {
                contributions.add(
                  FeatureContribution(
                    feature: feature['feature']?.toString() ?? '',
                    value: feature['value'],
                    contribution: (feature['contribution'] ?? 0.0).toDouble(),
                    displayName: feature['display_name']?.toString(),
                  ),
                );
              }
            }
          }

          analyses.add(
            PatientAnalysis(
              patientId: pred['patient_id']?.toString() ?? '',
              prediction: pred['y_pred'] ?? 0,
              probability: (pred['proba'] ?? 0.0).toDouble(),
              contributions: contributions,
            ),
          );
        }
      }
    }
    print('[ML_DASHBOARD] Found ${analyses.length} patient analyses');

    return MLDashboardData(
      featureImportance: importance,
      dataset: dataset,
      patientAnalyses: analyses,
    );
  }

  // Filter methods
  void setSelectedPatient(String? patientId) {
    state = state.copyWith(
      filter: state.filter.copyWith(selectedPatientId: patientId),
    );
  }

  void setSelectedFeature(String? feature) {
    state = state.copyWith(
      filter: state.filter.copyWith(selectedFeature: feature),
    );
  }

  void setThreshold(double threshold) {
    state = state.copyWith(filter: state.filter.copyWith(threshold: threshold));
  }

  void setMaxFeatures(int maxFeatures) {
    state = state.copyWith(
      filter: state.filter.copyWith(maxFeatures: maxFeatures),
    );
  }

  // Data getters for charts
  List<Map<String, dynamic>> getFeatureImportanceChartData() {
    if (!state.hasData) return [];

    final entries = state.data!.featureImportance.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return entries
        .map((entry) => {'label': entry.key, 'value': entry.value})
        .toList();
  }

  PatientAnalysis? getSelectedPatientAnalysis() {
    if (!state.hasData || state.filter.selectedPatientId == null) return null;

    try {
      return state.data!.patientAnalyses.firstWhere(
        (analysis) => analysis.patientId == state.filter.selectedPatientId,
      );
    } catch (e) {
      return null;
    }
  }

  void refreshData() {
    loadDashboardData(forceReload: true);
  }
}

// Providers
final mlDashboardProvider =
    StateNotifierProvider<MLDashboardNotifier, MLDashboardState>(
  (ref) => MLDashboardNotifier(),
);

final featureImportanceDataProvider = Provider<List<Map<String, dynamic>>>((
  ref,
) {
  final notifier = ref.watch(mlDashboardProvider.notifier);
  return notifier.getFeatureImportanceChartData();
});

final selectedPatientAnalysisProvider = Provider<PatientAnalysis?>((ref) {
  final notifier = ref.watch(mlDashboardProvider.notifier);
  return notifier.getSelectedPatientAnalysis();
});

final localExplanationDataProvider = Provider<List<Map<String, dynamic>>>((
  ref,
) {
  final analysis = ref.watch(selectedPatientAnalysisProvider);
  if (analysis == null) return [];

  return analysis.contributions
      .map(
        (contrib) => {
          'label': contrib.displayName != null
              ? '${contrib.displayName}: ${contrib.value}'
              : '${contrib.feature}: ${contrib.value}',
          'value': contrib.contribution,
          'isPositive': contrib.isPositive,
        },
      )
      .toList();
});
