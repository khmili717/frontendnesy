import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ml_dashboard_provider.dart';

class LocalExplanationChart extends ConsumerWidget {
  const LocalExplanationChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    try {
      debugPrint('[LocalExplanationChart] Building widget...');
      
      final state = ref.watch(mlDashboardProvider);
      final analysis = ref.watch(selectedPatientAnalysisProvider);
      final explanationData = ref.watch(localExplanationDataProvider);

      debugPrint('[LocalExplanationChart] State - Loading: ${state.isLoading}, Analysis: ${analysis?.patientId}, Data length: ${explanationData.length}');

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _ChartHeader(
                  title: 'Local Explanation',
                  subtitle: 'Feature contributions for individual patient',
                ),
                const _PatientIdInput(),
              ],
            ),
            const SizedBox(height: 16),
            if (state.isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (analysis == null)
              const _PatientSelector()
            else ...[
              _PatientInfo(patient: analysis),
              const SizedBox(height: 16),
              _FilterControls(),
              const SizedBox(height: 16),
              Expanded(
                child: _SafeContributionChart(data: explanationData),
              ),
            ],
          ],
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('[LocalExplanationChart] ERROR: $e');
      debugPrint('[LocalExplanationChart] STACK: $stackTrace');
      
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              Text('Local Chart Error: $e', style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      );
    }
  }
}

class _ChartHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _ChartHeader({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class _PatientIdInput extends ConsumerStatefulWidget {
  const _PatientIdInput();

  @override
  ConsumerState<_PatientIdInput> createState() => _PatientIdInputState();
}

class _PatientIdInputState extends ConsumerState<_PatientIdInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Patient ID',
                hintText: 'Enter ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                labelStyle: const TextStyle(fontSize: 12),
                hintStyle: const TextStyle(fontSize: 12),
              ),
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              final patientId = _controller.text.trim();
              if (patientId.isNotEmpty) {
                ref.read(mlDashboardProvider.notifier).setSelectedPatient(patientId);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0066CC),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Show',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _PatientSelector extends StatelessWidget {
  const _PatientSelector();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_search,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Enter a Patient ID to view local explanation',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _PatientInfo extends StatelessWidget {
  final PatientAnalysis patient;

  const _PatientInfo({required this.patient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: patient.prediction == 1 
          ? Colors.red.withValues(alpha: 0.1)
          : Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: patient.prediction == 1 
            ? Colors.red.withValues(alpha: 0.3)
            : Colors.green.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            patient.prediction == 1 ? Icons.warning : Icons.check_circle,
            color: patient.prediction == 1 ? Colors.red : Colors.green,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patient ID: ${patient.patientId}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Risk Level: ${patient.riskLevel} (${(patient.probability * 100).toStringAsFixed(1)}%)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SafeContributionChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const _SafeContributionChart({required this.data});

  @override
  Widget build(BuildContext context) {
    try {
      debugPrint('[_SafeContributionChart] Building with ${data.length} items');
      
      if (data.isEmpty) {
        debugPrint('[_SafeContributionChart] No data available');
        return const _EmptyExplanation();
      }

      // Validate data structure
      for (int i = 0; i < data.length; i++) {
        final item = data[i];
        if (item['value'] == null || item['label'] == null || item['isPositive'] == null) {
          debugPrint('[_SafeContributionChart] Invalid data at index $i: $item');
          return const _EmptyExplanation();
        }
      }

      final maxValue = data.map((e) {
        final value = e['value'];
        if (value is! num) {
          debugPrint('[_SafeContributionChart] Non-numeric value found: $value');
          return 0.0;
        }
        return value.toDouble().abs();
      }).reduce((a, b) => a > b ? a : b);
      
      debugPrint('[_SafeContributionChart] Max absolute value: $maxValue');
      
      // Prevent division by zero
      if (maxValue <= 0) {
        debugPrint('[_SafeContributionChart] Max value is zero or negative');
        return const _EmptyExplanation();
      }
      
      return LayoutBuilder(
        builder: (context, constraints) {
          debugPrint('[_SafeContributionChart] Available constraints: ${constraints.maxWidth}x${constraints.maxHeight}');
          
          if (constraints.maxHeight < 100) {
            debugPrint('[_SafeContributionChart] Insufficient height: ${constraints.maxHeight}');
            return const Center(child: Text('Insufficient space for chart'));
          }
          
          return SingleChildScrollView(
            child: Column(
              children: data.map((item) {
                return _SafeContributionItem(
                  item: item,
                  maxValue: maxValue,
                );
              }).toList(),
            ),
          );
        }
      );
    } catch (e, stackTrace) {
      debugPrint('[_SafeContributionChart] ERROR: $e');
      debugPrint('[_SafeContributionChart] STACK: $stackTrace');
      
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 32),
              const SizedBox(height: 8),
              Text('Contribution Chart Error: $e', 
                style: const TextStyle(color: Colors.red, fontSize: 12)),
            ],
          ),
        ),
      );
    }
  }
}

