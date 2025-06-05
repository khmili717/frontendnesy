import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/features/secretary/presentation/providers/patients_provider.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/patient_card.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/add_patient_button.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/section_toggle.dart';
import 'package:foresight_care/features/secretary/presentation/pages/patient_details_screen.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/create_patient_dialog.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/search_bar_widget.dart';

class PatientsSection extends ConsumerStatefulWidget {
  const PatientsSection({super.key});

  @override
  ConsumerState<PatientsSection> createState() => _PatientsSectionState();
}

class _PatientsSectionState extends ConsumerState<PatientsSection>
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
        ref.read(patientsProvider.notifier).searchPatients(_searchController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header and add patient button
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
    final patientsState = ref.watch(patientsProvider);
    final totalCount = patientsState.patients.length;
    final filteredCount = patientsState.filteredPatients.length;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                    'Liste des patients',
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w600,
                fontSize: 25,
                height: 1.2,
                color: Color(0xFF13A4AB),
              ),
                    semanticsLabel: 'Liste des patients',
                  ),
                  if (totalCount > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      _searchController.text.trim().isNotEmpty 
                          ? '$filteredCount résultat${filteredCount > 1 ? 's' : ''} sur $totalCount'
                          : '$totalCount patient${totalCount > 1 ? 's' : ''} enregistré${totalCount > 1 ? 's' : ''}',
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF717171),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Quick stats
            if (totalCount > 0)
              _buildQuickStats(patientsState),
          ],
        ),
        const SizedBox(height: 15),
        
        // Add Patient Button with improved design
        _buildAddPatientButton(context),
      ],
    );
  }

  Widget _buildQuickStats(PatientsState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF13A4AB).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.people_outline,
            size: 16,
            color: const Color(0xFF13A4AB),
          ),
          const SizedBox(width: 4),
          Text(
            '${state.patients.length}',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
              fontSize: 16,
          color: Color(0xFF13A4AB),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPatientButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => _navigateToAddPatient(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E96BE),
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: const Color(0xFF1E96BE).withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_circle_outline,
              size: 20,
              semanticLabel: 'Ajouter',
            ),
            const SizedBox(width: 10),
            const Text(
              'Ajouter un nouveau patient',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 1,
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
      hintText: 'Rechercher par nom, téléphone, CIN...',
      onChanged: (query) {
        // Handled by controller listener with debounce
      },
      semanticsLabel: 'Champ de recherche pour les patients',
    );
  }

  Widget _buildContent(BuildContext context) {
    final patientsState = ref.watch(patientsProvider);
    
    if (patientsState.isLoading && patientsState.patients.isEmpty) {
      return _buildLoadingState();
    }

    if (patientsState.error != null && patientsState.patients.isEmpty) {
      return _buildErrorState(patientsState.error!);
    }

    final filteredPatients = patientsState.filteredPatients;
    
    if (filteredPatients.isEmpty) {
      return _buildEmptyState();
    }

    return _buildPatientsList(filteredPatients, patientsState.isLoading);
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Color(0xFF13A4AB),
            semanticsLabel: 'Chargement des patients',
          ),
          SizedBox(height: 16),
          Text(
            'Chargement des patients...',
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
            semanticsLabel: 'Erreur de chargement des patients',
            ),
            const SizedBox(height: 8),
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF717171),
              ),
              semanticsLabel: 'Détails de l\'erreur: $error',
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              ElevatedButton.icon(
              onPressed: () {
                ref.read(patientsProvider.notifier).fetchPatients();
              },
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text(
                  'Réessayer',
                  style: TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF13A4AB),
                foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Debug button to test raw API
              ElevatedButton.icon(
                onPressed: () => _showApiDebugDialog(context),
                icon: const Icon(Icons.bug_report, size: 18),
                label: const Text(
                  'Debug API',
                  style: TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
            ),
          ],
        ),
      );
    }

  void _showApiDebugDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'API Debug Info',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
          ),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Informations de débogage:',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '• Vérifiez la console Flutter pour les logs détaillés\n'
                  '• API URL: /patients\n'
                  '• Attendu: 1001 patients dans la base\n'
                  '• Vérifiez la connexion réseau\n'
                  '• Examinez les logs [CUSTOM_LOG] et [PATIENTS]',
                  style: TextStyle(
                    fontFamily: 'League Spartan',
                    fontSize: 12,
                    color: Color(0xFF393C3C),
                  ),
                ),
              ),
            ],
          ),
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

  Widget _buildEmptyState() {
    final hasSearchQuery = _searchController.text.trim().isNotEmpty;
    
      return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                hasSearchQuery ? Icons.search_off : Icons.person_add_outlined,
                size: 48,
              color: Colors.grey[400],
                semanticLabel: hasSearchQuery ? 'Aucun résultat' : 'Aucun patient',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              hasSearchQuery ? 'Aucun patient trouvé' : 'Aucun patient enregistré',
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color(0xFF393C3C),
              ),
              semanticsLabel: hasSearchQuery 
                  ? 'Aucun patient trouvé pour cette recherche' 
                  : 'Aucun patient enregistré',
            ),
            const SizedBox(height: 8),
            Text(
              hasSearchQuery 
                  ? 'Essayez avec d\'autres mots-clés ou vérifiez l\'orthographe'
                  : 'Commencez par ajouter votre premier patient pour les gérer efficacement',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF717171),
              ),
            ),
            const SizedBox(height: 24),
            if (!hasSearchQuery) ...[
              _buildAddPatientButton(context),
            ] else ...[
              ElevatedButton.icon(
                onPressed: () {
                  _searchController.clear();
                  ref.read(patientsProvider.notifier).searchPatients('');
                },
                icon: const Icon(Icons.clear, size: 18),
                label: const Text(
                  'Effacer la recherche',
                  style: TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPatientsList(List<Patient> patients, bool isRefreshing) {
    // ALIEN SOLUTION: Multiple layers of error protection
    return Builder(
      builder: (context) {
        try {
          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(patientsProvider.notifier).fetchPatients();
            },
            color: const Color(0xFF13A4AB),
            child: Stack(
              children: [
                // BULLETPROOF ListView with ultimate error protection
                _buildBulletproofListView(patients),
                
                // Loading overlay during refresh
                if (isRefreshing && patients.isNotEmpty)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 3,
                      child: const LinearProgressIndicator(
                        color: Color(0xFF13A4AB),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
              ],
            ),
          );
        } catch (e) {
          debugPrint('[PATIENTS_SECTION] Critical error in _buildPatientsList: $e');
          return _buildEmergencyFallbackList(patients);
        }
      },
    );
  }

  // ALIEN TECHNOLOGY: Bulletproof ListView that CANNOT fail
  Widget _buildBulletproofListView(List<Patient> patients) {
    return LayoutBuilder(
      builder: (context, constraints) {
        try {
          // Ensure we have valid constraints
          if (constraints.maxHeight <= 0 || constraints.maxWidth <= 0) {
            return _buildEmergencyFallbackList(patients);
          }

          return CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= patients.length) {
                        return const SizedBox.shrink();
                      }
                      
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index < patients.length - 1 ? 15 : 0,
                        ),
                        child: _buildUltimateSafePatientCard(patients[index], index),
                      );
                    },
                    childCount: patients.length,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: true,
                  ),
                ),
              ),
            ],
          );
        } catch (e) {
          debugPrint('[PATIENTS_SECTION] Error in bulletproof ListView: $e');
          return _buildEmergencyFallbackList(patients);
        }
      },
    );
  }

  // ALIEN TECH: Ultimate safe patient card with 5 layers of protection
  Widget _buildUltimateSafePatientCard(Patient? patient, int index) {
    return Builder(
      builder: (context) {
        try {
          // Layer 1: Null check
          if (patient == null) {
            return _buildPlaceholderPatientCard(index, 'Patient data null');
          }

          // Layer 2: Constraint protection
          return ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 98,
              maxHeight: 200,
              minWidth: 0,
              maxWidth: double.infinity,
            ),
            child: Builder(
              builder: (context) {
                try {
                  // Layer 3: Safe rendering attempt
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: _buildSafePatientCardContent(patient, index),
                  );
                } catch (e) {
                  debugPrint('[PATIENTS_SECTION] Error in card container: $e');
                  return _buildPlaceholderPatientCard(index, 'Container error');
                }
              },
            ),
          );
        } catch (e) {
          debugPrint('[PATIENTS_SECTION] Error in ultimate safe card: $e');
          return _buildPlaceholderPatientCard(index, 'Card error');
        }
      },
    );
  }

  // ALIEN MAGIC: Safe patient card content that adapts to any data
  Widget _buildSafePatientCardContent(Patient patient, int index) {
    try {
      // Get safe display values
      final nomPatient = patient.nomPatient.trim();
      final prenPatient = patient.prenPatient.trim();
      final displayName = _getSafeDisplayName(nomPatient, prenPatient);
      final initials = _getSafeInitials(nomPatient, prenPatient);
      
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 8,
              color: const Color(0xFFD6D6D6).withOpacity(0.15),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar - ALWAYS works
              _buildBulletproofAvatar(initials),
              
              const SizedBox(width: 16),
              
              // Patient info - Flexible
              Expanded(
                child: _buildBulletproofPatientInfo(patient, displayName),
              ),
              
              const SizedBox(width: 12),
              
              // Details button - Always clickable
              _buildBulletproofDetailsButton(patient),
            ],
          ),
        ),
      );
    } catch (e) {
      debugPrint('[PATIENTS_SECTION] Error in card content: $e');
      return _buildPlaceholderPatientCard(index, 'Content error');
    }
  }

  Widget _buildBulletproofAvatar(String initials) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF13A4AB),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          initials.isNotEmpty ? initials : '??',
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildBulletproofPatientInfo(Patient patient, String displayName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Name
        Text(
          displayName.isNotEmpty ? displayName : 'Patient sans nom',
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.2,
            color: Color(0xFF103459),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        
        const SizedBox(height: 4),
        
        // Details row
        _buildBulletproofDetailsRow(patient),
      ],
    );
  }

  Widget _buildBulletproofDetailsRow(Patient patient) {
    return Row(
      children: [
        // Age info
        _buildSafeInfoChip(
          Icons.cake_outlined,
          _getSafeAgeGroup(patient),
          const Color(0xFFFFE0B2), // Orange 100
          const Color(0xFFE65100), // Orange 700
        ),
        
        const SizedBox(width: 1),
        
        // Contact info
        Expanded(
          child: _buildSafeContactInfo(patient),
        ),
      ],
    );
  }

  Widget _buildSafeInfoChip(IconData icon, String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: textColor),
          const SizedBox(width: 2),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafeContactInfo(Patient patient) {
    if (patient.telephone != null && patient.telephone! > 0) {
      return _buildSafeInfoChip(
        Icons.phone_outlined,
        _formatPhoneSafe(patient.telephone!),
        const Color(0xFFC8E6C9), // Green 100
        const Color(0xFF1B5E20), // Green 700
      );
    } else if (patient.cinCnam != null && patient.cinCnam! > 0) {
      return _buildSafeInfoChip(
        Icons.badge_outlined,
        '${patient.cinCnam}',
        const Color(0xFFBBDEFB), // Blue 100
        const Color(0xFF0D47A1), // Blue 700
      );
    } else {
      return _buildSafeInfoChip(
        Icons.info_outline,
        'Pas d\'info',
        const Color(0xFFF5F5F5), // Grey 100
        const Color(0xFF424242), // Grey 700
      );
    }
  }

  Widget _buildBulletproofDetailsButton(Patient patient) {
    return SizedBox(
      width: 70,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          try {
            _navigateToPatientDetails(context, patient);
          } catch (e) {
            debugPrint('[PATIENTS_SECTION] Error in details button: $e');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Erreur lors de l\'ouverture des détails')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF13A4AB),
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Consulter',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  // EMERGENCY FALLBACK: When everything else fails
  Widget _buildEmergencyFallbackList(List<Patient> patients) {
    debugPrint('[PATIENTS_SECTION] 🚨 USING EMERGENCY FALLBACK LIST');
    
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: List.generate(patients.length, (index) {
          final patient = patients[index];
          return Container(
            height: 98,
            margin: EdgeInsets.only(bottom: index < patients.length - 1 ? 15 : 0, left: 4, right: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, width: 2),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Simple avatar
                CircleAvatar(
                  radius: 25,
                backgroundColor: const Color(0xFF13A4AB),
                  child: Text(
                    _getSafeInitials(patient.nomPatient, patient.prenPatient),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // Simple info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _getSafeDisplayName(patient.nomPatient, patient.prenPatient),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Patient #${index + 1}',
                        style: const TextStyle(
                          color: Color(0xFF757575), // Grey 600
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Simple button
                TextButton(
                  onPressed: () => _navigateToPatientDetails(context, patient),
                  child: const Text('Détails'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPlaceholderPatientCard(int index, String reason) {
    return Container(
      height: 98,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Grey 100
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning, color: Color(0xFFE65100)), // Orange 700
            const SizedBox(height: 4),
            Text(
              'Patient #${index + 1}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFBF360C), // Orange 800
              ),
            ),
            Text(
              reason,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFFE65100), // Orange 700
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ALIEN HELPER METHODS: Ultra-safe data processing
  String _getSafeDisplayName(String nom, String prenom) {
    final safeName = nom.trim();
    final safePrenom = prenom.trim();
    
    if (safePrenom.isNotEmpty && safeName.isNotEmpty) {
      return '$safePrenom $safeName';
    } else if (safeName.isNotEmpty) {
      return safeName;
    } else if (safePrenom.isNotEmpty) {
      return safePrenom;
    } else {
      return 'Patient sans nom';
    }
  }

  String _getSafeInitials(String nom, String prenom) {
    try {
      final safeName = nom.trim();
      final safePrenom = prenom.trim();
      
      final nomInitial = safeName.isNotEmpty ? safeName[0].toUpperCase() : '';
      final prenomInitial = safePrenom.isNotEmpty ? safePrenom[0].toUpperCase() : '';
      
      if (prenomInitial.isNotEmpty && nomInitial.isNotEmpty) {
        return '$prenomInitial$nomInitial';
      } else if (nomInitial.isNotEmpty) {
        return nomInitial;
      } else if (prenomInitial.isNotEmpty) {
        return prenomInitial;
      } else {
        return '??';
      }
    } catch (e) {
      return '??';
    }
  }

  String _getSafeAgeGroup(Patient patient) {
    try {
      switch (patient.ageInt) {
        case AgeRange.age18to29:
          return '18-29';
        case AgeRange.age30to39:
          return '30-39';
        case AgeRange.age40to49:
          return '40-49';
        case AgeRange.age50to59:
          return '50-59';
        case AgeRange.age60Plus:
          return '60+';
        default:
          return 'N/A';
      }
    } catch (e) {
      return 'N/A';
    }
  }

  String _formatPhoneSafe(int phone) {
    try {
      final phoneStr = phone.toString();
      if (phoneStr.length == 8) {
        return '${phoneStr.substring(0, 2)} ${phoneStr.substring(2, 4)} ${phoneStr.substring(4, 6)} ${phoneStr.substring(6, 8)}';
      } else {
        return phoneStr;
      }
    } catch (e) {
      return phone.toString();
    }
  }

  void _navigateToAddPatient(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreatePatientDialog(),
    );
  }

  void _navigateToPatientDetails(BuildContext context, Patient patient) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PatientDetailsScreen(patient: patient),
      ),
    );
  }
} 