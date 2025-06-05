import 'package:foresight_care/domain/entities/prediction_results.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consultation.freezed.dart';
part 'consultation.g.dart';

enum DiagnosticRetenu {
  @JsonValue('SKZ')
  skz,
  @JsonValue('BDA')
  bda,
  @JsonValue('DUP')
  dup,
  @JsonValue('ep_maniaque')
  epManiaque,
  @JsonValue('autre')
  autre,
  @JsonValue('tr_personnalité_seul')
  trPersonnaliteSeul,
  @JsonValue('DBP')
  dbp,
  @JsonValue('tr_delirant')
  trDelirant,
  @JsonValue('tr_anxieux')
  trAnxieux,
}

enum TypePersonnalite {
  @JsonValue('PAS')
  pas,
  @JsonValue('antisociale')
  antisociale,
  @JsonValue('histrionique')
  histrionique,
  @JsonValue('Borderline')
  borderline,
}

enum TypeAtcdsPsy {
  @JsonValue('aucune')
  aucune,
  @JsonValue('depression')
  depression,
  @JsonValue('anxiete')
  anxiete,
  @JsonValue('bipolaire')
  bipolaire,
  @JsonValue('autre')
  autre,
}

@freezed
class ConsultationPatientInfo with _$ConsultationPatientInfo {
  const factory ConsultationPatientInfo({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'nom_patient') required String nomPatient,
    @JsonKey(name: 'pren_patient') required String prenPatient,
    @JsonKey(name: 'cin_cnam') int? cinCnam,
    @JsonKey(name: 'date_naiss') String? dateNaiss,
    @JsonKey(name: 'age_int') String? ageInt,
    @JsonKey(name: 'telephone') int? telephone,
    @JsonKey(name: 'sexe') String? sexe,
    @JsonKey(name: 'etatcivil') String? etatcivil,
    @JsonKey(name: 'origine') String? origine,
    @JsonKey(name: 'lieuderesidence') String? lieuderesidence,
    @JsonKey(name: 'villederesidence') String? villederesidence,
    @JsonKey(name: 'nvscolaire') String? nvscolaire,
    @JsonKey(name: 'type_prof') String? typeProf,
    @JsonKey(name: 'nv_socioeconomique') String? nvSocioeconomique,
  }) = _ConsultationPatientInfo;

  factory ConsultationPatientInfo.fromJson(Map<String, dynamic> json) => 
      _$ConsultationPatientInfoFromJson(json);
}

