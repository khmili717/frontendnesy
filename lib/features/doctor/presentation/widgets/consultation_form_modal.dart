import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/domain/entities/appointment.dart';
import 'package:foresight_care/domain/entities/consultation.dart';
import 'package:foresight_care/features/doctor/presentation/providers/consultation_form_provider.dart';

class ConsultationFormModal extends ConsumerStatefulWidget {
  final DoctorAppointment appointment;

  const ConsultationFormModal({
    super.key,
    required this.appointment,
  });

  @override
  ConsumerState<ConsultationFormModal> createState() => _ConsultationFormModalState();
}

class _ConsultationFormModalState extends ConsumerState<ConsultationFormModal> {
  final _formKey = GlobalKey<FormState>();
  final _remarqueController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _remarqueController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(consultationFormProvider);
    final formNotifier = ref.read(consultationFormProvider.notifier);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF13A4AB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.medical_information_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Fiche de consultation',
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Form Content
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Patient Info Section
                      _buildPatientInfoSection(),
                      const SizedBox(height: 30),

                      // Addiction Section
                      _buildSectionTitle('Addictions et substances'),
                      const SizedBox(height: 16),
                      _buildAddictionSection(formState, formNotifier),
                      const SizedBox(height: 30),

                      // Psychiatric History Section
                      _buildSectionTitle('Antécédents psychiatriques'),
                      const SizedBox(height: 16),
                      _buildPsychiatricHistorySection(formState, formNotifier),
                      const SizedBox(height: 30),

                      // Suicide Methods Section
                      _buildSectionTitle('Méthodes suicidaires'),
                      const SizedBox(height: 16),
                      _buildSuicideMethodsSection(formState, formNotifier),
                      const SizedBox(height: 30),

                      // Clinical Assessment Section
                      _buildSectionTitle('Évaluation clinique'),
                      const SizedBox(height: 16),
                      _buildClinicalAssessmentSection(formState, formNotifier),
                      const SizedBox(height: 30),

                      // Statistics Section
                      _buildSectionTitle('Statistiques'),
                      const SizedBox(height: 16),
                      _buildStatisticsSection(formState, formNotifier),
                      const SizedBox(height: 30),

                      // Remarks Section
                      _buildSectionTitle('Remarques'),
                      const SizedBox(height: 16),
                      _buildRemarksSection(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),

