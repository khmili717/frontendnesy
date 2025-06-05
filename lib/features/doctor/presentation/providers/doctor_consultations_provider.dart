import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/domain/entities/consultation.dart';

// Doctor Consultations State
class DoctorConsultationsState {
  final List<Consultation> consultations;
  final List<Consultation> filteredConsultations;
  final bool isLoading;
  final String? error;
  final String searchQuery;
  final String selectedRiskFilter; // Filter by risk level
  final String selectedDiagnosticFilter; // Filter by diagnostic

  const DoctorConsultationsState({
    this.consultations = const [],
    this.filteredConsultations = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
    this.selectedRiskFilter = 'all',
    this.selectedDiagnosticFilter = 'all',
  });

  DoctorConsultationsState copyWith({
    List<Consultation>? consultations,
    List<Consultation>? filteredConsultations,
    bool? isLoading,
    String? error,
    String? searchQuery,
    String? selectedRiskFilter,
    String? selectedDiagnosticFilter,
  }) {
    return DoctorConsultationsState(
      consultations: consultations ?? this.consultations,
      filteredConsultations: filteredConsultations ?? this.filteredConsultations,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedRiskFilter: selectedRiskFilter ?? this.selectedRiskFilter,
      selectedDiagnosticFilter: selectedDiagnosticFilter ?? this.selectedDiagnosticFilter,
    );
  }
}

// Doctor Consultations Provider
class DoctorConsultationsNotifier extends StateNotifier<DoctorConsultationsState> {
  final api.ApiClient _apiClient;

  DoctorConsultationsNotifier(this._apiClient) : super(const DoctorConsultationsState()) {
    fetchConsultations();
  }