@freezed
class Consultation with _$Consultation {
  const factory Consultation({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'num_consult') required String numConsult,
    @JsonKey(name: 'num_dossier') ConsultationPatientInfo? numDossier,
    @JsonKey(name: 'id_med') String? idMed,
    @JsonKey(name: 'date_heure') String? dateHeure,
    
    // Addiction and substance abuse
    @Default(false) bool addiction,
    @Default(false) @JsonKey(name: 'TABAC') bool tabac,
    @Default(false) bool alcool,
    @Default(false) bool cannabis,
    @Default(false) bool medicaments,
    @Default(false) bool solvantsorg,
    
    // Psychiatric history
    @Default(false) @JsonKey(name: 'AtcdsP_TS') bool atcdsPTs,
    @Default(false) @JsonKey(name: 'idees_sui_ant') bool ideesSuiAnt,
    @Default(false) @JsonKey(name: 'hospit_ant') bool hospitAnt,
    @Default(false) @JsonKey(name: 'atcdsFam_SUI') bool atcdsFamSui,
    @Default(false) @JsonKey(name: 'suicide_accompli') bool suicideAccompli,
    @Default(false) @JsonKey(name: 'AtcdsP_somatik') bool atcdsPSomatik,
    @Default(false) @JsonKey(name: 'cond_impulsiv') bool condImpulsiv,
    @Default(false) bool automil,
    @Default(false) @JsonKey(name: 'atcds_p_judic') bool atcdsPJudic,
    
    // Suicide methods
    @Default(false) bool immolation,
    @Default(false) bool moyenphlebotomie,
    @Default(false) @JsonKey(name: 'Mpendaison') bool mpendaison,
    @Default(false) @JsonKey(name: 'Mmedicaments') bool mmedicaments,
    @JsonKey(name: 'Mstrangulation') bool? mstrangulation,
    @Default(false) @JsonKey(name: 'Mingestiontox') bool mingestiontox,
    @Default(false) @JsonKey(name: 'EQUIsui') bool equiSui,
    @Default(false) bool sautaltitude,
    @Default(false) @JsonKey(name: 'Mautres') bool mautres,
    
    // Clinical assessment
    @JsonKey(name: 'nombres_hospit') String? nombresHospit,
    @Default(false) @JsonKey(name: 'famille_contenante') bool familleContenante,
    @JsonKey(name: 'type_atcdspsy') TypeAtcdsPsy? typeAtcdsPsy,
    @JsonKey(name: 'diagnostic_retenu') DiagnosticRetenu? diagnosticRetenu,
    @JsonKey(name: 'type_personn') TypePersonnalite? typePersonn,
    @Default(false) @JsonKey(name: 'reaction_stress') bool reactionStress,
    @Default(false) @JsonKey(name: 'injonc_suicidaires') bool injoncSuicidaires,
    @Default(false) @JsonKey(name: 'angoisse_psychotique') bool angoissePsychotique,
    @Default(false) bool etatdepressif,
    
    // Statistics
    @JsonKey(name: 'nbres_de_ts') String? nbresDeTs,
    @JsonKey(name: 'anciennetemaladie') String? ancienneteMaladie,
    @JsonKey(name: 'agedebutannee') String? ageDebutAnne,
    @Default(false) @JsonKey(name: 'motifTS') bool motifTs,
    String? remarque,
    
    // Patient details (duplicated in consultation)
    @JsonKey(name: 'nom_patient') String? nomPatient,
    @JsonKey(name: 'pren_patient') String? prenPatient,
    @JsonKey(name: 'cin_cnam') int? cinCnam,
    @JsonKey(name: 'date_naiss') String? dateNaiss,
    @JsonKey(name: 'age_int') String? ageInt,
    int? telephone,
    String? sexe,
    String? etatcivil,
    String? origine,
    String? lieuderesidence,
    String? villederesidence,
    String? nvscolaire,
    @JsonKey(name: 'type_prof') String? typeProf,
    @JsonKey(name: 'nv_socioeconomique') String? nvSocioeconomique,
    
    // Medical staff info
    @JsonKey(name: 'id_sec') String? idSec,
    @JsonKey(name: 'nom_med') String? nomMed,
    @JsonKey(name: 'pren_med') String? prenMed,
    
    // Prediction
    @Default(false) @JsonKey(name: 'prediction_generee') bool predictionGeneree,
    @JsonKey(name: 'prediction_risque') String? predictionRisque,
    @JsonKey(name: 'date_prediction') DateTime? datePrediction,
    @JsonKey(name: 'prediction_results') PredictionResults? predictionResults,
    
    // Timestamps
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Consultation;

  factory Consultation.fromJson(Map<String, dynamic> json) {
    try {
      print('[CONSULTATION_PARSE] Parsing consultation: ${json['num_consult']}');
      
      // Handle the nested patient info
      ConsultationPatientInfo? patientInfo;
      if (json['num_dossier'] is Map<String, dynamic>) {
        patientInfo = ConsultationPatientInfo.fromJson(json['num_dossier']);
      }
      
      // Handle prediction results
      PredictionResults? predictionResults;
      if (json['prediction_results'] is Map<String, dynamic>) {
        try {
          predictionResults = PredictionResults.fromJson(json['prediction_results']);
          print('[CONSULTATION_PARSE] Successfully parsed prediction_results');
        } catch (e) {
          print('[CONSULTATION_PARSE] Error parsing prediction_results: $e');
        }
      }
      
      // Handle date_prediction
      DateTime? datePrediction;
      if (json['date_prediction'] != null) {
        try {
          if (json['date_prediction'] is Map<String, dynamic> && 
              json['date_prediction']['\$date'] != null) {
            datePrediction = DateTime.parse(json['date_prediction']['\$date']);
          } else if (json['date_prediction'] is String) {
            datePrediction = DateTime.parse(json['date_prediction']);
          }
        } catch (e) {
          print('[CONSULTATION_PARSE] Error parsing date_prediction: $e');
        }
      }
      
      return Consultation(
        id: json['_id'],
        numConsult: json['num_consult'] ?? '',
        numDossier: patientInfo,
        idMed: json['id_med'],
        dateHeure: json['date_heure'],
        
        // Addictions
        addiction: json['addiction'] ?? false,
        tabac: json['TABAC'] ?? false,
        alcool: json['alcool'] ?? false,
        cannabis: json['cannabis'] ?? false,
        medicaments: json['medicaments'] ?? false,
        solvantsorg: json['solvantsorg'] ?? false,
        
        // Psychiatric history
        atcdsPTs: json['AtcdsP_TS'] ?? false,
        ideesSuiAnt: json['idees_sui_ant'] ?? false,
        hospitAnt: json['hospit_ant'] ?? false,
        atcdsFamSui: json['atcdsFam_SUI'] ?? false,
        suicideAccompli: json['suicide_accompli'] ?? false,
        atcdsPSomatik: json['AtcdsP_somatik'] ?? false,
        condImpulsiv: json['cond_impulsiv'] ?? false,
        automil: json['automil'] ?? false,
        atcdsPJudic: json['atcds_p_judic'] ?? false,
        
        // Suicide methods
        immolation: json['immolation'] ?? false,
        moyenphlebotomie: json['moyenphlebotomie'] ?? false,
        mpendaison: json['Mpendaison'] ?? false,
        mmedicaments: json['Mmedicaments'] ?? false,
        mstrangulation: json['Mstrangulation'],
        mingestiontox: json['Mingestiontox'] ?? false,
        equiSui: json['EQUIsui'] ?? false,
        sautaltitude: json['sautaltitude'] ?? false,
        mautres: json['Mautres'] ?? false,
        
        // Clinical assessment
        nombresHospit: json['nombres_hospit'],
        familleContenante: json['famille_contenante'] ?? false,
        typeAtcdsPsy: _parseTypeAtcdsPsy(json['type_atcdspsy']),
        diagnosticRetenu: _parseDiagnosticRetenu(json['diagnostic_retenu']),
        typePersonn: _parseTypePersonnalite(json['type_personn']),
        reactionStress: json['reaction_stress'] ?? false,
        injoncSuicidaires: json['injonc_suicidaires'] ?? false,
        angoissePsychotique: json['angoisse_psychotique'] ?? false,
        etatdepressif: json['etatdepressif'] ?? false,
        
        // Statistics
        nbresDeTs: json['nbres_de_ts'],
        ancienneteMaladie: json['anciennetemaladie'],
        ageDebutAnne: json['agedebutannee'],
        motifTs: json['motifTS'] ?? false,
        remarque: json['remarque'],
        
        // Patient details
        nomPatient: json['nom_patient'],
        prenPatient: json['pren_patient'],
        cinCnam: json['cin_cnam'],
        dateNaiss: json['date_naiss'],
        ageInt: json['age_int'],
        telephone: json['telephone'],
        sexe: json['sexe'],
        etatcivil: json['etatcivil'],
        origine: json['origine'],
        lieuderesidence: json['lieuderesidence'],
        villederesidence: json['villederesidence'],
        nvscolaire: json['nvscolaire'],
        typeProf: json['type_prof'],
        nvSocioeconomique: json['nv_socioeconomique'],
        
        // Medical staff
        idSec: json['id_sec'],
        nomMed: json['nom_med'],
        prenMed: json['pren_med'],
        
        // Prediction
        predictionGeneree: json['prediction_generee'] ?? false,
        predictionRisque: json['prediction_risque'],
        datePrediction: datePrediction,
        predictionResults: predictionResults,
        
        // Timestamps
        createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
        updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      );
    } catch (e, stackTrace) {
      print('[CONSULTATION_PARSE] Error parsing consultation: $e');
      print('[CONSULTATION_PARSE] Stack trace: $stackTrace');
      rethrow;
    }
  }
  
  static TypeAtcdsPsy? _parseTypeAtcdsPsy(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'aucune':
        return TypeAtcdsPsy.aucune;
      case 'depression':
        return TypeAtcdsPsy.depression;
      case 'anxiete':
        return TypeAtcdsPsy.anxiete;
      case 'bipolaire':
        return TypeAtcdsPsy.bipolaire;
      case 'autre':
        return TypeAtcdsPsy.autre;
      default:
        return TypeAtcdsPsy.aucune;
    }
  }
  
