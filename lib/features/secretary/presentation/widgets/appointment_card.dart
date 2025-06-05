import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/domain/entities/appointment.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/features/secretary/presentation/providers/appointments_provider.dart' as provider;
import 'package:foresight_care/features/secretary/presentation/widgets/edit_appointment_dialog.dart';
import 'package:foresight_care/features/secretary/presentation/pages/patient_details_screen.dart';

class AppointmentCard extends ConsumerWidget {
  final Appointment appointment;
  final VoidCallback? onEditPressed;
  final VoidCallback? onCancelPressed;
  final VoidCallback? onViewPatientPressed;
  final String? semanticsLabel;

  const AppointmentCard({
    super.key,
    required this.appointment,
    this.onEditPressed,
    this.onCancelPressed,
    this.onViewPatientPressed,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      label: semanticsLabel ?? _buildDefaultSemanticsLabel(),
      child: Container(
        constraints: const BoxConstraints(minHeight: 166),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 8,
              color: const Color(0xFFD6D6D6).withOpacity(0.15),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: _buildCardContent(context, ref),
        ),
      ),
    );
  }

  Widget _buildCardContent(BuildContext context, WidgetRef ref) {
    // Enhanced safety checks
    try {
      if (_hasInvalidPatientData()) {
        return _buildErrorCard('Données patient manquantes', Icons.person_off, Colors.orange);
      }
      
      if (_hasInvalidDoctorData()) {
        return _buildErrorCard('Données médecin manquantes', Icons.medical_services_outlined, Colors.red);
      }

      return _buildValidCard(context, ref);
    } catch (e) {
      debugPrint('[APPOINTMENT_CARD] Error building card: $e');
      return _buildErrorCard('Erreur de chargement', Icons.error_outline, Colors.red);
    }
  }

  bool _hasInvalidPatientData() {
    return (appointment.patient.nomPatient?.isEmpty ?? true) || 
           (appointment.patient.prenPatient?.isEmpty ?? true);
  }

  bool _hasInvalidDoctorData() {
    return appointment.doctor.nom.isEmpty || 
           appointment.doctor.prenom.isEmpty;
  }

  Widget _buildErrorCard(String message, IconData icon, MaterialColor color) {
    return Container(
      height: 166,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color[50],
        border: Border.all(color: color[300]!),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: color[700],
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: color[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValidCard(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with patient name and status
          _buildCardHeader(),
          const SizedBox(height: 12),
          
          // Appointment details
          _buildAppointmentDetails(),
          const SizedBox(height: 16),
          
          // Action buttons
          _buildActionButtons(context, ref),
        ],
      ),
    );
  }

  Widget _buildCardHeader() {
    return Row(
      children: [
        // Patient avatar
        _buildPatientAvatar(),
        const SizedBox(width: 12),
        
        // Patient info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${appointment.patient.prenPatient} ${appointment.patient.nomPatient}',
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFF103459),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                'RDV #${appointment.rdvId ?? 'N/A'}',
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF717171),
                ),
              ),
            ],
          ),
        ),
        
        // Status badge
        _buildStatusBadge(),
      ],
    );
  }

  Widget _buildPatientAvatar() {
    final initials = _getPatientInitials();
    
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF13A4AB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    final statusInfo = _getStatusInfo();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusInfo['color'],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        statusInfo['text'],
        style: const TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildAppointmentDetails() {
    return Column(
      children: [
        _buildDetailRow(
          Icons.person_outline,
          'Médecin',
          'Dr. ${appointment.doctor.prenom} ${appointment.doctor.nom}',
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildDetailRow(
                Icons.calendar_today_outlined,
                'Date',
                _formatDate(appointment.date),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildDetailRow(
                Icons.schedule_outlined,
                'Heure',
                appointment.heure,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildDetailRow(
          Icons.medical_services_outlined,
          'Consultation',
          appointment.linkedConsultation != null ? 'Liée' : 'Non liée',
        ),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: const Color(0xFF13A4AB),
        ),
        const SizedBox(width: 6),
        Text(
          '$label: ',
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xFF717171),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color(0xFF393C3C),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            'Modifier',
            Icons.edit_outlined,
            const Color(0xFF13A4AB),
            () => _handleEditAppointment(context),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildActionButton(
            'Annuler',
            Icons.cancel_outlined,
            // Disable if appointment is already completed
            appointment.status == AppointmentStatus.complete ? 
              Colors.grey[400]! : Colors.red[400]!,
            appointment.status == AppointmentStatus.complete ? 
              null : () => _handleCancelAppointment(context, ref),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildActionButton(
            'Patient',
            Icons.person_search_outlined,
            Colors.grey[600]!,
            () => _handleViewPatient(context),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, IconData icon, Color color, VoidCallback? onPressed) {
    return SizedBox(
      height: 32,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 14),
        label: Text(
          text,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  void _handleEditAppointment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => EditAppointmentDialog(
        existingAppointment: appointment,
      ),
    );
  }

  void _handleCancelAppointment(BuildContext context, WidgetRef ref) {
    // Don't allow canceling completed appointments
    if (appointment.status == AppointmentStatus.complete) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Impossible d\'annuler un rendez-vous complété'),
          backgroundColor: Colors.orange[600],
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.orange[600], size: 24),
              const SizedBox(width: 8),
              const Text(
                'Annuler le rendez-vous',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFF393C3C),
                ),
              ),
            ],
          ),
          content: Text(
            'Êtes-vous sûr de vouloir annuler le rendez-vous avec ${appointment.patient.prenPatient} ${appointment.patient.nomPatient} prévu le ${_formatDate(appointment.date)} à ${appointment.heure} ?',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF717171),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text(
                'Garder',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  color: Color(0xFF717171),
                ),
              ),
            ),
            StatefulBuilder(
              builder: (context, setState) {
                bool isLoading = false;
                
                return ElevatedButton(
                  onPressed: isLoading ? null : () async {
                    setState(() => isLoading = true);
                    
                    try {
                      // Create update request to cancel appointment
                      final updateRequest = UpdateAppointmentRequest(
                        idMed: appointment.doctor.id!,
                        idNumDossier: appointment.patient.id!,
                        date: appointment.date,
                        heure: appointment.heure,
                        status: AppointmentStatus.annule,
                      );

                      // Update appointment via provider
                      await ref.read(provider.appointmentsProvider.notifier)
                          .updateAppointment(appointment.id!, updateRequest);
                      
                      if (Navigator.of(dialogContext).canPop()) {
                        Navigator.of(dialogContext).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Rendez-vous annulé avec succès'),
                            backgroundColor: const Color(0xFF13A4AB),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        );
                      }
                    } catch (e) {
                      setState(() => isLoading = false);
                      
                      String errorMessage = _getErrorMessage(e.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMessage),
                          backgroundColor: Colors.red[600],
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'Annuler RDV',
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _handleViewPatient(BuildContext context) {
    // Navigate to patient details screen
    if (appointment.patient.id != null) {
      // Convert PatientInfo to Patient object for navigation
      final patient = Patient(
        id: appointment.patient.id,
        nomPatient: appointment.patient.nomPatient ?? '',
        prenPatient: appointment.patient.prenPatient ?? '',
        cinCnam: appointment.patient.cinCnam,
        telephone: appointment.patient.tel,
        // Set default values for required fields that aren't in PatientInfo
        sexe: PatientGender.masculin, // Default, will be overridden when loading full details
        dateNaiss: DateTime.now().toString(), // Default, will be overridden
        villederesidence: CityOfResidence.centre, // Default
        origine: Origin.urbaine, // Default
        ageInt: AgeRange.age18to29, // Default
        etatcivil: MaritalStatus.celibataire, // Default
        nvscolaire: EducationLevel.primaire, // Default
        typeProf: ProfessionType.reguliere, // Default
        lieuderesidence: LivingSituation.enFamille, // Default
        nvSocioeconomique: SocioeconomicLevel.moyen, // Default
      );
      
      if ((patient.nomPatient.isEmpty) || (patient.prenPatient.isEmpty)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Données patient incomplètes'),
            backgroundColor: Colors.orange[600],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        );
        return;
      }
      
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PatientDetailsScreen(patient: patient),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Impossible d\'accéder aux détails du patient'),
          backgroundColor: Colors.orange[600],
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
    }
  }

  String _getErrorMessage(String error) {
    final errorLower = error.toLowerCase();
    
    if (errorLower.contains('401') || errorLower.contains('unauthorized')) {
      return 'Session expirée. Veuillez vous reconnecter.';
    } else if (errorLower.contains('403') || errorLower.contains('forbidden')) {
      return 'Accès non autorisé. Permissions insuffisantes.';
    } else if (errorLower.contains('404') || errorLower.contains('not found')) {
      return 'Rendez-vous introuvable.';
    } else if (errorLower.contains('409') || errorLower.contains('conflict')) {
      return 'Conflit d\'horaire. Ce créneau est déjà réservé.';
    } else if (errorLower.contains('400') || errorLower.contains('bad request')) {
      return 'Données invalides. Veuillez vérifier les informations.';
    } else {
      return 'Erreur lors de la mise à jour du rendez-vous. Veuillez réessayer.';
    }
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (e) {
      return dateStr;
    }
  }

  String _getPatientInitials() {
    try {
      final firstName = appointment.patient.prenPatient?.trim() ?? '';
      final lastName = appointment.patient.nomPatient?.trim() ?? '';
      
      if (firstName.isEmpty && lastName.isEmpty) {
        return '?';
      }
      
      final firstInitial = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
      final lastInitial = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
      
      return '$firstInitial$lastInitial';
    } catch (e) {
      return '?';
    }
  }

  Map<String, dynamic> _getStatusInfo() {
    switch (appointment.status) {
      case AppointmentStatus.enAttente:
        return {'text': 'Attente', 'color': Colors.orange[400]};
      case AppointmentStatus.reserve:
        return {'text': 'Réservé', 'color': const Color(0xFF13A4AB)};
      case AppointmentStatus.annule:
        return {'text': 'Annulé', 'color': Colors.red[400]};
      case AppointmentStatus.termine:
        return {'text': 'Terminé', 'color': Colors.green[400]};
      case AppointmentStatus.enCours:
        return {'text': 'En cours', 'color': Colors.blue[400]};
      case AppointmentStatus.complete:
        return {'text': 'Complété', 'color': Colors.green[600]};
    }
  }

  String _buildDefaultSemanticsLabel() {
    try {
      final patientName = '${appointment.patient.prenPatient} ${appointment.patient.nomPatient}';
      final doctorName = 'Dr. ${appointment.doctor.prenom} ${appointment.doctor.nom}';
      final status = _getStatusInfo()['text'];
      
      return 'Rendez-vous de $patientName avec $doctorName, statut: $status, le ${_formatDate(appointment.date)} à ${appointment.heure}';
    } catch (e) {
      return 'Carte de rendez-vous';
    }
  }
} 