            // Action Buttons
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: formState.isLoading ? null : () => _submitForm(formNotifier),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF13A4AB),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: formState.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Enregistrer',
                              style: TextStyle(
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Cancel Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: formState.isLoading ? null : () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF13A4AB),
                        side: const BorderSide(color: Color(0xFF13A4AB)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Annuler',
                        style: TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9ECEF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informations du patient',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF393C3C),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nom complet',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.appointment.patient.prenPatient} ${widget.appointment.patient.nomPatient}',
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF393C3C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'N° Dossier',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.appointment.patient.id ?? 'N/A',
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFF393C3C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (widget.appointment.patient.cinCnam != null) ...[
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CIN/CNAM',
                  style: TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.appointment.patient.cinCnam.toString(),
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF393C3C),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'League Spartan',
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Color(0xFF103459),
      ),
    );
  }

  Widget _buildAddictionSection(ConsultationFormState formState, ConsultationFormNotifier formNotifier) {
    return Column(
      children: [
        _buildCheckboxField('Addiction', formState.addiction, (value) => formNotifier.updateAddiction(value)),
        _buildCheckboxField('Tabac', formState.tabac, (value) => formNotifier.updateTabac(value)),
        _buildCheckboxField('Alcool', formState.alcool, (value) => formNotifier.updateAlcool(value)),
        _buildCheckboxField('Cannabis', formState.cannabis, (value) => formNotifier.updateCannabis(value)),
        _buildCheckboxField('Médicaments', formState.medicaments, (value) => formNotifier.updateMedicaments(value)),
        _buildCheckboxField('Solvants organiques', formState.solvantsorg, (value) => formNotifier.updateSolvantsorg(value)),
      ],
    );
  }

  Widget _buildPsychiatricHistorySection(ConsultationFormState formState, ConsultationFormNotifier formNotifier) {
    return Column(
      children: [
        _buildCheckboxField('AtcdsP_TS', formState.atcdsPTs, (value) => formNotifier.updateAtcdsPTs(value)),
        _buildCheckboxField('Idées suicidaires antérieures', formState.ideesSuiAnt, (value) => formNotifier.updateIdeesSuiAnt(value)),
        _buildCheckboxField('Hospitalisation antérieure', formState.hospitAnt, (value) => formNotifier.updateHospitAnt(value)),
        _buildCheckboxField('Antécédents familiaux de suicide', formState.atcdsFamSui, (value) => formNotifier.updateAtcdsFamSui(value)),
        _buildCheckboxField('Suicide accompli', formState.suicideAccompli, (value) => formNotifier.updateSuicideAccompli(value)),
        _buildCheckboxField('Antécédents somatiques', formState.atcdsPSomatik, (value) => formNotifier.updateAtcdsPSomatik(value)),
        _buildCheckboxField('Conduite impulsive', formState.condImpulsiv, (value) => formNotifier.updateCondImpulsiv(value)),
        _buildCheckboxField('Automutilation', formState.automit, (value) => formNotifier.updateAutomit(value)),
        _buildCheckboxField('Antécédents judiciaires', formState.atcdsPJudic, (value) => formNotifier.updateAtcdsPJudic(value)),
      ],
    );
  }

  Widget _buildSuicideMethodsSection(ConsultationFormState formState, ConsultationFormNotifier formNotifier) {
    return Column(
      children: [
        _buildCheckboxField('Immolation', formState.immolation, (value) => formNotifier.updateImmolation(value)),
        _buildCheckboxField('Phlébotomie', formState.moyenphlebotomie, (value) => formNotifier.updateMoyenphlebotomie(value)),
        _buildCheckboxField('Pendaison', formState.mpendaison, (value) => formNotifier.updateMpendaison(value)),
        _buildCheckboxField('Médicaments', formState.mmedicaments, (value) => formNotifier.updateMmedicaments(value)),
        _buildCheckboxField('Strangulation', formState.mstrangulation, (value) => formNotifier.updateMstrangulation(value)),
        _buildCheckboxField('Ingestion toxique', formState.mingestiontox, (value) => formNotifier.updateMingestiontox(value)),
        _buildCheckboxField('EQUIsui', formState.equiSui, (value) => formNotifier.updateEquiSui(value)),
        _buildCheckboxField('Saut en altitude', formState.sautaltitude, (value) => formNotifier.updateSautaltitude(value)),
        _buildCheckboxField('Autres méthodes', formState.mautres, (value) => formNotifier.updateMautres(value)),
      ],
    );
  }

  Widget _buildClinicalAssessmentSection(ConsultationFormState formState, ConsultationFormNotifier formNotifier) {
    return Column(
      children: [
        _buildDropdownField(
          'Nombre d\'hospitalisations',
          formState.nombresHospit,
          ['0', '1', '2', '3', '>4'],
          (value) => formNotifier.updateNombresHospit(value),
        ),
        const SizedBox(height: 16),
        _buildCheckboxField('Famille contenante', formState.familleContenante, (value) => formNotifier.updateFamilleContenante(value)),
        const SizedBox(height: 16),
        _buildDropdownField(
          'Type d\'antécédents psychiatriques',
          formState.typeAtcdspsy,
          TypeAtcdspsyEnum.values.map((e) => e.apiValue).toList(),
          (value) => formNotifier.updateTypeAtcdspsy(value),
          displayValues: TypeAtcdspsyEnum.values.map((e) => e.displayValue).toList(),
        ),
        const SizedBox(height: 16),
        _buildDropdownField(
          'Diagnostic retenu',
          formState.diagnosticRetenu,
          DiagnosticRetenuEnum.values.map((e) => e.apiValue).toList(),
          (value) => formNotifier.updateDiagnosticRetenu(value),
          displayValues: DiagnosticRetenuEnum.values.map((e) => e.displayValue).toList(),
        ),
        const SizedBox(height: 16),
        _buildDropdownField(
          'Type de personnalité',
          formState.typePersonn,
          TypePersonnaliteEnum.values.map((e) => e.apiValue).toList(),
          (value) => formNotifier.updateTypePersonn(value),
          displayValues: TypePersonnaliteEnum.values.map((e) => e.displayValue).toList(),
        ),
        const SizedBox(height: 16),
        _buildCheckboxField('Réaction au stress', formState.reactionStress, (value) => formNotifier.updateReactionStress(value)),
        _buildCheckboxField('Injonctions suicidaires', formState.injoncSuicidaires, (value) => formNotifier.updateInjoncSuicidaires(value)),
        _buildCheckboxField('Angoisse psychotique', formState.angoissePsychotique, (value) => formNotifier.updateAngoissePsychotique(value)),
        _buildCheckboxField('État dépressif', formState.etatdepressif, (value) => formNotifier.updateEtatdepressif(value)),
      ],
    );
  }

  Widget _buildStatisticsSection(ConsultationFormState formState, ConsultationFormNotifier formNotifier) {
    return Column(
      children: [
        _buildDropdownField(
          'Nombre de tentatives de suicide',
          formState.nbresDeTs,
          ['0', '1', '2', '3', '>4'],
          (value) => formNotifier.updateNbresDeTs(value),
        ),
        const SizedBox(height: 16),
        _buildDropdownField(
          'Ancienneté de la maladie',
          formState.anciennetemaladie,
          ['0', '<=5', '6-10', '11-20', '>20'],
          (value) => formNotifier.updateAnciennetemaladie(value),
        ),
        const SizedBox(height: 16),
        _buildDropdownField(
          'Âge de début (années)',
          formState.agedebutannee,
          ['<=17', '18-40', '41-60', '>60'],
          (value) => formNotifier.updateAgedebutannee(value),
        ),
        const SizedBox(height: 16),
        _buildCheckboxField('Motif TS', formState.motifTs, (value) => formNotifier.updateMotifTs(value)),
      ],
    );
  }

  Widget _buildRemarksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Remarques',
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF393C3C),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFA6A5A5)),
          ),
          child: TextField(
            controller: _remarqueController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Veuillez entrer votre remarque',
              hintStyle: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFFA6A5A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF393C3C),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxField(String label, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF1C1B1F)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Checkbox(
              value: value,
              onChanged: (newValue) => onChanged(newValue ?? false),
              activeColor: const Color(0xFF13A4AB),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF393C3C),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    String? value,
    List<String> options,
    Function(String?) onChanged, {
    List<String>? displayValues,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF393C3C),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F9),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFA6A5A5)),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF393C3C),
            ),
            items: options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final displayValue = displayValues != null && index < displayValues.length
                  ? displayValues[index]
                  : option;
              
              return DropdownMenuItem<String>(
                value: option,
                child: Text(displayValue),
              );
            }).toList(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ce champ est requis';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  void _submitForm(ConsultationFormNotifier formNotifier) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final success = await formNotifier.submitConsultation(
      appointmentId: widget.appointment.id!,
      patientId: widget.appointment.patient.id!,
      doctorId: widget.appointment.doctorId,
      remarque: _remarqueController.text.trim().isEmpty ? null : _remarqueController.text.trim(),
    );

    if (success && mounted) {
      Navigator.of(context).pop(true); // Return true to indicate success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Consultation créée avec succès'),
          backgroundColor: Colors.green,
        ),
      );
    } else if (mounted) {
      final error = ref.read(consultationFormProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error ?? 'Erreur lors de la création de la consultation'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
} 