  static DiagnosticRetenu? _parseDiagnosticRetenu(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'skz':
        return DiagnosticRetenu.skz;
      case 'bda':
        return DiagnosticRetenu.bda;
      case 'dup':
        return DiagnosticRetenu.dup;
      case 'ep_maniaque':
        return DiagnosticRetenu.epManiaque;
      case 'autre':
        return DiagnosticRetenu.autre;
      case 'tr_personnalité_seul':
        return DiagnosticRetenu.trPersonnaliteSeul;
      case 'dbp':
        return DiagnosticRetenu.dbp;
      case 'tr_delirant':
        return DiagnosticRetenu.trDelirant;
      case 'tr_anxieux':
        return DiagnosticRetenu.trAnxieux;
      default:
        return DiagnosticRetenu.autre;
    }
  }
  
  static TypePersonnalite? _parseTypePersonnalite(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'pas':
        return TypePersonnalite.pas;
      case 'antisociale':
        return TypePersonnalite.antisociale;
      case 'histrionique':
        return TypePersonnalite.histrionique;
      case 'borderline':
        return TypePersonnalite.borderline;
      default:
        return TypePersonnalite.pas;
    }
  }
}

// Extensions for display purposes
extension ConsultationDisplayExtension on Consultation {
  String get patientFullName {
    final nom = numDossier?.nomPatient ?? nomPatient ?? '';
    final prenom = numDossier?.prenPatient ?? prenPatient ?? '';
    return '$prenom $nom'.trim();
  }
  
