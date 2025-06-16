import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ml_dashboard_provider.dart';

class DatasetTable extends ConsumerStatefulWidget {
  const DatasetTable({super.key});

  @override
  ConsumerState<DatasetTable> createState() => _DatasetTableState();
}

class _DatasetTableState extends ConsumerState<DatasetTable>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mlDashboardProvider);

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
          _buildHeader(state.data?.patientAnalyses.length ?? 0),
          const SizedBox(height: 16),
          TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF0066CC),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFF0066CC),
            tabs: const [
              Tab(text: 'Dataset'),
              Tab(text: 'Filters'),
              Tab(text: 'Predictions'),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                if (state.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (state.hasError)
                  _buildErrorWidget(state.error ?? 'Unknown error')
                else
                  _buildDatasetTab(state.data?.dataset ?? []),
                _buildFiltersTab(),
                if (state.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (state.hasError)
                  _buildErrorWidget(state.error ?? 'Unknown error')
                else
                  _buildPredictionsTab(state.data?.patientAnalyses ?? []),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(int patientCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dataset Explorer',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Browse dataset and patient predictions ($patientCount patients)',
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

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: Colors.red[400],
          ),
          const SizedBox(height: 16),
          Text(
            error,
            style: TextStyle(
              fontSize: 16,
              color: Colors.red[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDatasetTab(List<Map<String, dynamic>> dataset) {
    if (dataset.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.table_chart,
              size: 48,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No dataset available',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    final headers = dataset.first.keys.toList();
    
    return SingleChildScrollView(
      child: Column(
        children: [
          // Headers
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: headers.take(6).map((header) => Expanded(
                child: Text(
                  header,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )).toList(),
            ),
          ),
          const SizedBox(height: 8),
          // Data rows
          ...dataset.take(50).map((row) => Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: headers.take(6).map((header) {
                final value = row[header]?.toString() ?? 'N/A';
                return Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            ),
          )),
          if (dataset.length > 50)
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Showing first 50 rows of ${dataset.length} total rows',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFiltersTab() {
    final filter = ref.watch(mlDashboardProvider).filter;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilterSection(
            'Selected Patient',
            filter.selectedPatientId ?? 'None',
            Icons.person,
          ),
          const SizedBox(height: 24),
          _buildFilterSection(
            'Selected Feature',
            filter.selectedFeature ?? 'None',
            Icons.analytics,
          ),
          const SizedBox(height: 24),
          _buildSliderFilter(
            'Threshold',
            filter.threshold,
            0.0,
            1.0,
            (value) => ref.read(mlDashboardProvider.notifier).setThreshold(value),
          ),
          const SizedBox(height: 24),
          _buildSliderFilter(
            'Max Features',
            filter.maxFeatures.toDouble(),
            5.0,
            20.0,
            (value) => ref.read(mlDashboardProvider.notifier).setMaxFeatures(value.round()),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
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

  Widget _buildSliderFilter(
    String title,
    double value,
    double min,
    double max,
    Function(double) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ${value.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: ((max - min) * 10).round(),
            activeColor: const Color(0xFF0066CC),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildPredictionsTab(List<PatientAnalysis> analyses) {
    if (analyses.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.psychology,
              size: 48,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No predictions available',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: analyses.length,
      itemBuilder: (context, index) {
        final analysis = analyses[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: analysis.prediction == 1 
                ? Colors.red.withValues(alpha: 0.05)
                : Colors.green.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: analysis.prediction == 1 
                  ? Colors.red.withValues(alpha: 0.2)
                  : Colors.green.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    analysis.prediction == 1 ? Icons.warning : Icons.check_circle,
                    color: analysis.prediction == 1 ? Colors.red : Colors.green,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Patient ${analysis.patientId}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: analysis.prediction == 1 ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      analysis.riskLevel,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Probability: ${(analysis.probability * 100).toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                ),
              ),
              if (analysis.contributions.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  'Top Contributing Features:',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                ...analysis.contributions.take(3).map((contrib) => Text(
                  '• ${contrib.displayName ?? contrib.feature}: ${contrib.contribution.toStringAsFixed(3)}',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                )),
              ],
            ],
          ),
        );
      },
    );
  }
} 