class _SafeContributionItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final double maxValue;

  const _SafeContributionItem({
    required this.item,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    try {
      final value = (item['value'] as num).toDouble();
      final label = item['label'] as String;
      final isPositive = item['isPositive'] as bool;
      final percentage = maxValue > 0 ? value.abs() / maxValue : 0.0;
      
      debugPrint('[_SafeContributionItem] Processing: $label, value: $value, isPositive: $isPositive, percentage: $percentage');
      
      // Ensure flex values are valid
      final flexValue = math.max(1, (percentage * 100).round());
      final remainingFlex = math.max(1, ((1 - percentage) * 100).round());
      
      debugPrint('[_SafeContributionItem] Flex values: $flexValue, $remainingFlex');
      
      // Validate flex values
      if (flexValue <= 0 || remainingFlex <= 0) {
        debugPrint('[_SafeContributionItem] Invalid flex values: $flexValue, $remainingFlex');
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text('Invalid contribution data: $label'),
        );
      }
      
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: IntrinsicHeight(
          child: Row(
            children: [
              SizedBox(
                width: 160,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    debugPrint('[_SafeContributionItem] Bar constraints: ${constraints.maxWidth}');
                    
                    if (constraints.maxWidth < 50) {
                      return const SizedBox(height: 16);
                    }
                    
                    return Container(
                      height: 16,
                      child: Row(
                        children: [
                          if (!isPositive) ...[
                            Flexible(
                              flex: remainingFlex,
                              child: const SizedBox(height: 16),
                            ),
                            Flexible(
                              flex: flexValue,
                              child: Container(
                                height: 16,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3498DB),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ] else ...[
                            Flexible(
                              flex: flexValue,
                              child: Container(
                                height: 16,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFC107),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: remainingFlex,
                              child: const SizedBox(height: 16),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 50,
                child: Text(
                  value.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('[_SafeContributionItem] ERROR: $e');
      debugPrint('[_SafeContributionItem] STACK: $stackTrace');
      
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text('Error rendering contribution: ${item['label']}'),
      );
    }
  }
}

class _FilterControls extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(mlDashboardProvider).filter;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Threshold: ${filter.threshold.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Slider(
                value: filter.threshold,
                min: 0.0,
                max: 1.0,
                divisions: 20,
                onChanged: (value) {
                  ref.read(mlDashboardProvider.notifier).setThreshold(value);
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Max Features: ${filter.maxFeatures}',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Slider(
                value: filter.maxFeatures.toDouble(),
                min: 5,
                max: 20,
                divisions: 15,
                onChanged: (value) {
                  ref.read(mlDashboardProvider.notifier).setMaxFeatures(value.round());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmptyExplanation extends StatelessWidget {
  const _EmptyExplanation();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.analytics_outlined,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No explanation data available',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
} 