import 'package:flutter/material.dart';
import 'package:foresight_care/domain/entities/patient_details.dart';

class PatientAppointmentsSection extends StatelessWidget {
  final List<PatientAppointment> appointments;
  final bool isLoading;
  final String? error;
  final VoidCallback onRetry;

  const PatientAppointmentsSection({
    super.key,
    required this.appointments,
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

    if (appointments.isEmpty) {
      return _buildEmptyWidget();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return _buildAppointmentCard(appointment);
      },
    );
  }

  Widget _buildAppointmentCard(PatientAppointment appointment) {
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
            // Header with status
            Row(
              children: [
                Expanded(
                  child: Text(
                    'RDV ${appointment.rdvId}',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF103459),
                    ),
                  ),
                ),
                _buildStatusChip(appointment.status),
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
                  'Dr. ${appointment.doctorFullName}',
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
            
            // Date and time
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Color(0xFF6C757D),
                ),
                const SizedBox(width: 8),
                Text(
                  appointment.formattedDate,
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF495057),
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.access_time,
                  size: 16,
                  color: Color(0xFF6C757D),
                ),
                const SizedBox(width: 8),
                Text(
                  appointment.heure,
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF495057),
                  ),
                ),
              ],
            ),
            
            // Linked consultation if available
            if (appointment.linkedConsultation != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.link,
                    size: 16,
                    color: Color(0xFF13A4AB),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Consultation liée',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF13A4AB),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(AppointmentStatus status) {
    Color backgroundColor;
    Color textColor;
    
    switch (status) {
      case AppointmentStatus.enAttente:
        backgroundColor = Colors.orange[100]!;
        textColor = Colors.orange[800]!;
        break;
      case AppointmentStatus.termine:
        backgroundColor = Colors.green[100]!;
        textColor = Colors.green[800]!;
        break;
      case AppointmentStatus.annule:
        backgroundColor = Colors.red[100]!;
        textColor = Colors.red[800]!;
        break;
      case AppointmentStatus.confirme:
        backgroundColor = Colors.blue[100]!;
        textColor = Colors.blue[800]!;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.name,
        style: TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w600,
          fontSize: 10,
          color: textColor,
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
              Icons.calendar_today_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Aucun rendez-vous',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Aucun rendez-vous trouvé pour ce patient.',
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