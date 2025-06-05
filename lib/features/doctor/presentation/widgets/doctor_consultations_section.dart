import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/doctor/presentation/providers/doctor_consultations_provider.dart';
import 'package:foresight_care/domain/entities/consultation.dart';
import 'package:foresight_care/features/consultation/presentation/widgets/consultation_form_modal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math' as math;

class DoctorConsultationsSection extends ConsumerStatefulWidget {
  const DoctorConsultationsSection({super.key});

  @override
  ConsumerState<DoctorConsultationsSection> createState() =>
      _DoctorConsultationsSectionState();
}

class _DoctorConsultationsSectionState
    extends ConsumerState<DoctorConsultationsSection> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final consultationsState = ref.watch(doctorConsultationsProvider);
    final consultationsNotifier = ref.read(
      doctorConsultationsProvider.notifier,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with title and count
        Row(
          children: [
            const Icon(
              Icons.medical_services_outlined,
              color: Color(0xFF13A4AB),
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              'Consultations',
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Color(0xFF103459),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF13A4AB).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${consultationsState.filteredConsultations.length} consultations',
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xFF13A4AB),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Search and filter bar
        Row(
          children: [
            // Search field
            Expanded(
              flex: 2,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE9ECEF)),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) =>
                      consultationsNotifier.searchConsultations(value),
                  decoration: const InputDecoration(
                    hintText: 'Rechercher une consultation...',
                    hintStyle: TextStyle(
                      fontFamily: 'League Spartan',
                      color: Color(0xFF6C757D),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF6C757D),
                      size: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Risk filter dropdown
            Expanded(
              flex: 1,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE9ECEF)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: consultationsState.selectedRiskFilter,
                    onChanged: (value) =>
                        consultationsNotifier.filterByRisk(value ?? 'all'),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    icon: const Icon(
                      Icons.filter_list,
                      color: Color(0xFF6C757D),
                      size: 10,
                    ),
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      color: Color(0xFF495057),
                      fontSize: 14,
                    ),
                    items: const [
                      DropdownMenuItem(value: 'all', child: Text('Tous')),
                      DropdownMenuItem(value: 'eleve', child: Text('Élevé')),
                      DropdownMenuItem(value: 'moyen', child: Text('Moyen')),
                      DropdownMenuItem(value: 'faible', child: Text('Faible')),
                    ],
                  ),
                ),
              ),
            ),

            // Refresh button
            const SizedBox(width: 12),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: const Color(0xFF13A4AB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () => consultationsNotifier.refreshConsultations(),
                icon: const Icon(Icons.refresh, color: Colors.white, size: 20),
                tooltip: 'Actualiser',
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Content area
        Expanded(
          child: consultationsState.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Color(0xFF13A4AB)),
                )
              : consultationsState.error != null
              ? _buildErrorWidget(
                  consultationsState.error!,
                  consultationsNotifier,
                )
              : consultationsState.filteredConsultations.isEmpty
              ? _buildEmptyWidget()
              : _buildConsultationsList(
                  consultationsState.filteredConsultations,
                ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(String error, DoctorConsultationsNotifier notifier) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            'Erreur',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color(0xFF393C3C),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF717171),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => notifier.refreshConsultations(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF13A4AB),
              foregroundColor: Colors.white,
            ),
            child: const Text('Réessayer'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_services_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucune consultation trouvée',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Aucune consultation ne correspond à vos critères de recherche.',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildConsultationsList(List<Consultation> consultations) {
    return ListView.builder(
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        final consultation = consultations[index];
        return _buildConsultationCard(consultation);
      },
    );
  }

  Widget _buildConsultationCard(Consultation consultation) {
    final predictionResults = consultation.predictionResults;
    final bool hasPrediction = consultation.predictionGeneree && predictionResults != null;

    // Extract prediction data dynamically
    final List<String> features = hasPrediction ? predictionResults!.features : [];
    final List<dynamic> values = hasPrediction ? predictionResults!.values : [];
    final List<double> contributions = hasPrediction ? predictionResults!.contributions : [];
    final double probability = hasPrediction ? predictionResults!.proba : 0.0;
    final String prediction = hasPrediction ? predictionResults!.ypredOriginal : 'Non disponible';

    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9ECEF)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x11000000),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Risk chip
                _buildRiskChip(consultation.riskLevel),
                const SizedBox(width: 12),
                // Title & subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${consultation.numConsult}',
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF103459),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${consultation.patientFullName}',
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontSize: 12, 
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ),
                // Date and info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      consultation.formattedDate,
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 11,
                        color: Color(0xFF757575),
                      ),
                    ),
                    Text(
                      consultation.diagnosticDisplay,
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 10,
                        color: Color(0xFF757575),
                      ),
                    ),
                    Text(
                      'CIN: ${consultation.patientCin}',
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 10,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 🔥 AI PREDICTION VISUALIZATION (replacing image)
          if (hasPrediction) ...[
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade50,
                    Colors.purple.shade50,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔥 THANOS CIRCULAR DIAGRAM
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // 🛸 ALIEN COSMIC BACKGROUND
                          Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  const Color(0xFF0F0F23).withOpacity(0.1),
                                  const Color(0xFF1A1A2E).withOpacity(0.2),
                                  const Color(0xFF16213E).withOpacity(0.3),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF6C63FF).withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 0),
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                          
                          // 🛸 DYNAMIC ALIEN CONTRIBUTION ARCS
                          ...List.generate(features.length, (index) {
                            if (index >= values.length || index >= contributions.length) {
                              return const SizedBox.shrink();
                            }
                            
                            final contribution = contributions[index];
                            final isPositive = contribution >= 0;
                            final normalizedValue = (contribution.abs() / 0.1).clamp(0.0, 1.0);
                            final startAngle = (index * 2 * math.pi / features.length) - math.pi / 2;
                            final sweepAngle = 2 * math.pi / features.length * 0.8;
                            
                            // 🛸 ALIEN COLOR SYSTEM - Each feature gets unique cosmic color
                            final alienColor = _getAlienColor(index, features.length);
                            
                            return CustomPaint(
                              size: const Size(180, 180),
                              painter: ContributionArcPainter(
                                startAngle: startAngle,
                                sweepAngle: sweepAngle,
                                progress: normalizedValue,
                                color: alienColor,
                                isPositive: isPositive,
                                featureIndex: index,
                              ),
                            );
                          }),
                          
                          // 🛸 ALIEN CENTER HUB
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: prediction.toLowerCase().contains('suicide') && !prediction.toLowerCase().contains('nonsuicide')
                                  ? [
                                      // RED for Suicide prediction
                                      const Color(0xFFEF4444),
                                      const Color(0xFFDC2626),
                                      const Color(0xFFB91C1C),
                                    ]
                                  : [
                                      // BLUE for NonSuicide prediction
                                      const Color(0xFF3B82F6),
                                      const Color(0xFF1E40AF),
                                      const Color(0xFF1E3A8A),
                                    ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: prediction.toLowerCase().contains('suicide') && !prediction.toLowerCase().contains('nonsuicide')
                                    ? const Color(0xFFEF4444).withOpacity(0.4)
                                    : const Color(0xFF3B82F6).withOpacity(0.4),
                                  blurRadius: 12,
                                  offset: const Offset(0, 0),
                                ),
                                BoxShadow(
                                  color: prediction.toLowerCase().contains('suicide') && !prediction.toLowerCase().contains('nonsuicide')
                                    ? const Color(0xFFDC2626).withOpacity(0.3)
                                    : const Color(0xFF1E40AF).withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${(probability * 100).toStringAsFixed(2)}%',
                                  style: const TextStyle(
                                    fontFamily: 'League Spartan',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  prediction.toUpperCase(),
                                  style: const TextStyle(
                                    fontFamily: 'League Spartan',
                                    fontSize: 7,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // 🛸 ALIEN GLOW EFFECT
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  const Color(0xFF6C63FF).withOpacity(0.05),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // 🛸 ALIEN FEATURE LEGEND
                  ...List.generate(features.length, (index) {
                    if (index >= values.length || index >= contributions.length) {
                      return const SizedBox.shrink();
                    }
                    
                    final feature = features[index];
                    final value = values[index];
                    final contribution = contributions[index];
                    final isPositive = contribution >= 0;
                    final alienColor = _getAlienColor(index, features.length);
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.9),
                            alienColor.withOpacity(0.05),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: alienColor.withOpacity(0.4),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: alienColor.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // 🛸 ALIEN COLOR INDICATOR
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  alienColor,
                                  alienColor.withOpacity(0.7),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: alienColor.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '$feature: $value',
                              style: const TextStyle(
                                fontFamily: 'League Spartan',
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF103459),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  alienColor.withOpacity(0.1),
                                  alienColor.withOpacity(0.2),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: alienColor.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                                  size: 8,
                                  color: alienColor,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  '${isPositive ? '+' : ''}${contribution.toStringAsFixed(4)}',
                                  style: TextStyle(
                                    fontFamily: 'League Spartan',
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: alienColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ] else if (consultation.predictionGeneree) ...[
            // Show processing state
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.hourglass_empty, size: 20, color: Colors.amber[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Prédiction en cours de traitement...',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 12,
                      color: Colors.amber[700],
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            // Show no prediction state
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.psychology_outlined, size: 20, color: Colors.grey[500]),
                  const SizedBox(width: 8),
                  Text(
                    'Aucune prédiction disponible',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 16),

          // Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _generateAIPrediction(consultation),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF13A4AB),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                        const Text(
                          "PRÉDICTION AI",
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _showEditConsultationForm(consultation),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFF13A4AB)),
                    ),
                    child: const Text(
                      "MODIFIER",
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        color: Color(0xFF13A4AB),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => _showConsultationDetails(consultation),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF13A4AB)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskChip(String riskLevel) {
    final riskInfo = _getRiskInfo(riskLevel);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: riskInfo['color'].withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(riskInfo['icon'], size: 12, color: riskInfo['color']),
          const SizedBox(width: 4),
          Text(
            riskLevel,
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: riskInfo['color'],
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getRiskInfo(String riskLevel) {
    final risk = riskLevel.toLowerCase();
    if (risk.contains('élevé') ||
        risk.contains('eleve') ||
        risk.contains('high')) {
      return {'color': Colors.red, 'icon': Icons.warning};
    } else if (risk.contains('moyen') || risk.contains('medium')) {
      return {'color': Colors.orange, 'icon': Icons.warning_amber};
    } else if (risk.contains('faible') || risk.contains('low')) {
      return {'color': Colors.green, 'icon': Icons.check_circle_outline};
    } else {
      return {'color': Colors.grey, 'icon': Icons.help_outline};
    }
  }

  Color _getRiskColor(String riskLevel) {
    final risk = riskLevel.toLowerCase();
    if (risk.contains('élevé') ||
        risk.contains('eleve') ||
        risk.contains('high')) {
      return Colors.red;
    } else if (risk.contains('moyen') || risk.contains('medium')) {
      return Colors.orange;
    } else if (risk.contains('faible') || risk.contains('low')) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  void _showConsultationDetails(Consultation consultation) {
    String _formatDate(String dateStr) {
      try {
        final date = DateTime.parse(dateStr);
        return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
      } catch (e) {
        return dateStr;
      }
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${consultation.numConsult}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 13, 128, 130),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 📋 BASIC INFORMATION
                      _buildSection('📋 Informations générales', [
                        _buildDetailRow(
                          'ID Consultation',
                          consultation.id ?? 'N/A',
                        ),
                        _buildDetailRow('Numéro', consultation.numConsult),
                        _buildDetailRow(
                          'Date et heure',
                          consultation.formattedDate,
                        ),
                        _buildDetailRow(
                          'Numéro dossier',
                          consultation.numDossier?.id ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Remarques',
                          consultation.remarque ?? 'Aucune',
                        ),
                      ]),

                      // 👨‍⚕️ DOCTOR INFORMATION
                      _buildSection('👨‍⚕️ Médecin', [
                        _buildDetailRow('Nom', consultation.nomMed ?? 'N/A'),
                        _buildDetailRow(
                          'Prénom',
                          consultation.prenMed ?? 'N/A',
                        ),
                        _buildDetailRow('ID', consultation.idMed ?? 'N/A'),
                      ]),

                      // 👤 PATIENT INFORMATION
                      _buildSection('👤 Patient', [
                        _buildDetailRow(
                          'Nom complet',
                          consultation.patientFullName,
                        ),
                        _buildDetailRow('CIN/CNAM', consultation.patientCin),
                        _buildDetailRow(
                          'Date de naissance',
                          _formatDate(consultation.dateNaiss ?? 'N/A'),
                        ),
                        _buildDetailRow('Âge', consultation.ageInt ?? 'N/A'),
                        _buildDetailRow('Sexe', consultation.sexe ?? 'N/A'),
                        _buildDetailRow(
                          'Origine',
                          consultation.origine ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Type profession',
                          consultation.typeProf ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Niveau socio-économique',
                          consultation.nvSocioeconomique ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Téléphone',
                          consultation.telephone?.toString() ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'État civil',
                          consultation.etatcivil ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Lieu de résidence',
                          consultation.lieuderesidence ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Ville de résidence',
                          consultation.villederesidence ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Niveau scolaire',
                          consultation.nvscolaire ?? 'N/A',
                        ),
                      ]),

                      //  ADDICTIONS
                      _buildSection(' Addictions', [
                        _buildBooleanDetail(
                          'Addiction générale',
                          consultation.addiction,
                        ),
                        _buildBooleanDetail('Tabac', consultation.tabac),
                        _buildBooleanDetail('Alcool', consultation.alcool),
                        _buildBooleanDetail('Cannabis', consultation.cannabis),
                        _buildBooleanDetail(
                          'Médicaments',
                          consultation.medicaments,
                        ),
                        _buildBooleanDetail(
                          'Solvants organiques',
                          consultation.solvantsorg,
                        ),
                      ]),

                      //  ANTÉCÉDENTS PSYCHIATRIQUES
                      _buildSection(' Antécédents psychiatriques', [
                        _buildBooleanDetail(
                          'Tentatives de suicide (AtcdsP_TS)',
                          consultation.atcdsPTs,
                        ),
                        _buildBooleanDetail(
                          'Idées suicidaires antérieures',
                          consultation.ideesSuiAnt,
                        ),
                        _buildBooleanDetail(
                          'Hospitalisation antérieure',
                          consultation.hospitAnt,
                        ),
                        _buildBooleanDetail(
                          'Antécédents familiaux de suicide',
                          consultation.atcdsFamSui,
                        ),
                        _buildBooleanDetail(
                          'Suicide accompli',
                          consultation.suicideAccompli,
                        ),
                        _buildBooleanDetail(
                          'AtcdsP somatique',
                          consultation.atcdsPSomatik,
                        ),
                        _buildBooleanDetail(
                          'Conduite impulsive',
                          consultation.condImpulsiv,
                        ),
                        _buildBooleanDetail(
                          'Auto-mutilation',
                          consultation.automil,
                        ),
                        _buildBooleanDetail(
                          'Antécédents judiciaires',
                          consultation.atcdsPJudic,
                        ),
                        _buildDetailRow(
                          'Type antécédents psy',
                          consultation.typeAtcdsPsy?.name ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Nombre hospitalisations',
                          consultation.nombresHospit ?? 'N/A',
                        ),
                        _buildBooleanDetail(
                          'Famille contenante',
                          consultation.familleContenante,
                        ),
                      ]),

                      //  MÉTHODES DE TENTATIVES DE SUICIDE
                      _buildSection(' Méthodes de tentatives de suicide', [
                        _buildBooleanDetail(
                          'Immolation',
                          consultation.immolation,
                        ),
                        _buildBooleanDetail(
                          'Phlébotomie',
                          consultation.moyenphlebotomie,
                        ),
                        _buildBooleanDetail(
                          'Pendaison',
                          consultation.mpendaison,
                        ),
                        _buildBooleanDetail(
                          'Médicaments',
                          consultation.mmedicaments,
                        ),
                        _buildBooleanDetail(
                          'Strangulation',
                          consultation.mstrangulation ?? false,
                        ),
                        _buildBooleanDetail(
                          'Ingestion toxique',
                          consultation.mingestiontox,
                        ),
                        _buildBooleanDetail(
                          'EQUI suicide',
                          consultation.equiSui,
                        ),
                        _buildBooleanDetail(
                          'Saut en altitude',
                          consultation.sautaltitude,
                        ),
                        _buildBooleanDetail(
                          'Autres méthodes',
                          consultation.mautres,
                        ),
                      ]),

                      //  ÉVALUATION CLINIQUE
                      _buildSection(' Évaluation clinique', [
                        _buildDetailRow(
                          'Diagnostic retenu',
                          consultation.diagnosticRetenu?.name ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Type personnalité',
                          consultation.typePersonn?.name ?? 'N/A',
                        ),
                        _buildBooleanDetail(
                          'Réaction au stress',
                          consultation.reactionStress,
                        ),
                        _buildBooleanDetail(
                          'Injonctions suicidaires',
                          consultation.injoncSuicidaires,
                        ),
                        _buildBooleanDetail(
                          'Angoisse psychotique',
                          consultation.angoissePsychotique,
                        ),
                        _buildBooleanDetail(
                          'État dépressif',
                          consultation.etatdepressif,
                        ),
                      ]),

                      //  STATISTIQUES
                      _buildSection(' Statistiques', [
                        _buildDetailRow(
                          'Nombre de tentatives de suicide',
                          consultation.nbresDeTs ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Ancienneté maladie',
                          consultation.ancienneteMaladie ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Âge de début',
                          consultation.ageDebutAnne ?? 'N/A',
                        ),
                        _buildBooleanDetail('Motif TS', consultation.motifTs),
                      ]),

                      //  PRÉDICTION
                      if (consultation.predictionGeneree) ...[
                        _buildSection(' Prédiction', [
                          _buildDetailRow(
                            'Risque prédit',
                            consultation.predictionRisque ?? 'N/A',
                          ),
                          _buildDetailRow(
                            'Prédiction générée',
                            consultation.predictionGeneree ? 'Oui' : 'Non',
                          ),
                        ]),
                      ],

                      //  MÉTADONNÉES
                      _buildSection('Données Système', [
                        _buildDetailRow(
                          'Créé le',
                          consultation.createdAt?.toString() ?? 'N/A',
                        ),
                        _buildDetailRow(
                          'Modifié le',
                          consultation.updatedAt?.toString() ?? 'N/A',
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🛸 ALIEN EDIT CONSULTATION METHOD
  void _showEditConsultationForm(Consultation consultation) async {
    debugPrint(
      '[EDIT_CONSULTATION] Opening edit form for consultation: ${consultation.id}',
    );
    debugPrint('[EDIT_CONSULTATION] Patient: ${consultation.patientFullName}');

    final result = await showDialog<bool>(
      context: context,
      builder: (context) =>
          ConsultationFormModal(consultation: consultation, isEdit: true),
    );

    debugPrint('[EDIT_CONSULTATION] Dialog result: $result');

    // If consultation was updated successfully, refresh the consultations list
    if (result == true && mounted) {
      debugPrint('[EDIT_CONSULTATION] Refreshing consultations list...');
      ref.read(doctorConsultationsProvider.notifier).fetchConsultations();
    }
  }

  // Helper method to build sections
  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF2E5BFF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF2E5BFF).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E5BFF),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200, width: 1),
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }

  Widget _buildBooleanDetail(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(
            value ? Icons.check_circle : Icons.cancel,
            size: 16,
            color: value ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // 🛸 ALIEN AI PREDICTION METHODS

  /// Generates AI prediction for a consultation
  Future<void> _generateAIPrediction(Consultation consultation) async {
    debugPrint(
      '[AI_PREDICTION] 🛸 Starting AI prediction for consultation: ${consultation.id}',
    );

    try {
      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(color: Color(0xFF13A4AB)),
        ),
      );

      // Prepare consultation JSON body

      // 🛸 ALIEN MULTI-ENVIRONMENT API ENDPOINT CONFIGURATION
      // Use different URLs based on the environment
      final apiUrls = [
        'http://10.0.2.2:5000/get-result', // Android Emulator
        'http://127.0.0.1:5000/get-result', // Local development
        'http://localhost:5000/get-result', // Alternative local
      ];

      http.Response? response;
      String? successUrl;

      // Try each URL until one works
      for (final url in apiUrls) {
        try {
          debugPrint('[AI_PREDICTION] 🔗 Trying URL: $url');

          response = await http
              .get(
                Uri.parse(url + "?_id=${consultation.id}&type=photo"),
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'image/png',
                },
              )
              .timeout(const Duration(seconds: 10));

          if (response.statusCode == 200) {
            successUrl = url;
            debugPrint('[AI_PREDICTION] ✅ Successfully connected to: $url');
            break;
          }
        } catch (e) {
          debugPrint('[AI_PREDICTION] ❌ Failed to connect to $url: $e');
          continue;
        }
      }

      // Close loading dialog
      if (mounted) Navigator.of(context).pop();

      if (response != null &&
          response.statusCode == 200 &&
          successUrl != null) {
        debugPrint(
          '[AI_PREDICTION] ✅ Prediction successful from $successUrl, showing image',
        );
        // Display the prediction image
        _showPredictionImageDialog(response.bodyBytes);
      } else {
        final errorMsg = response != null
            ? 'Erreur API: ${response.statusCode} - ${response.body}'
            : 'Impossible de se connecter au serveur Flask. Assurez-vous qu\'il est démarré sur le port 5000.';
        debugPrint('[AI_PREDICTION] ❌ $errorMsg');
        _showErrorDialog(errorMsg);
      }
    } catch (e) {
      debugPrint('[AI_PREDICTION] ❌ Exception: $e');
      // Close loading dialog if still open
      if (mounted) Navigator.of(context).pop();
      _showErrorDialog(
        'Erreur de connexion: $e\n\nVérifiez que le serveur Flask est démarré.',
      );
    }
  }

  /// Prepares consultation JSON for AI prediction API
  Map<String, dynamic> _prepareConsultationJsonForAI(
    Consultation consultation,
  ) {
    debugPrint('[AI_PREDICTION] 🛸 Preparing consultation data for AI...');

    // 🛸 ALIEN DATA VALIDATION - Ensure all required fields have valid values
    final safeNombresHospit = consultation.nombresHospit ?? '0';
    final safeNbresDeTs = consultation.nbresDeTs ?? '0';
    final safeAncienneteMaladie = consultation.ancienneteMaladie ?? '0-1';
    final safeAgeDebutAnne = consultation.ageDebutAnne ?? '13-18';

    // Map age debut values to AI model expected format
    String aiAgeDebutValue;
    switch (safeAgeDebutAnne) {
      case '0-5':
      case '6-12':
      case '13-18':
        aiAgeDebutValue = '<=17';
        break;
      case '19-25':
      case '26-40':
        aiAgeDebutValue = '18-40';
        break;
      case '41-60':
        aiAgeDebutValue = '41-60';
        break;
      case '>60':
        aiAgeDebutValue = '>60';
        break;
      default:
        aiAgeDebutValue = '<=17';
    }

    // Map anciennete maladie values to AI model expected format
    String aiAncienneteMaladieValue;
    switch (safeAncienneteMaladie) {
      case '0-1':
        aiAncienneteMaladieValue = '0';
        break;
      case '2-5':
        aiAncienneteMaladieValue = '<=5';
        break;
      case '6-10':
        aiAncienneteMaladieValue = '6-10';
        break;
      case '11-20':
        aiAncienneteMaladieValue = '11-20';
        break;
      case '>20':
        aiAncienneteMaladieValue = '>20';
        break;
      default:
        aiAncienneteMaladieValue = '0';
    }

    debugPrint('[AI_PREDICTION] 🔧 Data validation:');
    debugPrint(
      '  - nombresHospit: ${consultation.nombresHospit} → $safeNombresHospit',
    );
    debugPrint(
      '  - ageDebutAnne: ${consultation.ageDebutAnne} → $aiAgeDebutValue',
    );
    debugPrint(
      '  - ancienneteMaladie: ${consultation.ancienneteMaladie} → $aiAncienneteMaladieValue',
    );

    // Create base JSON from consultation
    final consultationJson = <String, dynamic>{
      '_id': {'\$oid': consultation.id ?? ''},
      'num_consult': consultation.numConsult ?? '',
      'num_dossier': {'\$oid': consultation.numDossier?.id ?? ''},
      'id_med': {'\$oid': consultation.idMed ?? ''},
      'date_heure': {
        '\$date':
            consultation.createdAt?.toIso8601String() ??
            DateTime.now().toIso8601String(),
      },

      // 🚬 ADDICTION FIELDS
      'addiction': consultation.addiction ?? false,
      'TABAC': consultation.tabac ?? false,
      'alcool': consultation.alcool ?? false,
      'cannabis': consultation.cannabis ?? false,
      'medicaments': consultation.medicaments ?? false,
      'solvantsorg': consultation.solvantsorg ?? false,

      // 🧠 PSYCHIATRIC HISTORY
      'AtcdsP_TS': consultation.atcdsPTs ?? false,
      'idees_sui_ant': consultation.ideesSuiAnt ?? false,
      'hospit_ant': consultation.hospitAnt ?? false,
      'atcdsFam_SUI': consultation.atcdsFamSui ?? false,
      'suicide_accompli': consultation.suicideAccompli ?? false,
      'AtcdsP_somatik': consultation.atcdsPSomatik ?? false,
      'cond_impulsiv': consultation.condImpulsiv ?? false,
      'automit': consultation.automil ?? false, // Fixed: automil → automit
      'atcds_p_judic': consultation.atcdsPJudic ?? false,

      // ⚕️ SUICIDE METHODS
      'immolation': consultation.immolation ?? false,
      'moyenphlebotomie': consultation.moyenphlebotomie ?? false,
      'Mpendaison': consultation.mpendaison ?? false,
      'Mmedicaments': consultation.mmedicaments ?? false,
      'Mstrangulation': consultation.mstrangulation ?? false,
      'Mingestiontox': consultation.mingestiontox ?? false,
      'EQUIsui': consultation.equiSui ?? false,
      'sautaltitude': consultation.sautaltitude ?? false,
      'Mautres': consultation.mautres ?? false,

      // 🏥 CLINICAL ASSESSMENT - Using AI model expected values
      'nombres_hospit': safeNombresHospit,
      'famille_contenante': consultation.familleContenante ?? false,
      'type_atcdspsy':
        consultation.typeAtcdsPsy ?? 'aucune',
      'diagnostic_retenu':
          consultation.diagnosticRetenu ?? 'autre',
      'type_personn': consultation.typePersonn ?? 'PAS',
      'reaction_stress': consultation.reactionStress ?? false,
      'injonc_suicidaires': consultation.injoncSuicidaires ?? false,
      'angoisse_psychotique': consultation.angoissePsychotique ?? false,
      'etatdepressif': consultation.etatdepressif ?? false,

      // 📊 STATISTICS - Using validated values
      'nbres_de_ts': safeNbresDeTs,
      'anciennetemaladie': aiAncienneteMaladieValue,
      'agedebutannee': aiAgeDebutValue, // Fixed: with proper AI model value
      'motifTS': consultation.motifTs ?? false,
      'remarque': consultation.remarque ?? '',

      // 👤 PATIENT INFO
      'nom_patient': consultation.nomPatient ?? '',
      'pren_patient': consultation.prenPatient ?? '',
      'cin_cnam': consultation.cinCnam ?? 0,
      'date_naiss': {
        '\$date': consultation.dateNaiss ?? DateTime.now().toIso8601String(),
      },
      'age_int': consultation.ageInt ?? '',
      'sexe': consultation.sexe ?? '',
      'origine': consultation.origine ?? '',
      'type_prof': consultation.typeProf ?? '',
      'nv_socioeconomique': consultation.nvSocioeconomique ?? '',
      'id_sec': consultation.idSec ?? '',

      // 👨‍⚕️ DOCTOR INFO
      'nom_med': consultation.nomMed ?? '',
      'pren_med': consultation.prenMed ?? '',

      // 📅 METADATA
      'createdAt': {
        '\$date':
            consultation.createdAt?.toIso8601String() ??
            DateTime.now().toIso8601String(),
      },
      'updatedAt': {
        '\$date':
            consultation.updatedAt?.toIso8601String() ??
            DateTime.now().toIso8601String(),
      },
      '__v': 0,
      'prediction_generee': consultation.predictionGeneree ?? false,
    };

    debugPrint(
      '[AI_PREDICTION] ✅ Final JSON prepared with ${consultationJson.keys.length} fields',
    );
    return consultationJson;
  }

  /// Maps enum values to AI model expected strings


  /// Shows the prediction image in a dialog
  void _showPredictionImageDialog(Uint8List imageBytes) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(
          10,
        ), // 🔥 THANOS: Minimal padding for maximum space
        child: Container(
          width:
              MediaQuery.of(context).size.width *
              0.95, // 🔥 THANOS: 95% width instead of 90%
          height:
              MediaQuery.of(context).size.height *
              0.85, // 🔥 THANOS: 85% height for massive image
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // Header with enhanced styling
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFF13A4AB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 28, // 🔥 THANOS: Larger icon
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Résultat de la Prédiction AI',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w700, // 🔥 THANOS: Bolder text
                          fontSize: 20, // 🔥 THANOS: Larger text
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 28, // 🔥 THANOS: Larger close button
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🔥 THANOS MEGA IMAGE CONTAINER
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: InteractiveViewer(
                        // 🔥 THANOS: Add zoom/pan functionality
                        panEnabled: true,
                        scaleEnabled: true,
                        minScale: 0.5,
                        maxScale: 4.0,
                        child: Center(
                          child: Image.memory(
                            imageBytes,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit
                                .contain, // 🔥 THANOS: Contain for full visibility
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.red[200]!),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      size: 64,
                                      color: Colors.red[400],
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Erreur d\'affichage de l\'image',
                                      style: TextStyle(
                                        fontFamily: 'League Spartan',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red[700],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Impossible de charger la prédiction AI',
                                      style: TextStyle(
                                        fontFamily: 'League Spartan',
                                        fontSize: 14,
                                        color: Colors.red[600],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 🔥 THANOS ENHANCED FOOTER
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border(top: BorderSide(color: Colors.grey[200]!)),
                ),
                child: Column(
                  children: [
                    // Zoom instructions
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF13A4AB).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFF13A4AB).withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.zoom_in,
                            size: 16,
                            color: const Color(0xFF13A4AB),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Pincez pour zoomer • Glissez pour naviguer',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF13A4AB),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Info section
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.info_outline,
                            size: 20,
                            color: Colors.blue[600],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Cette prédiction est générée par intelligence artificielle à des fins d\'aide au diagnostic médical.',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Shows error dialog for AI prediction failures
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red[600], size: 24),
            const SizedBox(width: 12),
            const Text(
              'Erreur AI',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: const TextStyle(fontFamily: 'League Spartan', fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Fermer',
              style: TextStyle(
                fontFamily: 'League Spartan',
                color: Color(0xFF13A4AB),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getAlienColor(int index, int length) {
    // 🛸 ALIEN COSMIC COLOR PALETTE
    final List<Color> alienColors = [
      const Color(0xFF6C63FF), // Cosmic Purple
      const Color(0xFF00D4AA), // Alien Teal
      const Color(0xFFFF6B6B), // Martian Red
      const Color(0xFF4ECDC4), // Neptune Blue
      const Color.fromARGB(255, 128, 112, 30), // Solar Yellow
      const Color(0xFF95E1D3), // Alien Green
      const Color(0xFF8B5FBF), // Deep Space Purple
      const Color(0xFF3BCEAC), // Galactic Cyan
      const Color(0xFFFF8B94), // Nebula Pink
      const Color(0xFF6C7B7F), // Asteroid Grey
      const Color(0xFFFFAB91), // Mercury Orange
      const Color(0xFF81C784), // Terrestrial Green
      const Color(0xFF64B5F6), // Sky Blue
      const Color(0xFFBA68C8), // Cosmic Magenta
      const Color(0xFFFFB74D), // Star Gold
    ];
    
    // Return color based on index, cycling through if more features than colors
    return alienColors[index % alienColors.length];
  }
}

// 🔥 THANOS CIRCULAR CONTRIBUTION ARC PAINTER
class ContributionArcPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final double progress;
  final Color color;
  final bool isPositive;
  final int featureIndex;

  ContributionArcPainter({
    required this.startAngle,
    required this.sweepAngle,
    required this.progress,
    required this.color,
    required this.isPositive,
    required this.featureIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    
    // Create gradient paint
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    // Create gradient shader
    final gradient = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + sweepAngle,
      colors: [
        color.withOpacity(0.3),
        color,
        color.withOpacity(0.8),
      ],
    );

    paint.shader = gradient.createShader(
      Rect.fromCircle(center: center, radius: radius - 20),
    );

    // Draw background arc (lighter)
    final backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..color = color.withOpacity(0.2)
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 20),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    // Draw progress arc
    final progressSweep = sweepAngle * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 20),
      startAngle,
      progressSweep,
      false,
      paint,
    );

    // Draw pulsing effect for high contributions
    if (progress > 0.7) {
      final pulseRadius = radius - 20 + (math.sin(DateTime.now().millisecond / 100) * 3);
      final pulsePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = color.withOpacity(0.5);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: pulseRadius),
        startAngle,
        progressSweep,
        false,
        pulsePaint,
      );
    }

    // Draw direction indicator
    if (progress > 0.1) {
      final indicatorAngle = startAngle + progressSweep / 2;
      final indicatorRadius = isPositive ? radius - 8 : radius - 32;
      final indicatorCenter = Offset(
        center.dx + math.cos(indicatorAngle) * indicatorRadius,
        center.dy + math.sin(indicatorAngle) * indicatorRadius,
      );

      final indicatorPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      canvas.drawCircle(indicatorCenter, 4, indicatorPaint);
      
      final innerIndicatorPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      canvas.drawCircle(indicatorCenter, 2, innerIndicatorPaint);
    }
  }

  @override
  bool shouldRepaint(ContributionArcPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.startAngle != startAngle ||
        oldDelegate.sweepAngle != sweepAngle ||
        oldDelegate.isPositive != isPositive ||
        oldDelegate.featureIndex != featureIndex;
  }
}
