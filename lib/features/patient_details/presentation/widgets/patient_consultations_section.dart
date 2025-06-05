import 'package:flutter/material.dart';
import 'package:foresight_care/domain/entities/patient_details.dart';

class PatientConsultationsSection extends StatelessWidget {
  final List<PatientConsultation> consultations;
  final bool isLoading;
  final String? error;
  final VoidCallback onRetry;

  const PatientConsultationsSection({
    super.key,
    required this.consultations,
    required this.isLoading,
    this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF13A4AB),
        ),
      );
    }

    if (error != null) {
      return _buildErrorWidget();
    }

    if (consultations.isEmpty) {
      return _buildEmptyWidget();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        final consultation = consultations[index];
        return _buildConsultationCard(consultation);
      },
    );
  }

  Widget _buildConsultationCard(PatientConsultation consultation) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9ECEF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with consultation number and risk level
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Consultation ${consultation.numConsult}',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF103459),
                    ),
                  ),
                ),
                if (consultation.predictionGeneree && consultation.predictionRisque != null)
                  _buildRiskChip(consultation.predictionRisque!),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Doctor information
            Row(
              children: [
                const Icon(
                  Icons.person_outline,
                  size: 16,
                  color: Color(0xFF6C757D),
                ),
                const SizedBox(width: 8),
                Text(
                  'Dr. ${consultation.doctorFullName}',
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF495057),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Date
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Color(0xFF6C757D),
                ),
                const SizedBox(width: 8),
                Text(
                  consultation.formattedDate,
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF495057),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Diagnostic
            Row(
              children: [
                const Icon(
                  Icons.medical_services_outlined,
                  size: 16,
                  color: Color(0xFF6C757D),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Diagnostic: ${consultation.diagnosticDisplay}',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF495057),
                    ),
                  ),
                ),
              ],
            ),
            
            // Remarks if available
            if (consultation.remarque != null && consultation.remarque!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.note_outlined,
                    size: 16,
                    color: Color(0xFF6C757D),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Remarques: ${consultation.remarque}',
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xFF6C757D),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            
            // Psychiatric history indicators
            const SizedBox(height: 12),
            _buildPsychiatricHistory(consultation),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskChip(String riskLevel) {
    Color backgroundColor;
    Color textColor;
    IconData icon;
    
    switch (riskLevel.toLowerCase()) {
      case 'élevé':
      case 'eleve':
        backgroundColor = Colors.red[100]!;
        textColor = Colors.red[800]!;
        icon = Icons.warning;
        break;
      case 'moyen':
        backgroundColor = Colors.orange[100]!;
        textColor = Colors.orange[800]!;
        icon = Icons.info;
        break;
      case 'faible':
        backgroundColor = Colors.green[100]!;
        textColor = Colors.green[800]!;
        icon = Icons.check_circle;
        break;
      default:
        backgroundColor = Colors.grey[100]!;
        textColor = Colors.grey[800]!;
        icon = Icons.help;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: textColor,
          ),
          const SizedBox(width: 4),
          Text(
            'Risque $riskLevel',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
              fontSize: 10,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPsychiatricHistory(PatientConsultation consultation) {
    final indicators = <Widget>[];
    
    if (consultation.addiction) {
      indicators.add(_buildIndicator('Addiction', Colors.red));
    }
    if (consultation.tabac) {
      indicators.add(_buildIndicator('Tabac', Colors.orange));
    }
    if (consultation.alcool) {
      indicators.add(_buildIndicator('Alcool', Colors.purple));
    }
    if (consultation.cannabis) {
      indicators.add(_buildIndicator('Cannabis', Colors.green));
    }
    if (consultation.atcdsPTs) {
      indicators.add(_buildIndicator('Antécédents TS', Colors.red));
    }
    if (consultation.ideesSuiAnt) {
      indicators.add(_buildIndicator('Idées suicidaires', Colors.red));
    }
    if (consultation.hospitAnt) {
      indicators.add(_buildIndicator('Hospitalisation', Colors.blue));
    }
    if (consultation.etatdepressif) {
      indicators.add(_buildIndicator('État dépressif', Colors.indigo));
    }

    if (indicators.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Historique psychiatrique:',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Color(0xFF6C757D),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: indicators,
        ),
      ],
    );
  }

  Widget _buildIndicator(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: color.withOpacity(0.8),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[300],
            ),
            const SizedBox(height: 16),
            Text(
              'Erreur de chargement',
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFF393C3C),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error ?? 'Une erreur est survenue',
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
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF13A4AB),
                foregroundColor: Colors.white,
              ),
              child: const Text('Réessayer'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
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
              'Aucune consultation',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Aucune consultation trouvée pour ce patient.',
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
      ),
    );
  }
} 