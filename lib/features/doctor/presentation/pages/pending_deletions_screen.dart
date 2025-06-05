import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:foresight_care/features/doctor/presentation/providers/pending_deletions_provider.dart';
import 'package:foresight_care/domain/entities/patient.dart';

class PendingDeletionsScreen extends ConsumerStatefulWidget {
  const PendingDeletionsScreen({super.key});

  @override
  ConsumerState<PendingDeletionsScreen> createState() => _PendingDeletionsScreenState();
}

class _PendingDeletionsScreenState extends ConsumerState<PendingDeletionsScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pendingDeletionsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: const Color(0x1A000000),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF103459),
            size: 20,
          ),
          tooltip: 'Retour au tableau de bord',
        ),
        title: const Text(
          'Demandes de suppression',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF103459),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => ref.read(pendingDeletionsProvider.notifier).refreshPendingDeletions(),
            icon: const Icon(
              Icons.refresh,
              color: Color(0xFF13A4AB),
              size: 24,
            ),
            tooltip: 'Actualiser',
          ),
        ],
      ),
      body: SafeArea(
        child: _buildBody(state),
      ),
    );
  }

  Widget _buildBody(PendingDeletionsState state) {
    if (state.isLoading) {
      return _buildLoadingState();
    }

    if (state.error != null) {
      return _buildErrorState(state.error!);
    }

    if (state.pendingDeletions.isEmpty) {
      return _buildEmptyState();
    }

    return _buildPendingDeletionsList(state.pendingDeletions, state.isRefreshing);
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF13A4AB)),
            strokeWidth: 3,
          ),
          SizedBox(height: 16),
          Text(
            'Chargement des demandes...',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFF717171),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
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
              'Erreur',
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF103459),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF717171),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => ref.read(pendingDeletionsProvider.notifier).fetchPendingDeletions(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF13A4AB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Réessayer',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64,
              color: Colors.green[400],
            ),
            const SizedBox(height: 16),
            const Text(
              'Aucune demande en attente',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF103459),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Il n\'y a actuellement aucune demande de suppression en attente.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF717171),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingDeletionsList(List<Patient> pendingDeletions, bool isRefreshing) {
    return RefreshIndicator(
      onRefresh: () => ref.read(pendingDeletionsProvider.notifier).refreshPendingDeletions(),
      color: const Color(0xFF13A4AB),
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: pendingDeletions.length,
        itemBuilder: (context, index) {
          final patient = pendingDeletions[index];
          return _buildPatientCard(patient);
        },
      ),
    );
  }

  Widget _buildPatientCard(Patient patient) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${patient.prenPatient} ${patient.nomPatient}',
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xFF103459),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Dossier: ${patient.numDossier ?? 'N/A'}',
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF13A4AB),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.orange[200]!),
                  ),
                  child: Text(
                    'En attente',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.orange[700],
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Patient details
            _buildDetailRow('Date de naissance', _formatDate(patient.dateNaiss)),
            _buildDetailRow('Âge', _getAgeRangeDisplay(patient.ageInt)),
            _buildDetailRow('Ville', _getCityDisplay(patient.villederesidence)),
            
            if (patient.deletionRequestedBy != null) ...[
              const SizedBox(height: 12),
              const Divider(color: Color(0xFFE0E0E0)),
              const SizedBox(height: 12),
              
              // Deletion request details
              Text(
                'Détails de la demande',
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xFF103459),
                ),
              ),
              const SizedBox(height: 8),
              
              _buildDetailRow(
                'Demandé par',
                '${patient.deletionRequestedBy!.prenom} ${patient.deletionRequestedBy!.nom}',
              ),
              _buildDetailRow(
                'Date de demande',
                _formatDateTime(patient.deletionRequestedAt),
              ),
              
              if (patient.deletionReason != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Raison:',
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF393C3C),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: Text(
                    patient.deletionReason!,
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF717171),
                    ),
                  ),
                ),
              ],
            ],
            
            const SizedBox(height: 20),
            
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 8,
                          color: Colors.red.withOpacity(0.15),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () => _showCancelConfirmationDialog(patient),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[50],
                        foregroundColor: Colors.red[700],
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.red[200]!, width: 1.5),
                        ),
                      ),
                      child: const Text(
                        'Annuler',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 8,
                          color: const Color(0xFF13A4AB).withOpacity(0.25),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () => _showConfirmDeletionDialog(patient),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF13A4AB),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Confirmer',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF393C3C),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF717171),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCancelConfirmationDialog(Patient patient) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(Icons.warning_amber, color: Colors.orange[600], size: 24),
              const SizedBox(width: 12),
              const Text(
                'Confirmer l\'annulation',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFF103459),
                ),
              ),
            ],
          ),
          content: Text(
            'Êtes-vous sûr de vouloir annuler la demande de suppression pour ${patient.prenPatient} ${patient.nomPatient} ?',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF717171),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Annuler',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _cancelDeletion(patient);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Confirmer',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _cancelDeletion(Patient patient) async {
    final success = await ref.read(pendingDeletionsProvider.notifier).cancelDeletion(patient.id!);
    
    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Demande de suppression annulée pour ${patient.prenPatient} ${patient.nomPatient}',
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.green[600],
            duration: const Duration(seconds: 3),
          ),
        );
      } else {
        final error = ref.read(pendingDeletionsProvider).error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error ?? 'Erreur lors de l\'annulation de la demande',
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.red[600],
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  void _showConfirmDeletionDialog(Patient patient) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(Icons.delete_forever, color: Colors.red[600], size: 24),
              const SizedBox(width: 12),
              const Text(
                'Confirmer la suppression',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xFF103459),
                ),
              ),
            ],
          ),
          content: Text(
            'Êtes-vous sûr de vouloir confirmer la suppression définitive de ${patient.prenPatient} ${patient.nomPatient} ? Cette action est irréversible.',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF717171),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Annuler',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _confirmDeletion(patient);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Supprimer définitivement',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _confirmDeletion(Patient patient) async {
    // For now, we'll show a message that this feature would delete the patient permanently
    // In a real implementation, you would add a confirmDeletion method to the provider
    // that calls the deletePatient API endpoint
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Fonctionnalité de suppression définitive à implémenter pour ${patient.prenPatient} ${patient.nomPatient}',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.orange[600],
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return 'N/A';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      return 'N/A';
    }
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';
    return DateFormat('dd/MM/yyyy à HH:mm').format(dateTime);
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

  String _getCityDisplay(CityOfResidence city) {
    switch (city) {
      case CityOfResidence.sud:
        return 'Sud';
      case CityOfResidence.centre:
        return 'Centre';
    }
  }
} 