  String get patientCin {
    return (numDossier?.cinCnam ?? cinCnam)?.toString() ?? 'N/A';
  }
  
  String get diagnosticDisplay {
    switch (diagnosticRetenu) {
      case DiagnosticRetenu.skz:
        return 'SKZ';
      case DiagnosticRetenu.bda:
        return 'BDA';
      case DiagnosticRetenu.dup:
        return 'DUP';
      case DiagnosticRetenu.epManiaque:
        return 'Épisode maniaque';
      case DiagnosticRetenu.autre:
        return 'Autre';
      case DiagnosticRetenu.trPersonnaliteSeul:
        return 'Trouble de personnalité seul';
      case DiagnosticRetenu.dbp:
        return 'DBP';
      case DiagnosticRetenu.trDelirant:
        return 'Trouble délirant';
      case DiagnosticRetenu.trAnxieux:
        return 'Trouble anxieux';
      case null:
        return 'Non spécifié';
    }
  }
  
  String get riskLevel {
    if (predictionRisque != null) {
      switch (predictionRisque!.toLowerCase()) {
        case 'élevé':
        case 'eleve':
        case 'high':
          return 'Élevé';
        case 'moyen':
        case 'medium':
          return 'Moyen';
        case 'faible':
        case 'low':
          return 'Faible';
        default:
          return predictionRisque!;
      }
    }
    return 'Non évalué';
  }
  
  String get formattedDate {
    if (dateHeure != null) {
      try {
        final date = DateTime.parse(dateHeure!);
        return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
      } catch (e) {
        return dateHeure!;
      }
    }
    return 'Non spécifiée';
  }
}

// Extended enums with proper mappings for the API
enum TypeAtcdspsyEnum {
  @JsonValue('aucune')
  aucune,
  @JsonValue('trouble de l\'humeur')
  troubleHumeur,
  @JsonValue('autre')
  autre,
  @JsonValue('trouble psychotique')
  troublePsychotique,
  @JsonValue('troubles cognitifs')
  troublesCognitifs,
  @JsonValue('non précisé')
  nonPrecise,
  @JsonValue('trouble anxieux')
  troubleAnxieux,
}

enum DiagnosticRetenuEnum {
  @JsonValue('SKZ')
  skz,
  @JsonValue('ep_maniaque')
  epManiaque,
  @JsonValue('DUP')
  dup,
  @JsonValue('autre')
  autre,
  @JsonValue('BDA')
  bda,
  @JsonValue('tr_anxieux')
  trAnxieux,
  @JsonValue('DBP')
  dbp,
  @JsonValue('tr_delirant')
  trDelirant,
  @JsonValue('tr_personnalité_seul')
  trPersonnaliteSeul,
}

