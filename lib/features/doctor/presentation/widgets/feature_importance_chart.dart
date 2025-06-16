import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ml_dashboard_provider.dart';

class FeatureImportanceChart extends ConsumerWidget {
  const FeatureImportanceChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    try {
      debugPrint('[FeatureImportanceChart] Building widget...');
      
      final state = ref.watch(mlDashboardProvider);
      final featureData = ref.watch(featureImportanceDataProvider);

      debugPrint('[FeatureImportanceChart] State - Loading: ${state.isLoading}, HasError: ${state.hasError}, HasData: ${state.hasData}');
      debugPrint('[FeatureImportanceChart] Feature data length: ${featureData.length}');

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
            const _ChartHeader(
              title: 'Feature Importance',
              subtitle: 'Most influential factors in suicide risk prediction',
            ),
            const SizedBox(height: 16),
            if (state.isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (state.hasError)
              _EmptyChart(message: state.error ?? 'Error loading data')
            else if (featureData.isEmpty)
              const _EmptyChart(message: 'No feature importance data available')
            else
              Expanded(
                child: _SafeCustomBarChart(
                  data: featureData,
                  onBarTap: (data) => _showFeatureDetails(context, data),
                ),
              ),
          ],
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('[FeatureImportanceChart] ERROR: $e');
      debugPrint('[FeatureImportanceChart] STACK: $stackTrace');
      
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
              Text('Chart Error: $e', style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      );
    }
  }

  void _showFeatureDetails(BuildContext context, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          data['label'] as String,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Feature Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Importance: ${(data['value'] as double).toStringAsFixed(4)}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'This feature contributes to the model\'s ability to predict suicide risk. Higher values indicate more important features.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
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

class _SafeCustomBarChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final Function(Map<String, dynamic>) onBarTap;

  const _SafeCustomBarChart({
    required this.data,
    required this.onBarTap,
  });

  @override
  Widget build(BuildContext context) {
    try {
      debugPrint('[_SafeCustomBarChart] Building with ${data.length} items');
      
      if (data.isEmpty) {
        debugPrint('[_SafeCustomBarChart] No data available');
        return const SizedBox();
      }

      // Validate data structure
      for (int i = 0; i < data.length; i++) {
        final item = data[i];
        if (item['value'] == null || item['label'] == null) {
          debugPrint('[_SafeCustomBarChart] Invalid data at index $i: $item');
          return const _EmptyChart(message: 'Invalid data structure');
        }
      }

      final maxValue = data.map((e) {
        final value = e['value'];
        if (value is! num) {
          debugPrint('[_SafeCustomBarChart] Non-numeric value found: $value');
          return 0.0;
        }
        return value.toDouble();
      }).reduce((a, b) => a > b ? a : b);
      
      debugPrint('[_SafeCustomBarChart] Max value: $maxValue');
      
      // Prevent division by zero
      if (maxValue <= 0) {
        debugPrint('[_SafeCustomBarChart] Max value is zero or negative');
        return const _EmptyChart(message: 'No positive data to display');
      }
      
      return LayoutBuilder(
        builder: (context, constraints) {
          debugPrint('[_SafeCustomBarChart] Available constraints: ${constraints.maxWidth}x${constraints.maxHeight}');
          
          if (constraints.maxHeight < 100) {
            debugPrint('[_SafeCustomBarChart] Insufficient height: ${constraints.maxHeight}');
            return const Center(child: Text('Insufficient space for chart'));
          }
          
          return SingleChildScrollView(
            child: Column(
              children: data.take(10).map((item) {
                return _SafeBarItem(
                  item: item,
                  maxValue: maxValue,
                  onTap: () => onBarTap(item),
                );
              }).toList(),
            ),
          );
        }
      );
    } catch (e, stackTrace) {
      debugPrint('[_SafeCustomBarChart] ERROR: $e');
      debugPrint('[_SafeCustomBarChart] STACK: $stackTrace');
      
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
              Text('Bar Chart Error: $e', 
                style: const TextStyle(color: Colors.red, fontSize: 12)),
            ],
          ),
        ),
      );
    }
  }
}

class _SafeBarItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final double maxValue;
  final VoidCallback onTap;

  const _SafeBarItem({
    required this.item,
    required this.maxValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    try {
      final value = (item['value'] as num).toDouble();
      final label = item['label'] as String;
      final percentage = maxValue > 0 ? value / maxValue : 0.0;
      
      debugPrint('[_SafeBarItem] Processing: $label, value: $value, percentage: $percentage');
      
      // Ensure flex values are valid
      final flexValue = math.max(1, (percentage * 100).round());
      final remainingFlex = math.max(1, ((1 - percentage) * 100).round());
      
      debugPrint('[_SafeBarItem] Flex values: $flexValue, $remainingFlex');
      
      // Validate flex values
      if (flexValue <= 0 || remainingFlex <= 0) {
        debugPrint('[_SafeBarItem] Invalid flex values: $flexValue, $remainingFlex');
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text('Invalid bar data: $label'),
        );
      }
      
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        debugPrint('[_SafeBarItem] Bar constraints: ${constraints.maxWidth}');
                        
                        if (constraints.maxWidth < 50) {
                          return const SizedBox(height: 20);
                        }
                        
                        return Container(
                          height: 20,
                          child: Row(
                            children: [
                              Flexible(
                                flex: flexValue,
                                child: Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFC107),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: remainingFlex,
                                child: const SizedBox(height: 20),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 60,
                    child: Text(
                      value.toStringAsFixed(3),
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
          ),
        ),
      );
    } catch (e, stackTrace) {
      debugPrint('[_SafeBarItem] ERROR: $e');
      debugPrint('[_SafeBarItem] STACK: $stackTrace');
      
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text('Error rendering bar: ${item['label']}'),
      );
    }
  }
}

class _EmptyChart extends StatelessWidget {
  final String message;

  const _EmptyChart({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bar_chart,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              message,
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