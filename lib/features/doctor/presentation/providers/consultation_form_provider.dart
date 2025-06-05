import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/domain/entities/consultation.dart';

// Consultation Form State
class ConsultationFormState {
  // Basic info
  final bool isLoading;
  final String? error;

  // Addiction and substance abuse
  final bool addiction;
  final bool tabac;
  final bool alcool;
  final bool cannabis;
  final bool medicaments;
  final bool solvantsorg;

  // Psychiatric history
  final bool atcdsPTs;
  final bool ideesSuiAnt;
  final bool hospitAnt;
  final bool atcdsFamSui;
  final bool suicideAccompli;
  final bool atcdsPSomatik;
  final bool condImpulsiv;
  final bool automit;
  final bool atcdsPJudic;

  // Suicide methods
  final bool immolation;
  final bool moyenphlebotomie;
  final bool mpendaison;
  final bool mmedicaments;
  final bool mstrangulation;
  final bool mingestiontox;
  final bool equiSui;
  final bool sautaltitude;
  final bool mautres;

  // Clinical assessment
  final String? nombresHospit;
  final bool familleContenante;
  final String? typeAtcdspsy;
  final String? diagnosticRetenu;
  final String? typePersonn;
  final bool reactionStress;
  final bool injoncSuicidaires;
  final bool angoissePsychotique;
  final bool etatdepressif;

  // Statistics
  final String? nbresDeTs;
  final String? anciennetemaladie;
  final String? agedebutannee;
  final bool motifTs;

  const ConsultationFormState({
    this.isLoading = false,
    this.error,
    // Addiction defaults
    this.addiction = false,
    this.tabac = false,
    this.alcool = false,
    this.cannabis = false,
    this.medicaments = false,
    this.solvantsorg = false,
    // Psychiatric history defaults
    this.atcdsPTs = false,
    this.ideesSuiAnt = false,
    this.hospitAnt = false,
    this.atcdsFamSui = false,
    this.suicideAccompli = false,
    this.atcdsPSomatik = false,
    this.condImpulsiv = false,
    this.automit = false,
    this.atcdsPJudic = false,
    // Suicide methods defaults
    this.immolation = false,
    this.moyenphlebotomie = false,
    this.mpendaison = false,
    this.mmedicaments = false,
    this.mstrangulation = false,
    this.mingestiontox = false,
    this.equiSui = false,
    this.sautaltitude = false,
    this.mautres = false,
    // Clinical assessment defaults
    this.nombresHospit = '0',
    this.familleContenante = false,
    this.typeAtcdspsy = 'aucune',
    this.diagnosticRetenu = 'autre',
    this.typePersonn = 'PAS',
    this.reactionStress = false,
    this.injoncSuicidaires = false,
    this.angoissePsychotique = false,
    this.etatdepressif = false,
    // Statistics defaults
    this.nbresDeTs = '0',
    this.anciennetemaladie = '0',
    this.agedebutannee = '<=17',
    this.motifTs = false,
  });