  Future<void> fetchConsultations() async {
    debugPrint('[DOCTOR_CONSULTATIONS] Starting fetchMyConsultations...');
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _apiClient.getMyConsultations();
      final rawConsultations = response.data as List<dynamic>;
      debugPrint('[DOCTOR_CONSULTATIONS] Received ${rawConsultations.length} raw consultations');

      // Parse raw JSON to Consultation objects
      final consultations = <Consultation>[];
      for (int i = 0; i < rawConsultations.length; i++) {
        try {
          final consultation = Consultation.fromJson(rawConsultations[i] as Map<String, dynamic>);
          consultations.add(consultation);
        } catch (e) {
          debugPrint('[DOCTOR_CONSULTATIONS] ❌ Error parsing consultation ${i + 1}: $e');
          // Continue processing other consultations
        }
      }

      debugPrint('[DOCTOR_CONSULTATIONS] Successfully parsed ${consultations.length} consultations');

      // Sort consultations by date (newest first)
      consultations.sort((a, b) {
        try {
          if (a.dateHeure != null && b.dateHeure != null) {
            final dateA = DateTime.parse(a.dateHeure!);
            final dateB = DateTime.parse(b.dateHeure!);
            return dateB.compareTo(dateA);
          }
        } catch (e) {
          debugPrint('[DOCTOR_CONSULTATIONS] Error sorting consultations: $e');
        }
        return 0;
      });

      state = state.copyWith(
        consultations: consultations,
        filteredConsultations: _applyFilters(
          consultations, 
          state.searchQuery, 
          state.selectedRiskFilter,
          state.selectedDiagnosticFilter
        ),
        isLoading: false,
      );

      debugPrint('[DOCTOR_CONSULTATIONS] ✅ State updated successfully');
    } catch (e) {
      debugPrint('[DOCTOR_CONSULTATIONS] ❌ Error fetching consultations: $e');
      String errorMessage = 'Erreur lors du chargement des consultations';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Session expirée. Veuillez vous reconnecter.';
      } else if (e.toString().contains('500')) {
        errorMessage = 'Erreur serveur. Veuillez réessayer plus tard.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Erreur de connexion. Vérifiez votre connexion internet.';
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );
    }
  }

  void searchConsultations(String query) {
    debugPrint('[DOCTOR_CONSULTATIONS] Searching with query: "$query"');
    state = state.copyWith(
      searchQuery: query,
      filteredConsultations: _applyFilters(
        state.consultations, 
        query, 
        state.selectedRiskFilter,
        state.selectedDiagnosticFilter
      ),
    );
  }

  void filterByRisk(String riskFilter) {
    debugPrint('[DOCTOR_CONSULTATIONS] Filtering by risk: $riskFilter');
    state = state.copyWith(
      selectedRiskFilter: riskFilter,
      filteredConsultations: _applyFilters(
        state.consultations, 
        state.searchQuery, 
        riskFilter,
        state.selectedDiagnosticFilter
      ),
    );
  }

  void filterByDiagnostic(String diagnosticFilter) {
    debugPrint('[DOCTOR_CONSULTATIONS] Filtering by diagnostic: $diagnosticFilter');
    state = state.copyWith(
      selectedDiagnosticFilter: diagnosticFilter,
      filteredConsultations: _applyFilters(
        state.consultations, 
        state.searchQuery, 
        state.selectedRiskFilter,
        diagnosticFilter
      ),
    );
  }

  List<Consultation> _applyFilters(
    List<Consultation> consultations, 
    String searchQuery, 
    String riskFilter,
    String diagnosticFilter
  ) {
    var filtered = consultations;

    // Apply text search
    if (searchQuery.isNotEmpty) {
      final lowerQuery = searchQuery.toLowerCase();
      filtered = filtered.where((consultation) {
        return consultation.numConsult.toLowerCase().contains(lowerQuery) ||
               consultation.patientFullName.toLowerCase().contains(lowerQuery) ||
               consultation.patientCin.toLowerCase().contains(lowerQuery) ||
               consultation.diagnosticDisplay.toLowerCase().contains(lowerQuery) ||
               consultation.remarque?.toLowerCase().contains(lowerQuery) == true;
      }).toList();
    }

    // Apply risk filter
    if (riskFilter != 'all') {
      filtered = filtered.where((consultation) {
        final risk = consultation.riskLevel.toLowerCase();
        switch (riskFilter.toLowerCase()) {
          case 'eleve':
          case 'élevé':
            return risk.contains('élevé') || risk.contains('eleve') || risk.contains('high');
          case 'moyen':
            return risk.contains('moyen') || risk.contains('medium');
          case 'faible':
            return risk.contains('faible') || risk.contains('low');
          case 'non_evalue':
          case 'non évalué':
            return risk.contains('non évalué') || risk.contains('non_evalue');
          default:
            return true;
        }
      }).toList();
    }

    // Apply diagnostic filter
    if (diagnosticFilter != 'all') {
      filtered = filtered.where((consultation) {
        switch (diagnosticFilter.toLowerCase()) {
          case 'skz':
            return consultation.diagnosticRetenu == DiagnosticRetenu.skz;
          case 'bda':
            return consultation.diagnosticRetenu == DiagnosticRetenu.bda;
          case 'dup':
            return consultation.diagnosticRetenu == DiagnosticRetenu.dup;
          case 'ep_maniaque':
          case 'episode_maniaque':
            return consultation.diagnosticRetenu == DiagnosticRetenu.epManiaque;
          case 'dbp':
            return consultation.diagnosticRetenu == DiagnosticRetenu.dbp;
          case 'tr_delirant':
          case 'trouble_delirant':
            return consultation.diagnosticRetenu == DiagnosticRetenu.trDelirant;
          case 'tr_anxieux':
          case 'trouble_anxieux':
            return consultation.diagnosticRetenu == DiagnosticRetenu.trAnxieux;
          case 'personnalite':
          case 'personnalité':
          case 'tr_personnalite_seul':
            return consultation.diagnosticRetenu == DiagnosticRetenu.trPersonnaliteSeul;
          case 'autre':
            return consultation.diagnosticRetenu == DiagnosticRetenu.autre;
          default:
            return true;
        }
      }).toList();
    }

    return filtered;
  }

  Future<void> refreshConsultations() async {
    await fetchConsultations();
  }

  // Get consultations count by risk level
  Map<String, int> getConsultationCountsByRisk() {
    final counts = <String, int>{
      'total': state.consultations.length,
      'eleve': 0,
      'moyen': 0,
      'faible': 0,
      'non_evalue': 0,
    };

    for (final consultation in state.consultations) {
      final risk = consultation.riskLevel.toLowerCase();
      if (risk.contains('élevé') || risk.contains('eleve') || risk.contains('high')) {
        counts['eleve'] = (counts['eleve'] ?? 0) + 1;
      } else if (risk.contains('moyen') || risk.contains('medium')) {
        counts['moyen'] = (counts['moyen'] ?? 0) + 1;
      } else if (risk.contains('faible') || risk.contains('low')) {
        counts['faible'] = (counts['faible'] ?? 0) + 1;
      } else {
        counts['non_evalue'] = (counts['non_evalue'] ?? 0) + 1;
      }
    }

    return counts;
  }

  // Get consultations count by diagnostic
  Map<String, int> getConsultationCountsByDiagnostic() {
    final counts = <String, int>{
      'skz': 0,
      'bda': 0,
      'dup': 0,
      'ep_maniaque': 0,
      'dbp': 0,
      'tr_delirant': 0,
      'tr_anxieux': 0,
      'personnalite': 0,
      'autre': 0,
    };

    for (final consultation in state.consultations) {
      switch (consultation.diagnosticRetenu) {
        case DiagnosticRetenu.skz:
          counts['skz'] = (counts['skz'] ?? 0) + 1;
          break;
        case DiagnosticRetenu.bda:
          counts['bda'] = (counts['bda'] ?? 0) + 1;
          break;
        case DiagnosticRetenu.dup:
          counts['dup'] = (counts['dup'] ?? 0) + 1;
          break;
        case DiagnosticRetenu.epManiaque:
          counts['ep_maniaque'] = (counts['ep_maniaque'] ?? 0) + 1;
          break;
        case DiagnosticRetenu.dbp:
          counts['dbp'] = (counts['dbp'] ?? 0) + 1;
          break;
        case DiagnosticRetenu.trDelirant:
          counts['tr_delirant'] = (counts['tr_delirant'] ?? 0) + 1;
          break;
        case DiagnosticRetenu.trAnxieux:
          counts['tr_anxieux'] = (counts['tr_anxieux'] ?? 0) + 1;
          break;
        case DiagnosticRetenu.trPersonnaliteSeul:
          counts['personnalite'] = (counts['personnalite'] ?? 0) + 1;
          break;
        case DiagnosticRetenu.autre:
          counts['autre'] = (counts['autre'] ?? 0) + 1;
          break;
        case null:
          counts['autre'] = (counts['autre'] ?? 0) + 1;
          break;
      }
    }

    return counts;
  }
}

// Provider instance
final doctorConsultationsProvider = StateNotifierProvider<DoctorConsultationsNotifier, DoctorConsultationsState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return DoctorConsultationsNotifier(apiClient);
});

// Helper providers
final doctorConsultationsCountProvider = Provider<int>((ref) {
  return ref.watch(doctorConsultationsProvider).filteredConsultations.length;
});

final doctorConsultationsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(doctorConsultationsProvider).isLoading;
});

final doctorConsultationsErrorProvider = Provider<String?>((ref) {
  return ref.watch(doctorConsultationsProvider).error;
});

final doctorConsultationsCountsByRiskProvider = Provider<Map<String, int>>((ref) {
  final notifier = ref.watch(doctorConsultationsProvider.notifier);
  return notifier.getConsultationCountsByRisk();
});

final doctorConsultationsCountsByDiagnosticProvider = Provider<Map<String, int>>((ref) {
  final notifier = ref.watch(doctorConsultationsProvider.notifier);
  return notifier.getConsultationCountsByDiagnostic();
}); 