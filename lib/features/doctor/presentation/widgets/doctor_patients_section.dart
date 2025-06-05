import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/doctor/presentation/providers/doctor_patients_provider.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/features/patient_details/presentation/pages/patient_details_screen.dart';

class DoctorPatientsSection extends ConsumerStatefulWidget {
  const DoctorPatientsSection({super.key});

  @override
  ConsumerState<DoctorPatientsSection> createState() => _DoctorPatientsSectionState();
}

class _DoctorPatientsSectionState extends ConsumerState<DoctorPatientsSection> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final patientsState = ref.watch(doctorPatientsProvider);
    final patientsNotifier = ref.read(doctorPatientsProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with title and count
        Row(
          children: [
            const Icon(
              Icons.people_outline,
              color: Color(0xFF13A4AB),
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              'Patients',
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
                '${patientsState.filteredPatients.length} patients',
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
              flex: 3,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE9ECEF)),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => patientsNotifier.searchPatients(value),
                  decoration: const InputDecoration(
                    hintText: 'Rechercher un patient...',
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Filter dropdown
            Expanded(
              flex: 2,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE9ECEF)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: patientsState.selectedFilter,
                    onChanged: (value) => patientsNotifier.filterPatients(value ?? 'all'),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    icon: const Icon(Icons.filter_list, color: Color(0xFF6C757D), size: 10),
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      color: Color(0xFF495057),
                      fontSize: 14,
                    ),
                    items: const [
                      DropdownMenuItem(value: 'all', child: Text('Tous')),
                      DropdownMenuItem(value: 'homme', child: Text('Hommes')),
                      DropdownMenuItem(value: 'femme', child: Text('Femmes')),
                      DropdownMenuItem(value: 'jeune', child: Text('Jeunes')),
                      DropdownMenuItem(value: 'senior', child: Text('Seniors')),
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
                onPressed: () => patientsNotifier.refreshPatients(),
                icon: const Icon(Icons.refresh, color: Colors.white, size: 20),
                tooltip: 'Actualiser',
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Content area
        Expanded(
          child: patientsState.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF13A4AB),
                  ),
                )
              : patientsState.error != null
                  ? _buildErrorWidget(patientsState.error!, patientsNotifier)
                  : patientsState.filteredPatients.isEmpty
                      ? _buildEmptyWidget()
                      : _buildPatientsList(patientsState.filteredPatients),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(String error, DoctorPatientsNotifier notifier) {
    return Center(
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
            onPressed: () => notifier.refreshPatients(),
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
            Icons.people_outline,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun patient trouvé',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Aucun patient ne correspond à vos critères de recherche.',
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

  Widget _buildPatientsList(List<Patient> patients) {
    return ListView.builder(
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];
        return _buildPatientCard(patient);
      },
    );
  }

  Widget _buildPatientCard(Patient patient) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9ECEF)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 3,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: patient.sexe == PatientGender.feminin
                    ? Colors.pink[100]
                    : Colors.blue[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                patient.sexe == PatientGender.feminin
                    ? Icons.woman
                    : Icons.man,
                color: patient.sexe == PatientGender.feminin
                    ? Colors.pink[600]
                    : Colors.blue[600],
                size: 24,
              ),
            ),
            const SizedBox(width: 16),

            // Patient info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${patient.prenPatient} ${patient.nomPatient}',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF103459),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Icon(
                              Icons.badge_outlined,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                'CIN: ${patient.cinCnam ?? 'N/A'}',
                                style: TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Row(
                          children: [
                            Icon(
                              Icons.folder_outlined,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                '${patient.numDossier ?? 'N/A'}',
                                style: TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildInfoChip(
                        _getAgeRangeDisplay(patient.ageInt),
                        Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      _buildInfoChip(
                        _getGenderDisplay(patient.sexe),
                        patient.sexe == PatientGender.feminin
                            ? Colors.pink
                            : Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Action buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Consulter button
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF13A4AB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () => _navigateToPatientDetails(patient),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Consulter',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Existing arrow button
                
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
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

  String _getAgeRangeDisplay(AgeRange ageRange) {
    switch (ageRange) {
      case AgeRange.age18to29:
        return '18-29 ans';
      case AgeRange.age30to39:
        return '30-39 ans';
      case AgeRange.age40to49:
        return '40-49 ans';
      case AgeRange.age50to59:
        return '50-59 ans';
      case AgeRange.age60Plus:
        return '60+ ans';
    }
  }

  String _getGenderDisplay(PatientGender gender) {
    switch (gender) {
      case PatientGender.feminin:
        return 'Femme';
      case PatientGender.masculin:
        return 'Homme';
    }
  }

  void _showPatientDetails(Patient patient) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${patient.prenPatient} ${patient.nomPatient}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CIN: ${patient.cinCnam ?? 'N/A'}'),
            Text('Téléphone: ${patient.telephone ?? 'N/A'}'),
            Text('Âge: ${_getAgeRangeDisplay(patient.ageInt)}'),
            Text('Sexe: ${_getGenderDisplay(patient.sexe)}'),
            Text('État civil: ${patient.etatcivil.name}'),
            Text('Origine: ${patient.origine.name}'),
            Text('Niveau scolaire: ${patient.nvscolaire.name}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _navigateToPatientDetails(Patient patient) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PatientDetailsScreen(
          patientId: patient.id!,
          patientName: '${patient.prenPatient} ${patient.nomPatient}',
        ),
      ),
    );
  }
} 