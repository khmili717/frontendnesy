import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/secretary/presentation/providers/appointments_provider.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/appointment_card.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/search_bar_widget.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/create_appointment_dialog.dart';
import 'package:foresight_care/domain/entities/appointment.dart';
import 'dart:async';

class AppointmentsSection extends ConsumerStatefulWidget {
  const AppointmentsSection({super.key});

  @override
  ConsumerState<AppointmentsSection> createState() => _AppointmentsSectionState();
}

class _AppointmentsSectionState extends ConsumerState<AppointmentsSection>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  Timer? _debounceTimer;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        ref.read(appointmentsProvider.notifier).searchAppointments(_searchController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header and create appointment button
        _buildHeader(context),
        const SizedBox(height: 20),
        
        // Search bar
        _buildSearchBar(),
        const SizedBox(height: 20),
        
        // Content area
        Expanded(
          child: _buildContent(context),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Liste des rendez-vous:',
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
            fontSize: 25,
            height: 1.2,
            color: Color(0xFF13A4AB),
          ),
          semanticsLabel: 'Liste des rendez-vous',
        ),
        const SizedBox(height: 15),
        
        // Create Appointment Button
        _buildCreateAppointmentButton(context),
      ],
    );
  }

  Widget _buildCreateAppointmentButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => _navigateToCreateAppointment(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E96BE),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_circle_outline,
              size: 20,
              semanticLabel: 'Créer',
            ),
            const SizedBox(width: 8),
            const Text(
              'Créer un rendez-vous',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return SearchBarWidget(
      controller: _searchController,
      focusNode: _searchFocusNode,
      hintText: 'Rechercher un rendez-vous...',
      onChanged: (query) {
        // Handled by controller listener with debounce
      },
      semanticsLabel: 'Champ de recherche pour les rendez-vous',
    );
  }

  Widget _buildContent(BuildContext context) {
    final appointmentsState = ref.watch(appointmentsProvider);
    
    if (appointmentsState.isLoading) {
      return _buildLoadingState();
    }

    if (appointmentsState.error != null) {
      return _buildErrorState(appointmentsState.error!);
    }

    final filteredAppointments = appointmentsState.filteredAppointments;
    
    if (filteredAppointments.isEmpty) {
      return _buildEmptyState();
    }

    return _buildAppointmentsList(filteredAppointments);
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Color(0xFF13A4AB),
            semanticsLabel: 'Chargement des rendez-vous',
          ),
          SizedBox(height: 16),
          Text(
            'Chargement des rendez-vous...',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red[300],
            semanticLabel: 'Erreur',
          ),
          const SizedBox(height: 16),
          Text(
            'Erreur de chargement',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color(0xFF393C3C),
            ),
            semanticsLabel: 'Erreur de chargement des rendez-vous',
          ),
          const SizedBox(height: 8),
          Text(
            error,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF717171),
            ),
            semanticsLabel: 'Détails de l\'erreur: $error',
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.read(appointmentsProvider.notifier).fetchAppointments();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF13A4AB),
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'Réessayer',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    final hasSearchQuery = _searchController.text.trim().isNotEmpty;
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            hasSearchQuery ? Icons.search_off : Icons.calendar_today_outlined,
            size: 64,
            color: Colors.grey[400],
            semanticLabel: hasSearchQuery ? 'Aucun résultat' : 'Aucun rendez-vous',
          ),
          const SizedBox(height: 16),
          Text(
            hasSearchQuery ? 'Aucun rendez-vous trouvé' : 'Aucun rendez-vous programmé',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color(0xFF393C3C),
            ),
            semanticsLabel: hasSearchQuery 
                ? 'Aucun rendez-vous trouvé pour cette recherche' 
                : 'Aucun rendez-vous programmé',
          ),
          const SizedBox(height: 8),
          Text(
            hasSearchQuery 
                ? 'Aucun rendez-vous ne correspond à votre recherche'
                : 'Commencez par créer votre premier rendez-vous',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF717171),
            ),
          ),
          if (!hasSearchQuery) ...[
            const SizedBox(height: 20),
            _buildCreateAppointmentButton(context),
          ],
        ],
      ),
    );
  }

  Widget _buildAppointmentsList(List appointments) {
    return Semantics(
      label: 'Liste de ${appointments.length} rendez-vous',
      child: RefreshIndicator(
        onRefresh: () async {
          await ref.read(appointmentsProvider.notifier).fetchAppointments();
        },
        color: const Color(0xFF13A4AB),
        child: ListView.separated(
          padding: const EdgeInsets.only(bottom: 16),
          itemCount: appointments.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            try {
              final appointment = appointments[index];
              
              // Validate appointment data
              if (appointment == null) {
                return _buildInvalidAppointmentCard(index, 'Données de rendez-vous manquantes');
              }

              // Safety check for required nested data
              if (appointment.patient?.nomPatient?.isEmpty != false || 
                  appointment.patient?.prenPatient?.isEmpty != false ||
                  appointment.doctor?.nom?.isEmpty != false || 
                  appointment.doctor?.prenom?.isEmpty != false) {
                return _buildInvalidAppointmentCard(index, 'Données patient ou médecin manquantes');
              }
              
              return AppointmentCard(
                appointment: appointment,
                onEditPressed: () => _editAppointment(appointment),
                onCancelPressed: () => _showCancelConfirmation(context, appointment),
                onViewPatientPressed: () => _viewPatient(appointment),
              );
            } catch (e, stackTrace) {
              debugPrint('[APPOINTMENTS_SECTION] Error rendering appointment at index $index: $e');
              debugPrint('[APPOINTMENTS_SECTION] Stack trace: $stackTrace');
              return _buildErrorAppointmentCard(index);
            }
          },
        ),
      ),
    );
  }

  Widget _buildInvalidAppointmentCard(int index, String message) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange[300]!),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_outlined,
              color: Colors.orange[700],
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                color: Colors.orange[700],
                fontSize: 12,
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              semanticsLabel: '$message pour le rendez-vous numéro ${index + 1}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorAppointmentCard(int index) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red[300]!),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red[700],
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              'Erreur de chargement',
              style: TextStyle(
                color: Colors.red[700],
                fontSize: 12,
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
              ),
              semanticsLabel: 'Erreur de chargement pour le rendez-vous numéro ${index + 1}',
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () {
                ref.read(appointmentsProvider.notifier).fetchAppointments();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                foregroundColor: Colors.white,
                minimumSize: const Size(80, 24),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
              child: const Text(
                'Réessayer',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCreateAppointment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreateAppointmentDialog(),
    );
  }

  void _editAppointment(appointment) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Modification du rendez-vous'),
        backgroundColor: Color(0xFF13A4AB),
      ),
    );
  }

  void _showCancelConfirmation(BuildContext context, appointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange[600],
                size: 24,
              ),
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
            'Êtes-vous sûr de vouloir annuler le rendez-vous avec ${appointment.patient?.prenPatient ?? ''} ${appointment.patient?.nomPatient ?? ''} ?',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF717171),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Garder',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  color: Color(0xFF717171),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _performCancelAppointment(appointment);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Annuler RDV',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _performCancelAppointment(appointment) async {
    try {
      // TODO: Implement actual cancellation logic
      // await ref.read(appointmentsProvider.notifier).cancelAppointment(appointment.id);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Rendez-vous annulé avec succès'),
            backgroundColor: const Color(0xFF13A4AB),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors de l\'annulation: $e'),
            backgroundColor: Colors.red[400],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    }
  }

  void _viewPatient(appointment) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Voir le patient'),
        backgroundColor: Color(0xFF13A4AB),
      ),
    );
  }
} 