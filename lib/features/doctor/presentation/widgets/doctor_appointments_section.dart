import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/doctor/presentation/providers/doctor_appointments_provider.dart';
import 'package:foresight_care/domain/entities/appointment.dart';
import 'package:foresight_care/features/consultation/presentation/widgets/consultation_form_modal.dart';

class DoctorAppointmentsSection extends ConsumerStatefulWidget {
  const DoctorAppointmentsSection({super.key});

  @override
  ConsumerState<DoctorAppointmentsSection> createState() => _DoctorAppointmentsSectionState();
}

class _DoctorAppointmentsSectionState extends ConsumerState<DoctorAppointmentsSection> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appointmentsState = ref.watch(doctorAppointmentsProvider);
    final appointmentsNotifier = ref.read(doctorAppointmentsProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with title and count
        Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              color: Color(0xFF13A4AB),
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              'Rendez-vous',
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
                '${appointmentsState.filteredAppointments.length} RDV',
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
                  onChanged: (value) => appointmentsNotifier.searchAppointments(value),
                  decoration: const InputDecoration(
                    hintText: 'Rechercher un rendez-vous...',
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

            // Status filter dropdown
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
                    value: appointmentsState.selectedStatusFilter,
                    onChanged: (value) => appointmentsNotifier.filterByStatus(value ?? 'all'),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    icon: const Icon(Icons.filter_list, color: Color(0xFF6C757D), size: 7),
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      color: Color(0xFF495057),
                      fontSize: 14,
                    ),
                    items: const [
                      DropdownMenuItem(value: 'all', child: Text('Tous')),
                      DropdownMenuItem(value: 'en_attente', child: Text('En attente')),
                      DropdownMenuItem(value: 'termine', child: Text('Terminé')),
                      DropdownMenuItem(value: 'annule', child: Text('Annulé')),
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
                onPressed: () => appointmentsNotifier.refreshAppointments(),
                icon: const Icon(Icons.refresh, color: Colors.white, size: 20),
                tooltip: 'Actualiser',
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Content area
        Expanded(
          child: appointmentsState.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF13A4AB),
                  ),
                )
              : appointmentsState.error != null
                  ? _buildErrorWidget(appointmentsState.error!, appointmentsNotifier)
                  : appointmentsState.filteredAppointments.isEmpty
                      ? _buildEmptyWidget()
                      : _buildAppointmentsList(appointmentsState.filteredAppointments),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(String error, DoctorAppointmentsNotifier notifier) {
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
            onPressed: () => notifier.refreshAppointments(),
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
            Icons.calendar_today_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Aucun rendez-vous trouvé',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Aucun rendez-vous ne correspond à vos critères de recherche.',
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

  Widget _buildAppointmentsList(List<DoctorAppointment> appointments) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return _buildAppointmentCard(appointment);
      },
    );
  }

  Widget _buildAppointmentCard(DoctorAppointment appointment) {
    debugPrint('[APPOINTMENT_CARD] Building card for ${appointment.patient.prenPatient} ${appointment.patient.nomPatient} with status: ${appointment.status}');
    
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
            // Status indicator
            Container(
              width: 4,
              height: 60,
              decoration: BoxDecoration(
                color: _getStatusColor(appointment.status),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 16),

            // Appointment info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${appointment.rdvId ?? 'N/A'}',
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF103459),
                        ),
                      ),
                      const Spacer(),
                      _buildStatusChip(appointment.status),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${appointment.patient.prenPatient ?? 'Prénom'} ${appointment.patient.nomPatient ?? 'Nom'}',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF495057),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatDate(appointment.date),
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        appointment.heure,
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  if (appointment.patient.cinCnam != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.badge_outlined,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'CIN: ${appointment.patient.cinCnam}',
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            // Action buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Consultation button - Show for most appointment statuses (for testing)
                if (appointment.status == AppointmentStatus.enAttente ||
                    appointment.status == AppointmentStatus.enCours)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Tooltip(
                      message: 'Créer consultation',
                      child: Material(
                        color: const Color(0xFF13A4AB),
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () => _showConsultationForm(appointment),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.medical_information_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                
                // Details button
                IconButton(
                  onPressed: () => _showAppointmentDetails(appointment),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF13A4AB),
                    size: 16,
                  ),
                  tooltip: 'Voir détails',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(AppointmentStatus status) {
    final statusInfo = _getStatusInfo(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusInfo['color'].withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        statusInfo['label'],
        style: TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: statusInfo['color'],
        ),
      ),
    );
  }

  Map<String, dynamic> _getStatusInfo(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.enAttente:
        return {'label': 'En attente', 'color': Colors.orange};
      case AppointmentStatus.termine:
      case AppointmentStatus.complete:
        return {'label': 'Terminé', 'color': Colors.green};
      case AppointmentStatus.annule:
        return {'label': 'Annulé', 'color': Colors.red};
      case AppointmentStatus.enCours:
        return {'label': 'En cours', 'color': Colors.blue};
      case AppointmentStatus.reserve:
        return {'label': 'Réservé', 'color': Colors.purple};
    }
  }

  Color _getStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.enAttente:
        return Colors.orange;
      case AppointmentStatus.termine:
      case AppointmentStatus.complete:
        return Colors.green;
      case AppointmentStatus.annule:
        return Colors.red;
      case AppointmentStatus.enCours:
        return Colors.blue;
      case AppointmentStatus.reserve:
        return Colors.purple;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  void _showAppointmentDetails(DoctorAppointment appointment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('RDV ${appointment.rdvId ?? 'N/A'}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient: ${appointment.patient.prenPatient ?? 'Prénom'} ${appointment.patient.nomPatient ?? 'Nom'}'),
            Text('Date: ${_formatDate(appointment.date)}'),
            Text('Heure: ${appointment.heure}'),
            Text('Statut: ${_getStatusInfo(appointment.status)['label']}'),
            if (appointment.patient.cinCnam != null)
              Text('CIN: ${appointment.patient.cinCnam}'),
            if (appointment.patient.tel != null)
              Text('Téléphone: ${appointment.patient.tel}'),
            if (appointment.linkedConsultation != null)
              Text('Consultation liée: ${appointment.linkedConsultation}'),
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

  void _showConsultationForm(DoctorAppointment appointment) async {
    debugPrint('[CONSULTATION_BUTTON] Opening consultation form for appointment: ${appointment.id}');
    debugPrint('[CONSULTATION_BUTTON] Patient: ${appointment.patient.prenPatient} ${appointment.patient.nomPatient}');
    
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => ConsultationFormModal(appointment: appointment),
    );
    
    debugPrint('[CONSULTATION_BUTTON] Dialog result: $result');
    
    // If consultation was created successfully, refresh the appointments list
    if (result == true && mounted) {
      debugPrint('[CONSULTATION_BUTTON] Refreshing appointments list...');
      ref.read(doctorAppointmentsProvider.notifier).fetchAppointments();
    }
  }
} 