  ConsultationFormState copyWith({
    bool? isLoading,
    String? error,
    // Addiction
    bool? addiction,
    bool? tabac,
    bool? alcool,
    bool? cannabis,
    bool? medicaments,
    bool? solvantsorg,
    // Psychiatric history
    bool? atcdsPTs,
    bool? ideesSuiAnt,
    bool? hospitAnt,
    bool? atcdsFamSui,
    bool? suicideAccompli,
    bool? atcdsPSomatik,
    bool? condImpulsiv,
    bool? automit,
    bool? atcdsPJudic,
    // Suicide methods
    bool? immolation,
    bool? moyenphlebotomie,
    bool? mpendaison,
    bool? mmedicaments,
    bool? mstrangulation,
    bool? mingestiontox,
    bool? equiSui,
    bool? sautaltitude,
    bool? mautres,
    // Clinical assessment
    String? nombresHospit,
    bool? familleContenante,
    String? typeAtcdspsy,
    String? diagnosticRetenu,
    String? typePersonn,
    bool? reactionStress,
    bool? injoncSuicidaires,
    bool? angoissePsychotique,
    bool? etatdepressif,
    // Statistics
    String? nbresDeTs,
    String? anciennetemaladie,
    String? agedebutannee,
    bool? motifTs,
  }) {
    return ConsultationFormState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      // Addiction
      addiction: addiction ?? this.addiction,
      tabac: tabac ?? this.tabac,
      alcool: alcool ?? this.alcool,
      cannabis: cannabis ?? this.cannabis,
      medicaments: medicaments ?? this.medicaments,
      solvantsorg: solvantsorg ?? this.solvantsorg,
      // Psychiatric history
      atcdsPTs: atcdsPTs ?? this.atcdsPTs,
      ideesSuiAnt: ideesSuiAnt ?? this.ideesSuiAnt,
      hospitAnt: hospitAnt ?? this.hospitAnt,
      atcdsFamSui: atcdsFamSui ?? this.atcdsFamSui,
      suicideAccompli: suicideAccompli ?? this.suicideAccompli,
      atcdsPSomatik: atcdsPSomatik ?? this.atcdsPSomatik,
      condImpulsiv: condImpulsiv ?? this.condImpulsiv,
      automit: automit ?? this.automit,
      atcdsPJudic: atcdsPJudic ?? this.atcdsPJudic,
      // Suicide methods
      immolation: immolation ?? this.immolation,
      moyenphlebotomie: moyenphlebotomie ?? this.moyenphlebotomie,
      mpendaison: mpendaison ?? this.mpendaison,
      mmedicaments: mmedicaments ?? this.mmedicaments,
      mstrangulation: mstrangulation ?? this.mstrangulation,
      mingestiontox: mingestiontox ?? this.mingestiontox,
      equiSui: equiSui ?? this.equiSui,
      sautaltitude: sautaltitude ?? this.sautaltitude,
      mautres: mautres ?? this.mautres,
      // Clinical assessment
      nombresHospit: nombresHospit ?? this.nombresHospit,
      familleContenante: familleContenante ?? this.familleContenante,
      typeAtcdspsy: typeAtcdspsy ?? this.typeAtcdspsy,
      diagnosticRetenu: diagnosticRetenu ?? this.diagnosticRetenu,
      typePersonn: typePersonn ?? this.typePersonn,
      reactionStress: reactionStress ?? this.reactionStress,
      injoncSuicidaires: injoncSuicidaires ?? this.injoncSuicidaires,
      angoissePsychotique: angoissePsychotique ?? this.angoissePsychotique,
      etatdepressif: etatdepressif ?? this.etatdepressif,
      // Statistics
      nbresDeTs: nbresDeTs ?? this.nbresDeTs,
      anciennetemaladie: anciennetemaladie ?? this.anciennetemaladie,
      agedebutannee: agedebutannee ?? this.agedebutannee,
      motifTs: motifTs ?? this.motifTs,
    );
  }
}

// Consultation Form Provider
class ConsultationFormNotifier extends StateNotifier<ConsultationFormState> {
  final api.ApiClient _apiClient;

  ConsultationFormNotifier(this._apiClient) : super(const ConsultationFormState());

  // Addiction methods
  void updateAddiction(bool value) => state = state.copyWith(addiction: value);
  void updateTabac(bool value) => state = state.copyWith(tabac: value);
  void updateAlcool(bool value) => state = state.copyWith(alcool: value);
  void updateCannabis(bool value) => state = state.copyWith(cannabis: value);
  void updateMedicaments(bool value) => state = state.copyWith(medicaments: value);
  void updateSolvantsorg(bool value) => state = state.copyWith(solvantsorg: value);

  // Psychiatric history methods
  void updateAtcdsPTs(bool value) => state = state.copyWith(atcdsPTs: value);
  void updateIdeesSuiAnt(bool value) => state = state.copyWith(ideesSuiAnt: value);
  void updateHospitAnt(bool value) => state = state.copyWith(hospitAnt: value);
  void updateAtcdsFamSui(bool value) => state = state.copyWith(atcdsFamSui: value);
  void updateSuicideAccompli(bool value) => state = state.copyWith(suicideAccompli: value);
  void updateAtcdsPSomatik(bool value) => state = state.copyWith(atcdsPSomatik: value);
  void updateCondImpulsiv(bool value) => state = state.copyWith(condImpulsiv: value);
  void updateAutomit(bool value) => state = state.copyWith(automit: value);
  void updateAtcdsPJudic(bool value) => state = state.copyWith(atcdsPJudic: value);

