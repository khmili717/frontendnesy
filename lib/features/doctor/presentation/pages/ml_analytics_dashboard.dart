import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ml_dashboard_provider.dart';

class MLAnalyticsDashboard extends ConsumerStatefulWidget {
  const MLAnalyticsDashboard({super.key});

  @override
  ConsumerState<MLAnalyticsDashboard> createState() => _MLAnalyticsDashboardState();
}

class _MLAnalyticsDashboardState extends ConsumerState<MLAnalyticsDashboard> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Delay the data loading until after the widget tree is built
    Future.microtask(() => _loadData());
  }

  void _loadData() async {
    try {
      setState(() => _isLoading = true);
      await ref.read(mlDashboardProvider.notifier).loadDashboardData();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _refreshData() {
    ref.read(mlDashboardProvider.notifier).refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'ML Analytics Dashboard',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh, color: Colors.black),
              onPressed: _refreshData,
            ),
        ],
      ),
      body: _isLoading ? _buildLoadingWidget() : _buildContent(),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading ML Analytics...'),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final state = ref.watch(mlDashboardProvider);
    
    if (state.hasError) {
      return _buildErrorWidget(state.error!);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildFeatureImportanceSection(),
          const SizedBox(height: 20),
          _buildLocalExplanationSection(),
          const SizedBox(height: 20),
          _buildDatasetSection(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0066CC), Color(0xFF004499)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0066CC).withValues(alpha: 0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Machine Learning Analytics',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Suicide Risk Prediction Model Dashboard',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureImportanceSection() {
    final state = ref.watch(mlDashboardProvider);
    
    return Container(
      width: double.infinity,
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
          const Row(
            children: [
              Icon(Icons.bar_chart, color: Color(0xFF0066CC)),
              SizedBox(width: 8),
              Text(
                'Feature Importance',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (state.hasData && state.data!.featureImportance.isNotEmpty)
            ...state.data!.featureImportance.entries
                .take(5)
                .map((entry) => _buildFeatureBar(entry.key, entry.value))
                .toList()
          else
            const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text('No feature importance data available'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeatureBar(String feature, double importance) {
    final percentage = (importance * 100).clamp(0.0, 100.0);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  feature,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC107),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocalExplanationSection() {
    final state = ref.watch(mlDashboardProvider);
    
    return Container(
      width: double.infinity,
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
          const Row(
            children: [
              Icon(Icons.person_outline, color: Color(0xFF0066CC)),
              SizedBox(width: 8),
              Text(
                'Patient Analysis',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (state.hasData && state.data!.patientAnalyses.isNotEmpty)
            ...state.data!.patientAnalyses.take(3).map((analysis) =>
              _buildPatientAnalysis(analysis.patientId, analysis.contributions)
            ).toList()
          else
            const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text('No patient analysis data available'),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPatientAnalysis(String patientId, List<FeatureContribution> contributions) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Patient: $patientId',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...contributions.take(3).map((contrib) {
            final isPositive = contrib.contribution >= 0;
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      contrib.displayName,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: isPositive ? Colors.red[100] : Colors.green[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${isPositive ? '+' : ''}${contrib.contribution.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 11,
                        color: isPositive ? Colors.red[700] : Colors.green[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildDatasetSection() {
    final state = ref.watch(mlDashboardProvider);
    
    return Container(
      width: double.infinity,
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
          const Row(
            children: [
              Icon(Icons.table_chart, color: Color(0xFF0066CC)),
              SizedBox(width: 8),
              Text(
                'Dataset Overview',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (state.hasData && state.data!.dataset.isNotEmpty) ...[
            Text('Total Records: ${state.data!.dataset.length}'),
            const SizedBox(height: 8),
            const Text(
              'Sample Data:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Text(
                _generateDatasetPreview(state.data!.dataset),
                style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
              ),
            ),
          ] else
            const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text('No dataset available'),
              ),
            ),
        ],
      ),
    );
  }

  String _generateDatasetPreview(List<dynamic> dataset) {
    return dataset.take(3).map((record) {
      if (record is Map<String, dynamic>) {
        return record.entries
            .take(3)
            .map((e) => '${e.key}: ${e.value}')
            .join(', ');
      }
      return record.toString();
    }).join('\n');
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red[600]),
            const SizedBox(height: 16),
            Text(
              'Error Loading Dashboard',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red[700],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: TextStyle(fontSize: 14, color: Colors.red[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _refreshData,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 