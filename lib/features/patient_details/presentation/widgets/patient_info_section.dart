import 'package:flutter/material.dart';
import 'package:foresight_care/domain/entities/patient_details.dart';

class PatientInfoSection extends StatelessWidget {
  final PatientDetails patientDetails;

  const PatientInfoSection({
    super.key,
    required this.patientDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 8,
            color: const Color(0xFFD6D6D6).withOpacity(0.15),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: patientDetails.sexe == PatientGender.feminin
                        ? Colors.pink[100]
                        : Colors.blue[100],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    patientDetails.sexe == PatientGender.feminin
                        ? Icons.woman
                        : Icons.man,
                    color: patientDetails.sexe == PatientGender.feminin
                        ? Colors.pink[600]
                        : Colors.blue[600],
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patientDetails.fullName,
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xFF103459),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Dossier: ${patientDetails.numDossier}',
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF6C757D),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Patient Information Grid
            _buildInfoGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoGrid() {
    return Column(
      children: [
        // Row 1: CIN and Phone
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'CIN',
                patientDetails.cinCnam.toString(),
                Icons.badge_outlined,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildInfoItem(
                'Téléphone',
                patientDetails.formattedPhone,
                Icons.phone_outlined,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Row 2: Age and Gender
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'Âge',
                patientDetails.ageRangeDisplay,
                Icons.calendar_today_outlined,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildInfoItem(
                'Sexe',
                patientDetails.genderDisplay,
                Icons.person_outline,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Row 3: Marital Status and Origin
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'État civil',
                patientDetails.maritalStatusDisplay,
                Icons.favorite_outline,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildInfoItem(
                'Origine',
                patientDetails.origine.name,
                Icons.location_city_outlined,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Row 4: Residence and Profession
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'Résidence',
                patientDetails.residenceLocationDisplay,
                Icons.home_outlined,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildInfoItem(
                'Profession',
                patientDetails.professionTypeDisplay,
                Icons.work_outline,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Row 5: Socioeconomic Level and Education
        Row(
          children: [
            Expanded(
              child: _buildInfoItem(
                'Niveau socio-éco',
                patientDetails.socioeconomicLevelDisplay,
                Icons.trending_up_outlined,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildInfoItem(
                'Niveau scolaire',
                patientDetails.educationLevelDisplay,
                Icons.school_outlined,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE9ECEF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: const Color(0xFF13A4AB),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Color(0xFF6C757D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF103459),
            ),
          ),
        ],
      ),
    );
  }
} 