enum TypePersonnaliteEnum {
  @JsonValue('PAS')
  pas,
  @JsonValue('antisociale')
  antisociale,
  @JsonValue('histrionique')
  histrionique,
  @JsonValue('Borderline')
  borderline,
}

// DTO for creating consultation data
@freezed
class CreateConsultationDto with _$CreateConsultationDto {
  const factory CreateConsultationDto({
    @JsonKey(name: 'num_dossier') required String numDossier,
    @JsonKey(name: 'id_med') String? idMed,
    String? date,
    required bool addiction,
    @JsonKey(name: 'TABAC') required bool tabac,
    required bool alcool,
    required bool cannabis,
    required bool medicaments,
    required bool solvantsorg,
    @JsonKey(name: 'AtcdsP_TS') required bool atcdsPTs,
    @JsonKey(name: 'idees_sui_ant') required bool ideesSuiAnt,
    @JsonKey(name: 'hospit_ant') required bool hospitAnt,
    @JsonKey(name: 'atcdsFam_SUI') required bool atcdsFamSui,
    @JsonKey(name: 'suicide_accompli') required bool suicideAccompli,
    @JsonKey(name: 'AtcdsP_somatik') required bool atcdsPSomatik,
    @JsonKey(name: 'cond_impulsiv') required bool condImpulsiv,
    required bool automit,
    @JsonKey(name: 'atcds_p_judic') required bool atcdsPJudic,
    required bool immolation,
    required bool moyenphlebotomie,
    @JsonKey(name: 'Mpendaison') required bool mpendaison,
    @JsonKey(name: 'Mmedicaments') required bool mmedicaments,
    @JsonKey(name: 'Mstrangulation') required bool mstrangulation,
    @JsonKey(name: 'Mingestiontox') required bool mingestiontox,
    @JsonKey(name: 'EQUIsui') required bool equiSui,
    required bool sautaltitude,
    @JsonKey(name: 'Mautres') required bool mautres,
    @JsonKey(name: 'nombres_hospit') required String nombresHospit,
    @JsonKey(name: 'famille_contenante') required bool familleContenante,
    @JsonKey(name: 'type_atcdspsy') required String typeAtcdspsy,
    @JsonKey(name: 'diagnostic_retenu') required String diagnosticRetenu,
    @JsonKey(name: 'type_personn') required String typePersonn,
    @JsonKey(name: 'reaction_stress') required bool reactionStress,
    @JsonKey(name: 'injonc_suicidaires') required bool injoncSuicidaires,
    @JsonKey(name: 'angoisse_psychotique') required bool angoissePsychotique,
    required bool etatdepressif,
    @JsonKey(name: 'nbres_de_ts') required String nbresDeTs,
    required String anciennetemaladie,
    required String agedebutannee,
    @JsonKey(name: 'motifTS') required bool motifTs,
    String? remarque,
  }) = _CreateConsultationDto;

  factory CreateConsultationDto.fromJson(Map<String, dynamic> json) => _$CreateConsultationDtoFromJson(json);
}

// DTO for creating consultation from appointment
@freezed
class CreateConsultationFromAppointmentDto with _$CreateConsultationFromAppointmentDto {
  const factory CreateConsultationFromAppointmentDto({
    required String appointmentId,
    required CreateConsultationDto consultationData,
  }) = _CreateConsultationFromAppointmentDto;

  factory CreateConsultationFromAppointmentDto.fromJson(Map<String, dynamic> json) => 
      _$CreateConsultationFromAppointmentDtoFromJson(json);
}

// Request model for API call
class CreateConsultationFromAppointmentRequest {
  final String appointmentId;
  final CreateConsultationDto consultationData;

  CreateConsultationFromAppointmentRequest({
    required this.appointmentId,
    required this.consultationData,
  });

  Map<String, dynamic> toJson() => {
    'appointmentId': appointmentId,
    'consultationData': consultationData.toJson(),
  };
}

// Response models for different API responses
@freezed
class CreateConsultationResponse with _$CreateConsultationResponse {
  const factory CreateConsultationResponse({
    String? message,
    String? consultationId,
    String? appointmentId,
  }) = _CreateConsultationResponse;

