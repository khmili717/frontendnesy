import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/features/secretary/presentation/providers/patients_provider.dart';

class CreatePatientDialog extends ConsumerStatefulWidget {
  final bool isEditMode;
  final Patient? existingPatient;
  
  const CreatePatientDialog({
    super.key,
    this.isEditMode = false,
    this.existingPatient,
  });

  @override
  ConsumerState<CreatePatientDialog> createState() => _CreatePatientDialogState();
}

class _CreatePatientDialogState extends ConsumerState<CreatePatientDialog> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  
  // Controllers for text fields
  final _numDossierController = TextEditingController();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _dateNaissController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _cinCnamController = TextEditingController();
  
  // Add a controller for the creation date field
  final _dateCreationController = TextEditingController();
  
  // Dropdown values
  PatientGender? _selectedSexe;
  AgeRange? _selectedAge;
  MaritalStatus? _selectedEtatCivil;
  Origin? _selectedOrigine;
  LivingSituation? _selectedLieuResidence;
  CityOfResidence? _selectedVilleResidence;
  EducationLevel? _selectedNiveauScolaire;
  ProfessionType? _selectedTypeProfession;
  SocioeconomicLevel? _selectedNiveauSocioeconomique;
  
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    
    if (widget.isEditMode && widget.existingPatient != null) {
      _prefillFormWithPatientData(widget.existingPatient!);
    } else {
      // Auto-populate today's date for creation
      final today = DateTime.now();
      _numDossierController.text = 'PAT-X';
      _dateCreationController.text = '${today.day.toString().padLeft(2, '0')}/${today.month.toString().padLeft(2, '0')}/${today.year}';
    }
  }

  void _prefillFormWithPatientData(Patient patient) {
    _nomController.text = patient.nomPatient;
    _prenomController.text = patient.prenPatient;
    _selectedSexe = patient.sexe;
    _selectedAge = patient.ageInt;
    _selectedEtatCivil = patient.etatcivil;
    _selectedOrigine = patient.origine;
    _selectedLieuResidence = patient.lieuderesidence;
    _selectedVilleResidence = patient.villederesidence;
    _selectedNiveauScolaire = patient.nvscolaire;
    _selectedTypeProfession = patient.typeProf;
    _selectedNiveauSocioeconomique = patient.nvSocioeconomique;
    
    if (patient.telephone != null) {
      _telephoneController.text = patient.telephone.toString();
    }
    
    if (patient.cinCnam != null) {
      _cinCnamController.text = patient.cinCnam.toString();
    }
    
    if (patient.dateNaiss != null) {
      _dateNaissController.text = patient.dateNaiss!;
    }
    
    // For edit mode, show the existing patient number or dossier number
    _numDossierController.text = patient.numDossier ?? patient.id ?? 'PAT-${patient.nomPatient}';
    
    // Show creation date if available
    if (patient.createdAt != null) {
      final createdDate = patient.createdAt!;
      _dateCreationController.text = '${createdDate.day.toString().padLeft(2, '0')}/${createdDate.month.toString().padLeft(2, '0')}/${createdDate.year}';
    } else {
      final today = DateTime.now();
      _dateCreationController.text = '${today.day.toString().padLeft(2, '0')}/${today.month.toString().padLeft(2, '0')}/${today.year}';
    }
  }

  @override
  void dispose() {
    _numDossierController.dispose();
    _nomController.dispose();
    _prenomController.dispose();
    _dateNaissController.dispose();
    _telephoneController.dispose();
    _cinCnamController.dispose();
    _dateCreationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildScrollableForm(),
            ),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.isEditMode 
                      ? 'Modifier les détails du patient'
                      : 'Ajouter un nouveau fiche patient',
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    height: 1.2,
                    color: Color(0xFF13A4AB),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 20,
                    color: Color(0xFF393C3C),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            widget.isEditMode
                ? 'Modifiez les informations du patient ci-dessous pour mettre à jour son dossier.'
                : 'Veuillez fournir les détails du patient pour ajouter avec succès un nouveau dossier patient.',
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.4,
              color: Color(0xFF13A4AB),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableForm() {
    return Scrollbar(
      controller: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Row 1: Dossier Number + Date
              Row(
                children: [
                  Expanded(
                    child: _buildFormField(
                      label: 'Numéro du dossier',
                      controller: _numDossierController,
                      placeholder: 'Veuillez entrer le numéro du dossier du patient',
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildFormField(
                      label: 'Date de création',
                      controller: _dateCreationController,
                      placeholder: 'Date d\'aujourd\'hui (mm/dd/yyyy)',
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Row 2: Nom + Prénom
              Row(
                children: [
                  Expanded(
                    child: _buildFormField(
                      label: 'Nom',
                      controller: _nomController,
                      placeholder: 'Veuillez entrer le nom du patient',
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Le nom est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildFormField(
                      label: 'Prénom',
                      controller: _prenomController,
                      placeholder: 'Veuillez entrer le prénom du patient',
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Le prénom est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Row 3: Sexe + Date de naissance
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Sexe',
                      value: _selectedSexe,
                      items: PatientGender.values.map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(_getGenderDisplayText(gender)),
                      )).toList(),
                      onChanged: (value) => setState(() => _selectedSexe = value),
                      isRequired: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Le sexe est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildDateField(
                      label: 'Date de naissance',
                      controller: _dateNaissController,
                      placeholder: 'Veuillez entrer la date de naissance (yyyy-mm-dd)',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Row 4: Age + Téléphone
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Age',
                      value: _selectedAge,
                      items: AgeRange.values.map((age) => DropdownMenuItem(
                        value: age,
                        child: Text(_getAgeDisplayText(age)),
                      )).toList(),
                      onChanged: (value) => setState(() => _selectedAge = value),
                      isRequired: true,
                      validator: (value) {
                        if (value == null) {
                          return 'L\'âge est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildFormField(
                      label: 'Numéro de téléphone',
                      controller: _telephoneController,
                      placeholder: '+216 26 305 535',
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          final phone = value.replaceAll(RegExp(r'[^\d]'), '');
                          if (phone.length != 8) {
                            return 'Le numéro doit contenir 8 chiffres';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Row 5: CIN/CNAM
              _buildFormField(
                label: 'CNAM/CIN',
                controller: _cinCnamController,
                placeholder: 'Veuillez entrer le numéro du CNAM/CIN du patient',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    if (int.tryParse(value) == null) {
                      return 'Le CIN/CNAM doit être un nombre valide';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Row 6: État civil + Origine
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'État civil',
                      value: _selectedEtatCivil,
                      items: MaritalStatus.values.map((status) => DropdownMenuItem(
                        value: status,
                        child: Text(_getMaritalStatusDisplayText(status)),
                      )).toList(),
                      onChanged: (value) => setState(() => _selectedEtatCivil = value),
                      isRequired: true,
                      validator: (value) {
                        if (value == null) {
                          return 'L\'état civil est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Origine',
                      value: _selectedOrigine,
                      items: Origin.values.map((origine) => DropdownMenuItem(
                        value: origine,
                        child: Text(_getOriginDisplayText(origine)),
                      )).toList(),
                      onChanged: (value) => setState(() => _selectedOrigine = value),
                      isRequired: true,
                      validator: (value) {
                        if (value == null) {
                          return 'L\'origine est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Row 7: Lieu de résidence + Ville de résidence
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Lieu de résidence',
                      value: _selectedLieuResidence,
                      items: LivingSituation.values.map((lieu) => DropdownMenuItem(
                        value: lieu,
                        child: Text(_getLivingSituationDisplayText(lieu)),
                      )).toList(),
                      onChanged: (value) => setState(() => _selectedLieuResidence = value),
                      isRequired: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Le lieu de résidence est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Ville de résidence',
                      value: _selectedVilleResidence,
                      items: CityOfResidence.values.map((ville) => DropdownMenuItem(
                        value: ville,
                        child: Text(_getCityDisplayText(ville)),
                      )).toList(),
                      onChanged: (value) => setState(() => _selectedVilleResidence = value),
                      isRequired: true,
                      validator: (value) {
                        if (value == null) {
                          return 'La ville de résidence est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Row 8: Type de profession + Niveau scolaire
              Row(
                children: [
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Type de profession',
                      value: _selectedTypeProfession,
                      items: ProfessionType.values.map((profession) => DropdownMenuItem(
                        value: profession,
                        child: Text(_getProfessionDisplayText(profession)),
                      )).toList(),
                      onChanged: (value) => setState(() => _selectedTypeProfession = value),
                      isRequired: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Le type de profession est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildDropdownField(
                      label: 'Niveau scolaire',
                      value: _selectedNiveauScolaire,
                      items: EducationLevel.values.map((education) => DropdownMenuItem(
                        value: education,
                        child: Text(_getEducationDisplayText(education)),
                      )).toList(),
                      onChanged: (value) => setState(() => _selectedNiveauScolaire = value),
                      isRequired: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Le niveau scolaire est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Row 9: Niveau socioéconomique
              _buildDropdownField(
                label: 'Niveau socioéconomique',
                value: _selectedNiveauSocioeconomique,
                items: SocioeconomicLevel.values.map((level) => DropdownMenuItem(
                  value: level,
                  child: Text(_getSocioeconomicDisplayText(level)),
                )).toList(),
                onChanged: (value) => setState(() => _selectedNiveauSocioeconomique = value),
                isRequired: true,
                validator: (value) {
                  if (value == null) {
                    return 'Le niveau socioéconomique est obligatoire';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
    bool isRequired = false,
    bool readOnly = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.4,
              color: Color(0xFF393C3C),
            ),
            children: isRequired ? [
              const TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ] : null,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF393C3C),
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFFA6A5A5),
            ),
            filled: true,
            fillColor: const Color(0xFFF8F8F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFFA6A5A5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFFA6A5A5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFF13A4AB), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
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
            height: 1.4,
            color: Color(0xFF393C3C),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: () => _selectDate(),
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF393C3C),
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFFA6A5A5),
            ),
            filled: true,
            fillColor: const Color(0xFFF8F8F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFFA6A5A5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFFA6A5A5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFF13A4AB), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffixIcon: const Icon(
              Icons.calendar_today,
              color: Color(0xFFA6A5A5),
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField<T>({
    required String label,
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required ValueChanged<T?> onChanged,
    bool isRequired = false,
    String? Function(T?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.4,
              color: Color(0xFF393C3C),
            ),
            children: isRequired ? [
              const TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ] : null,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          validator: validator,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF393C3C),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF8F8F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFFA6A5A5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFFA6A5A5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Color(0xFF13A4AB), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          dropdownColor: Colors.white,
          iconEnabledColor: const Color(0xFF393C3C),
          iconDisabledColor: const Color(0xFFA6A5A5),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        width: 325,
        height: 50,
        child: ElevatedButton(
          onPressed: _isLoading ? null : _submitForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF13A4AB),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBackgroundColor: const Color(0xFFA6A5A5),
          ),
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  widget.isEditMode 
                      ? 'Enregistrer'
                      : 'Ajouter un nouveau patient',
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 0.8,
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 30)), // 30 years ago
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF13A4AB),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dateNaissController.text = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Parse phone number
      int? telephone;
      if (_telephoneController.text.isNotEmpty) {
        final phoneStr = _telephoneController.text.replaceAll(RegExp(r'[^\d]'), '');
        telephone = int.tryParse(phoneStr);
      }

      // Parse CIN/CNAM
      int? cinCnam;
      if (_cinCnamController.text.isNotEmpty) {
        cinCnam = int.tryParse(_cinCnamController.text);
      }

      if (widget.isEditMode && widget.existingPatient != null) {
        // Update existing patient
        final updateRequest = UpdatePatientRequest(
          nomPatient: _nomController.text.trim(),
          prenPatient: _prenomController.text.trim(),
          sexe: _selectedSexe!,
          ageInt: _selectedAge!,
          etatcivil: _selectedEtatCivil!,
          origine: _selectedOrigine!,
          lieuderesidence: _selectedLieuResidence!,
          villederesidence: _selectedVilleResidence!,
          nvscolaire: _selectedNiveauScolaire!,
          typeProf: _selectedTypeProfession!,
          nvSocioeconomique: _selectedNiveauSocioeconomique!,
          telephone: telephone,
          cinCnam: cinCnam,
          dateNaiss: _dateNaissController.text.isNotEmpty ? _dateNaissController.text : null,
        );

        await ref.read(patientsProvider.notifier).updatePatient(
          widget.existingPatient!.id!,
          updateRequest,
        );

        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Patient mis à jour avec succès !'),
              backgroundColor: Color(0xFF13A4AB),
            ),
          );
        }
      } else {
        // Create new patient
        final request = CreatePatientRequest(
          nomPatient: _nomController.text.trim(),
          prenPatient: _prenomController.text.trim(),
          sexe: _selectedSexe!,
          ageInt: _selectedAge!,
          etatcivil: _selectedEtatCivil!,
          origine: _selectedOrigine!,
          lieuderesidence: _selectedLieuResidence!,
          villederesidence: _selectedVilleResidence!,
          nvscolaire: _selectedNiveauScolaire!,
          typeProf: _selectedTypeProfession!,
          nvSocioeconomique: _selectedNiveauSocioeconomique!,
          telephone: telephone,
          cinCnam: cinCnam,
          dateNaiss: _dateNaissController.text.isNotEmpty ? _dateNaissController.text : null,
        );

        // Submit to backend
        await ref.read(patientsProvider.notifier).createPatient(request);

        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Patient créé avec succès !'),
              backgroundColor: Color(0xFF13A4AB),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.isEditMode 
                  ? 'Erreur lors de la mise à jour: ${e.toString()}'
                  : 'Erreur lors de la création: ${e.toString()}'
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // Helper methods for display text
  String _getGenderDisplayText(PatientGender gender) {
    switch (gender) {
      case PatientGender.masculin:
        return 'Masculin';
      case PatientGender.feminin:
        return 'Féminin';
    }
  }

  String _getAgeDisplayText(AgeRange age) {
    switch (age) {
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

  String _getMaritalStatusDisplayText(MaritalStatus status) {
    switch (status) {
      case MaritalStatus.marie:
        return 'Marié(e)';
      case MaritalStatus.celibataire:
        return 'Célibataire';
      case MaritalStatus.divorce:
        return 'Divorcé(e)';
      case MaritalStatus.voeuf:
        return 'Veuf(ve)';
    }
  }

  String _getOriginDisplayText(Origin origine) {
    switch (origine) {
      case Origin.urbaine:
        return 'Urbaine';
      case Origin.rurale:
        return 'Rurale';
    }
  }

  String _getLivingSituationDisplayText(LivingSituation situation) {
    switch (situation) {
      case LivingSituation.enFamille:
        return 'En famille';
      case LivingSituation.seule:
        return 'Seule';
    }
  }

  String _getCityDisplayText(CityOfResidence city) {
    switch (city) {
      case CityOfResidence.centre:
        return 'Centre';
      case CityOfResidence.sud:
        return 'Sud';
    }
  }

  String _getProfessionDisplayText(ProfessionType profession) {
    switch (profession) {
      case ProfessionType.reguliere:
        return 'Régulière';
      case ProfessionType.irreguliere:
        return 'Irrégulière';
      case ProfessionType.chomage:
        return 'Chômage';
      case ProfessionType.retraite:
        return 'Retraite';
      case ProfessionType.eleve:
        return 'Élève';
    }
  }

  String _getEducationDisplayText(EducationLevel education) {
    switch (education) {
      case EducationLevel.universitaire:
        return 'Universitaire';
      case EducationLevel.secondaire:
        return 'Secondaire';
      case EducationLevel.primaire:
        return 'Primaire';
      case EducationLevel.analphabete:
        return 'Analphabète';
    }
  }

  String _getSocioeconomicDisplayText(SocioeconomicLevel level) {
    switch (level) {
      case SocioeconomicLevel.moyen:
        return 'Moyen';
      case SocioeconomicLevel.bas:
        return 'Bas';
    }
  }
} 