  // Suicide methods
  void updateImmolation(bool value) => state = state.copyWith(immolation: value);
  void updateMoyenphlebotomie(bool value) => state = state.copyWith(moyenphlebotomie: value);
  void updateMpendaison(bool value) => state = state.copyWith(mpendaison: value);
  void updateMmedicaments(bool value) => state = state.copyWith(mmedicaments: value);
  void updateMstrangulation(bool value) => state = state.copyWith(mstrangulation: value);
  void updateMingestiontox(bool value) => state = state.copyWith(mingestiontox: value);
  void updateEquiSui(bool value) => state = state.copyWith(equiSui: value);
  void updateSautaltitude(bool value) => state = state.copyWith(sautaltitude: value);
  void updateMautres(bool value) => state = state.copyWith(mautres: value);

  // Clinical assessment methods
  void updateNombresHospit(String? value) => state = state.copyWith(nombresHospit: value);
  void updateFamilleContenante(bool value) => state = state.copyWith(familleContenante: value);
  void updateTypeAtcdspsy(String? value) => state = state.copyWith(typeAtcdspsy: value);
  void updateDiagnosticRetenu(String? value) => state = state.copyWith(diagnosticRetenu: value);
  void updateTypePersonn(String? value) => state = state.copyWith(typePersonn: value);
  void updateReactionStress(bool value) => state = state.copyWith(reactionStress: value);
  void updateInjoncSuicidaires(bool value) => state = state.copyWith(injoncSuicidaires: value);
  void updateAngoissePsychotique(bool value) => state = state.copyWith(angoissePsychotique: value);
  void updateEtatdepressif(bool value) => state = state.copyWith(etatdepressif: value);

  // Statistics methods
  void updateNbresDeTs(String? value) => state = state.copyWith(nbresDeTs: value);
  void updateAnciennetemaladie(String? value) => state = state.copyWith(anciennetemaladie: value);
  void updateAgedebutannee(String? value) => state = state.copyWith(agedebutannee: value);
  void updateMotifTs(bool value) => state = state.copyWith(motifTs: value);

  // Reset form
  void resetForm() {
    state = const ConsultationFormState();
  }