  factory CreateConsultationResponse.fromJson(Map<String, dynamic> json) => 
      _$CreateConsultationResponseFromJson(json);
}

// Helper extensions for enum mapping
extension TypeAtcdspsyEnumExtension on TypeAtcdspsyEnum {
  String get apiValue {
    switch (this) {
      case TypeAtcdspsyEnum.aucune:
        return 'aucune';
      case TypeAtcdspsyEnum.troubleHumeur:
        return 'trouble de l\'humeur';
      case TypeAtcdspsyEnum.autre:
        return 'autre';
      case TypeAtcdspsyEnum.troublePsychotique:
        return 'trouble psychotique';
      case TypeAtcdspsyEnum.troublesCognitifs:
        return 'troubles cognitifs';
      case TypeAtcdspsyEnum.nonPrecise:
        return 'non précisé';
      case TypeAtcdspsyEnum.troubleAnxieux:
        return 'trouble anxieux';
    }
  }

  String get displayValue {
    switch (this) {
      case TypeAtcdspsyEnum.aucune:
        return 'Aucune';
      case TypeAtcdspsyEnum.troubleHumeur:
        return 'Trouble de l\'humeur';
      case TypeAtcdspsyEnum.autre:
        return 'Autre';
      case TypeAtcdspsyEnum.troublePsychotique:
        return 'Trouble psychotique';
      case TypeAtcdspsyEnum.troublesCognitifs:
        return 'Troubles cognitifs';
      case TypeAtcdspsyEnum.nonPrecise:
        return 'Non précisé';
      case TypeAtcdspsyEnum.troubleAnxieux:
        return 'Trouble anxieux';
    }
  }
}

extension DiagnosticRetenuEnumExtension on DiagnosticRetenuEnum {
  String get apiValue {
    switch (this) {
      case DiagnosticRetenuEnum.skz:
        return 'SKZ';
      case DiagnosticRetenuEnum.epManiaque:
        return 'ep_maniaque';
      case DiagnosticRetenuEnum.dup:
        return 'DUP';
      case DiagnosticRetenuEnum.autre:
        return 'autre';
      case DiagnosticRetenuEnum.bda:
        return 'BDA';
      case DiagnosticRetenuEnum.trAnxieux:
        return 'tr_anxieux';
      case DiagnosticRetenuEnum.dbp:
        return 'DBP';
      case DiagnosticRetenuEnum.trDelirant:
        return 'tr_delirant';
      case DiagnosticRetenuEnum.trPersonnaliteSeul:
        return 'tr_personnalité_seul';
    }
  }

  String get displayValue {
    switch (this) {
      case DiagnosticRetenuEnum.skz:
        return 'SKZ';
      case DiagnosticRetenuEnum.epManiaque:
        return 'Épisode maniaque';
      case DiagnosticRetenuEnum.dup:
        return 'DUP';
      case DiagnosticRetenuEnum.autre:
        return 'Autre';
      case DiagnosticRetenuEnum.bda:
        return 'BDA';
      case DiagnosticRetenuEnum.trAnxieux:
        return 'Trouble anxieux';
      case DiagnosticRetenuEnum.dbp:
        return 'DBP';
      case DiagnosticRetenuEnum.trDelirant:
        return 'Trouble délirant';
      case DiagnosticRetenuEnum.trPersonnaliteSeul:
        return 'Trouble de personnalité seul';
    }
  }
}

extension TypePersonnaliteEnumExtension on TypePersonnaliteEnum {
  String get apiValue {
    switch (this) {
      case TypePersonnaliteEnum.pas:
        return 'PAS';
      case TypePersonnaliteEnum.antisociale:
        return 'antisociale';
      case TypePersonnaliteEnum.histrionique:
        return 'histrionique';
      case TypePersonnaliteEnum.borderline:
        return 'Borderline';
    }
  }

  String get displayValue {
    switch (this) {
      case TypePersonnaliteEnum.pas:
        return 'PAS';
      case TypePersonnaliteEnum.antisociale:
        return 'Antisociale';
      case TypePersonnaliteEnum.histrionique:
        return 'Histrionique';
      case TypePersonnaliteEnum.borderline:
        return 'Borderline';
    }
  }
} 