  // Submit consultation
  Future<bool> submitConsultation({
    required String appointmentId,
    required String patientId,
    required String doctorId,
    String? remarque,
  }) async {
    debugPrint('[CONSULTATION_FORM] Starting submission...');
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Validate required fields
      if (state.nombresHospit == null || state.nombresHospit!.isEmpty) {
        throw Exception('Le nombre d\'hospitalisations est requis');
      }
      if (state.typeAtcdspsy == null || state.typeAtcdspsy!.isEmpty) {
        throw Exception('Le type d\'antécédents psychiatriques est requis');
      }
      if (state.diagnosticRetenu == null || state.diagnosticRetenu!.isEmpty) {
        throw Exception('Le diagnostic retenu est requis');
      }
      if (state.typePersonn == null || state.typePersonn!.isEmpty) {
        throw Exception('Le type de personnalité est requis');
      }
      if (state.nbresDeTs == null || state.nbresDeTs!.isEmpty) {
        throw Exception('Le nombre de tentatives de suicide est requis');
      }
      if (state.anciennetemaladie == null || state.anciennetemaladie!.isEmpty) {
        throw Exception('L\'ancienneté de la maladie est requise');
      }
      if (state.agedebutannee == null || state.agedebutannee!.isEmpty) {
        throw Exception('L\'âge de début est requis');
      }

      // Create consultation data
      final consultationData = CreateConsultationDto(
        numDossier: patientId,
        idMed: doctorId,
        date: DateTime.now().toIso8601String().split('T')[0], // Current date
        // Addiction
        addiction: state.addiction,
        tabac: state.tabac,
        alcool: state.alcool,
        cannabis: state.cannabis,
        medicaments: state.medicaments,
        solvantsorg: state.solvantsorg,
        // Psychiatric history
        atcdsPTs: state.atcdsPTs,
        ideesSuiAnt: state.ideesSuiAnt,
        hospitAnt: state.hospitAnt,
        atcdsFamSui: state.atcdsFamSui,
        suicideAccompli: state.suicideAccompli,
        atcdsPSomatik: state.atcdsPSomatik,
        condImpulsiv: state.condImpulsiv,
        automit: state.automit,
        atcdsPJudic: state.atcdsPJudic,
        // Suicide methods
        immolation: state.immolation,
        moyenphlebotomie: state.moyenphlebotomie,
        mpendaison: state.mpendaison,
        mmedicaments: state.mmedicaments,
        mstrangulation: state.mstrangulation,
        mingestiontox: state.mingestiontox,
        equiSui: state.equiSui,
        sautaltitude: state.sautaltitude,
        mautres: state.mautres,
        // Clinical assessment
        nombresHospit: state.nombresHospit!,
        familleContenante: state.familleContenante,
        typeAtcdspsy: state.typeAtcdspsy!,
        diagnosticRetenu: state.diagnosticRetenu!,
        typePersonn: state.typePersonn!,
        reactionStress: state.reactionStress,
        injoncSuicidaires: state.injoncSuicidaires,
        angoissePsychotique: state.angoissePsychotique,
        etatdepressif: state.etatdepressif,
        // Statistics
        nbresDeTs: state.nbresDeTs!,
        anciennetemaladie: state.anciennetemaladie!,
        agedebutannee: state.agedebutannee!,
        motifTs: state.motifTs,
        remarque: remarque,
      );

      debugPrint('[CONSULTATION_FORM] 🔍 Consultation data created:');
      debugPrint('[CONSULTATION_FORM] - Patient ID: $patientId');
      debugPrint('[CONSULTATION_FORM] - Doctor ID: $doctorId');
      debugPrint('[CONSULTATION_FORM] - Type Atcdspsy: ${state.typeAtcdspsy}');
      debugPrint('[CONSULTATION_FORM] - Diagnostic Retenu: ${state.diagnosticRetenu}');
      debugPrint('[CONSULTATION_FORM] - Type Personnalite: ${state.typePersonn}');
      debugPrint('[CONSULTATION_FORM] - JSON: ${consultationData.toJson()}');

      // Create API request
      final request = api.CreateConsultationFromAppointmentApiRequest(
        appointmentId: appointmentId,
        consultationData: consultationData.toJson(),
      );

      debugPrint('[CONSULTATION_FORM] Sending request to API...');
      final response = await _apiClient.createConsultationFromAppointment(request);

      debugPrint('[CONSULTATION_FORM] ✅ Consultation created successfully');
      state = state.copyWith(isLoading: false);
      return true;

    } catch (e) {
      debugPrint('[CONSULTATION_FORM] ❌ Error creating consultation: $e');
      String errorMessage = 'Erreur lors de la création de la consultation';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Session expirée. Veuillez vous reconnecter.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Accès refusé. Seuls les médecins peuvent créer des consultations.';
      } else if (e.toString().contains('404')) {
        errorMessage = 'Rendez-vous non trouvé.';
      } else if (e.toString().contains('409')) {
        errorMessage = 'Ce rendez-vous a déjà une consultation associée.';
      } else if (e.toString().contains('500')) {
        errorMessage = 'Erreur serveur. Veuillez réessayer plus tard.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Erreur de connexion. Vérifiez votre connexion internet.';
      } else if (e is Exception) {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );
      return false;
    }
  }

  // 🛸 ALIEN UPDATE CONSULTATION METHOD
  Future<bool> updateConsultation({
    required String consultationId,
    String? remarque,
  }) async {
    debugPrint('[CONSULTATION_FORM] 🛸 Starting consultation update...');
    state = state.copyWith(isLoading: true, error: null);

    try {
      // Validate required fields
      if (state.nombresHospit == null || state.nombresHospit!.isEmpty) {
        throw Exception('Le nombre d\'hospitalisations est requis');
      }
      if (state.typeAtcdspsy == null || state.typeAtcdspsy!.isEmpty) {
        throw Exception('Le type d\'antécédents psychiatriques est requis');
      }
      if (state.diagnosticRetenu == null || state.diagnosticRetenu!.isEmpty) {
        throw Exception('Le diagnostic retenu est requis');
      }
      if (state.typePersonn == null || state.typePersonn!.isEmpty) {
        throw Exception('Le type de personnalité est requis');
      }
      if (state.nbresDeTs == null || state.nbresDeTs!.isEmpty) {
        throw Exception('Le nombre de tentatives de suicide est requis');
      }
      if (state.anciennetemaladie == null || state.anciennetemaladie!.isEmpty) {
        throw Exception('L\'ancienneté de la maladie est requise');
      }
      if (state.agedebutannee == null || state.agedebutannee!.isEmpty) {
        throw Exception('L\'âge de début est requis');
      }

      // 🛸 ALIEN PERFECT API MAPPING - Exact backend DTO compliance
      final updateData = {
        // 🚨 ADDICTION SECTION - Exact field names
        'addiction': state.addiction,
        'TABAC': state.tabac,  // Note: Uppercase TABAC as per backend
        'alcool': state.alcool,
        'cannabis': state.cannabis,
        'medicaments': state.medicaments,
        'solvantsorg': state.solvantsorg,
        
        // 🧠 PSYCHIATRIC HISTORY - Exact field names
        'AtcdsP_TS': state.atcdsPTs,  // Exact case matching
        'idees_sui_ant': state.ideesSuiAnt,
        'hospit_ant': state.hospitAnt,
        'atcdsFam_SUI': state.atcdsFamSui,  // Exact case matching
        'suicide_accompli': state.suicideAccompli,
        'AtcdsP_somatik': state.atcdsPSomatik,  // Exact case matching
        'cond_impulsiv': state.condImpulsiv,
        'automit': state.automit,  // 🔧 FIXED: was "automil"
        'atcds_p_judic': state.atcdsPJudic,
        
        // ⚕️ SUICIDE METHODS - Exact field names
        'immolation': state.immolation,
        'moyenphlebotomie': state.moyenphlebotomie,
        'Mpendaison': state.mpendaison,  // Note: Capital M
        'Mmedicaments': state.mmedicaments,  // Note: Capital M
        'Mstrangulation': state.mstrangulation,  // Note: Capital M
        'Mingestiontox': state.mingestiontox,  // Note: Capital M
        'EQUIsui': state.equiSui,  // Exact case matching
        'sautaltitude': state.sautaltitude,
        'Mautres': state.mautres,  // Note: Capital M
        
        // 🏥 CLINICAL ASSESSMENT - Perfect enum mapping
        'nombres_hospit': _mapNombreHospitalisationEnum(state.nombresHospit!),
        'famille_contenante': state.familleContenante,
        'type_atcdspsy': _mapTypeAtcdsPsyEnum(state.typeAtcdspsy!),
        'diagnostic_retenu': _mapDiagnosticRetenuEnum(state.diagnosticRetenu!),
        'type_personn': _mapTypePersonnaliteEnum(state.typePersonn!),
        'reaction_stress': state.reactionStress,
        'injonc_suicidaires': state.injoncSuicidaires,
        'angoisse_psychotique': state.angoissePsychotique,
        'etatdepressif': state.etatdepressif,
        
        // 📊 STATISTICS - Exact field names and enum mapping
        'nbres_de_ts': _mapNombreTentativesSuicideEnum(state.nbresDeTs!),
        'anciennetemaladie': _mapAncienneteMaladieEnum(state.anciennetemaladie!),
        'agedebutannee': _mapAgeDebutAnneeEnum(state.agedebutannee!),  // 🔥 THANOS FIX: UPDATE DTO expects 'agedebutannee' (getter/setter name)
        'motifTS': state.motifTs,
        
        // 📝 REMARKS
        if (remarque != null) 'remarque': remarque,
      };

      // Create API request
      final request = api.UpdateConsultationApiRequest(
        consultationData: updateData,
      );

      debugPrint('[CONSULTATION_FORM] 🛸 Sending update request to API...');
      debugPrint('[CONSULTATION_FORM] 🛸 Update data: $updateData');
      final response = await _apiClient.updateConsultation(consultationId, request);

      debugPrint('[CONSULTATION_FORM] ✅ Consultation updated successfully');
      state = state.copyWith(isLoading: false);
      return true;

    } catch (e) {
      debugPrint('[CONSULTATION_FORM] ❌ Error updating consultation: $e');
      String errorMessage = 'Erreur lors de la mise à jour de la consultation';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Session expirée. Veuillez vous reconnecter.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Accès refusé. Seuls les médecins peuvent modifier des consultations.';
      } else if (e.toString().contains('404')) {
        errorMessage = 'Consultation non trouvée.';
      } else if (e.toString().contains('500')) {
        errorMessage = 'Erreur serveur. Veuillez réessayer plus tard.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Erreur de connexion. Vérifiez votre connexion internet.';
      } else if (e is Exception) {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );
      return false;
    }
  }

  // 🛸 ALIEN POPULATE FORM METHOD - Pre-fill form with existing consultation data
  void populateFormWithConsultation(Consultation consultation) {
    debugPrint('[CONSULTATION_FORM] 🛸 Populating form with existing consultation data...');
    
    // 🛸 ALIEN SAFE ENUM CONVERSION - Handle potential null/invalid enum values
    final safeTypeAtcdspsy = _enumToString(consultation.typeAtcdsPsy) ?? 'aucune';
    final safeDiagnosticRetenu = _enumToString(consultation.diagnosticRetenu) ?? 'autre';
    final safeTypePersonn = _enumToString(consultation.typePersonn) ?? 'PAS';
    
    debugPrint('[CONSULTATION_FORM] 🛸 Enum conversions - typeAtcdspsy: $safeTypeAtcdspsy, diagnosticRetenu: $safeDiagnosticRetenu, typePersonn: $safeTypePersonn');
    
    state = state.copyWith(
      // Addiction
      addiction: consultation.addiction ?? false,
      tabac: consultation.tabac ?? false,
      alcool: consultation.alcool ?? false,
      cannabis: consultation.cannabis ?? false,
      medicaments: consultation.medicaments ?? false,
      solvantsorg: consultation.solvantsorg ?? false,
      // Psychiatric history
      atcdsPTs: consultation.atcdsPTs ?? false,
      ideesSuiAnt: consultation.ideesSuiAnt ?? false,
      hospitAnt: consultation.hospitAnt ?? false,
      atcdsFamSui: consultation.atcdsFamSui ?? false,
      suicideAccompli: consultation.suicideAccompli ?? false,
      atcdsPSomatik: consultation.atcdsPSomatik ?? false,
      condImpulsiv: consultation.condImpulsiv ?? false,
      automit: consultation.automil ?? false,
      atcdsPJudic: consultation.atcdsPJudic ?? false,
      // Suicide methods
      immolation: consultation.immolation ?? false,
      moyenphlebotomie: consultation.moyenphlebotomie ?? false,
      mpendaison: consultation.mpendaison ?? false,
      mmedicaments: consultation.mmedicaments ?? false,
      mstrangulation: consultation.mstrangulation ?? false,
      mingestiontox: consultation.mingestiontox ?? false,
      equiSui: consultation.equiSui ?? false,
      sautaltitude: consultation.sautaltitude ?? false,
      mautres: consultation.mautres ?? false,
      // Clinical assessment
      nombresHospit: consultation.nombresHospit ?? '0',
      familleContenante: consultation.familleContenante ?? false,
      typeAtcdspsy: safeTypeAtcdspsy,
      diagnosticRetenu: safeDiagnosticRetenu,
      typePersonn: safeTypePersonn,
      reactionStress: consultation.reactionStress ?? false,
      injoncSuicidaires: consultation.injoncSuicidaires ?? false,
      angoissePsychotique: consultation.angoissePsychotique ?? false,
      etatdepressif: consultation.etatdepressif ?? false,
      // Statistics
      nbresDeTs: consultation.nbresDeTs ?? '0',
      anciennetemaladie: consultation.ancienneteMaladie ?? '0',
      agedebutannee: consultation.ageDebutAnne ?? '<=17',
      motifTs: consultation.motifTs ?? false,
    );
    
    debugPrint('[CONSULTATION_FORM] ✅ Form populated with consultation data');
  }

  // 🛸 ALIEN HELPER METHOD - Convert enum to string for API compatibility
  String? _enumToString(dynamic enumValue) {
    if (enumValue == null) return null;
    
    // For enums with JsonValue annotations, get the string representation
    if (enumValue is TypeAtcdsPsy) {
      switch (enumValue) {
        case TypeAtcdsPsy.aucune:
          return 'aucune';
        case TypeAtcdsPsy.depression:
          return 'trouble de l\'humeur';
        case TypeAtcdsPsy.anxiete:
          return 'trouble anxieux';
        case TypeAtcdsPsy.bipolaire:
          return 'trouble psychotique';
        case TypeAtcdsPsy.autre:
          return 'autre';
        default:
          return 'aucune';
      }
    }
    
    if (enumValue is DiagnosticRetenu) {
      switch (enumValue) {
        case DiagnosticRetenu.skz:
          return 'SKZ';
        case DiagnosticRetenu.bda:
          return 'BDA';
        case DiagnosticRetenu.dup:
          return 'DUP';
        case DiagnosticRetenu.epManiaque:
          return 'ep_maniaque';
        case DiagnosticRetenu.autre:
          return 'autre';
        case DiagnosticRetenu.trPersonnaliteSeul:
          return 'tr_personnalité_seul';
        case DiagnosticRetenu.dbp:
          return 'DBP';
        case DiagnosticRetenu.trDelirant:
          return 'tr_delirant';
        case DiagnosticRetenu.trAnxieux:
          return 'tr_anxieux';
        default:
          return 'autre';
      }
    }
    
    if (enumValue is TypePersonnalite) {
      switch (enumValue) {
        case TypePersonnalite.pas:
          return 'PAS';
        case TypePersonnalite.antisociale:
          return 'antisociale';
        case TypePersonnalite.histrionique:
          return 'histrionique';
        case TypePersonnalite.borderline:
          return 'Borderline';
        default:
          return 'PAS';
      }
    }
    
    // Fallback for any other enum type
    return enumValue.toString().split('.').last.toLowerCase();
  }

  // 🛸 ALIEN PERFECT ENUM MAPPING - EXACT BACKEND SCHEMA COMPLIANCE
  String _mapNombreHospitalisationEnum(String value) {
    // DIRECT PASS-THROUGH - Backend expects exact values
    return value; // '0', '1', '2', '3', '>4'
  }

  String _mapTypeAtcdsPsyEnum(String value) {
    // EXACT BACKEND ENUM VALUES - TypeAtcdsPsy enum
    return value; // Form already has correct values: 'aucune', 'trouble de l'humeur', etc.
  }

  String _mapDiagnosticRetenuEnum(String value) {
    // EXACT BACKEND ENUM VALUES - DiagnosticRetenu enum
    // Backend expects: SKZ, ep_maniaque, DUP, autre, BDA, tr_anxieux, DBP, tr_delirant, tr_personnalité_seul
    return value; // Form already has correct values
  }

  String _mapTypePersonnaliteEnum(String value) {
    // EXACT BACKEND ENUM VALUES - TypePersonnalite enum
    switch (value.toLowerCase()) {
      case 'pas':
        return 'PAS';
      case 'antisociale':
        return 'antisociale';
      case 'histrionique':
        return 'histrionique';
      case 'borderline':
        return 'Borderline';  // 🔧 CRITICAL: Capital B as per backend schema
      default:
        return 'PAS';
    }
  }

  String _mapNombreTentativesSuicideEnum(String value) {
    // DIRECT PASS-THROUGH - Backend expects exact values
    return value; // '0', '1', '2', '3', '>4'
  }

  String _mapAncienneteMaladieEnum(String value) {
    // EXACT BACKEND ENUM VALUES - AncienneteMaladie enum
    // Backend expects: '0', '<=5', '6-10', '11-20', '>20'
    switch (value) {
      case '0':
        return '0';
      case '<=5':
        return '<=5';
      case '6-10':
        return '6-10';
      case '11-20':
        return '11-20';
      case '>20':
        return '>20';
      default:
        return '0';
    }
  }

  String _mapAgeDebutAnneeEnum(String value) {
    // EXACT BACKEND ENUM VALUES - AgeDebutAnnee enum
    // Backend expects: '<=17', '18-40', '41-60', '>60'
    switch (value) {
      case '<=17':
        return '<=17';
      case '18-40':
        return '18-40';
      case '41-60':
        return '41-60';
      case '>60':
        return '>60';
      default:
        return '<=17';
    }
  }
}

// Provider
final consultationFormProvider = StateNotifierProvider<ConsultationFormNotifier, ConsultationFormState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return ConsultationFormNotifier(apiClient);
}); 