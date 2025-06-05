import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/domain/entities/appointment.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/domain/entities/user.dart';
import 'package:foresight_care/features/secretary/presentation/providers/appointments_provider.dart'
    as provider;
import 'package:foresight_care/features/secretary/presentation/providers/patients_provider.dart';
import 'package:foresight_care/features/admin/presentation/providers/users_provider.dart';

class EditAppointmentDialog extends ConsumerStatefulWidget {
  final Appointment existingAppointment;

  const EditAppointmentDialog({super.key, required this.existingAppointment});

  @override
  ConsumerState<EditAppointmentDialog> createState() =>
      _EditAppointmentDialogState();
}

class _EditAppointmentDialogState extends ConsumerState<EditAppointmentDialog> {
  final _formKey = GlobalKey<FormState>();
  final _cinCnamController = TextEditingController();

  String? _selectedDoctor;
  Patient? _selectedPatient;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  AppointmentStatus _selectedStatus = AppointmentStatus.enAttente;
  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeWithExistingData();
  }

  void _initializeWithExistingData() {
    // Pre-populate with existing appointment data
    final appointment = widget.existingAppointment;

    // Set doctor
    _selectedDoctor = appointment.doctor.id;

    // Set patient and CIN/CNAM
    _selectedPatient = Patient(
      id: appointment.patient.id,
      nomPatient: appointment.patient.nomPatient ?? '',
      prenPatient: appointment.patient.prenPatient ?? '',
      cinCnam: appointment.patient.cinCnam,
      telephone: appointment.patient.tel,
      // Default values for required fields
      sexe: PatientGender.masculin,
      dateNaiss: DateTime.now().toString(),
      villederesidence: CityOfResidence.centre,
      origine: Origin.urbaine,
      ageInt: AgeRange.age18to29,
      etatcivil: MaritalStatus.celibataire,
      nvscolaire: EducationLevel.primaire,
      typeProf: ProfessionType.reguliere,
      lieuderesidence: LivingSituation.enFamille,
      nvSocioeconomique: SocioeconomicLevel.moyen,
    );
    _cinCnamController.text = appointment.patient.cinCnam?.toString() ?? '';

    // Set date
    try {
      _selectedDate = DateTime.parse(appointment.date);
    } catch (e) {
      _selectedDate = DateTime.now();
    }

    // Set time
    try {
      final timeParts = appointment.heure.split(':');
      if (timeParts.length >= 2) {
        _selectedTime = TimeOfDay(
          hour: int.parse(timeParts[0]),
          minute: int.parse(timeParts[1]),
        );
      }
    } catch (e) {
      _selectedTime = TimeOfDay.now();
    }

    // Set status
    _selectedStatus = appointment.status;
  }

  @override
  void dispose() {
    _cinCnamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.09),
              blurRadius: 22,
              offset: const Offset(0, 22),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 30,
              offset: const Offset(0, 51),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Close button
            Positioned(
              top: 5,
              left: 0,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close_rounded,
                  color: Color(0xFF1E96BE),
                  size: 20,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              ),
            ),

            // Main content
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  const Text(
                    'Modifier les détails du rendez-vous',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      height: 0.92,
                      color: Color(0xFF1A85AB),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                  // Form
                  Expanded(child: SingleChildScrollView(child: _buildForm())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Container(
        width: 333,
        child: Column(
          children: [
            // Error message
            if (_errorMessage != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.red[300]!),
                ),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
            ],

            // Doctor selection
            _buildDoctorField(),
            const SizedBox(height: 20),

            // Patient CIN/CNAM
            _buildPatientField(),
            const SizedBox(height: 20),

            // Date selection
            _buildDateField(),
            const SizedBox(height: 20),

            // Time selection
            _buildTimeField(),
            const SizedBox(height: 20),

            // Status selection
            _buildStatusField(),
            const SizedBox(height: 20),

            // Submit button
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Nom docteur',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.4,
            color: Color(0xFF393C3C),
          ),
        ),
        const SizedBox(height: 6),
        Consumer(
          builder: (context, ref, child) {
            final doctorsAsync = ref.watch(doctorsProvider);

            return doctorsAsync.when(
              data: (doctors) => Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F9),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: const Color(0xFFA6A5A5)),
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedDoctor,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    hintText: 'sélectionner le nom du docteur',
                    hintStyle: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.4,
                      color: Color(0xFFA6A5A5),
                    ),
                  ),
                  items: doctors.map((doctor) {
                    return DropdownMenuItem<String>(
                      value: doctor.id!,
                      child: Text(
                        'Dr. ${doctor.prenom} ${doctor.nom}',
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.4,
                          color: Color(0xFF393C3C),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedDoctor = value;
                      _errorMessage = null;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Veuillez sélectionner un docteur';
                    }
                    return null;
                  },
                ),
              ),
              loading: () => Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F9),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: const Color(0xFFA6A5A5)),
                ),
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Color(0xFF1A85AB),
                    ),
                  ),
                ),
              ),
              error: (error, stack) => Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.red[300]!),
                ),
                child: const Center(
                  child: Text(
                    'Erreur de chargement des docteurs',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPatientField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'CIN/CNAM',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.4,
            color: Color(0xFF393C3C),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F9),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xFFA6A5A5)),
          ),
          child: TextFormField(
            controller: _cinCnamController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              hintText: 'Veuillez entrer le CIN/CNAM du patient',
              hintStyle: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.4,
                color: Color(0xFFA6A5A5),
              ),
            ),
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.4,
              color: Color(0xFF393C3C),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Veuillez entrer le CIN/CNAM du patient';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _errorMessage = null;
              });
              _findPatientByCinCnam(value);
            },
          ),
        ),

        // Patient info display
        if (_selectedPatient != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E8),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFF4CAF50)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFF4CAF50),
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Patient trouvé: ${_selectedPatient!.prenPatient} ${_selectedPatient!.nomPatient}',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Date de rendez-vous',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.4,
            color: Color(0xFF393C3C),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F9),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xFFA6A5A5)),
          ),
          child: InkWell(
            onTap: _selectDate,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate != null
                          ? _formatDate(_selectedDate!)
                          : 'Veuillez sélectionner la date de rendez-vous',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.4,
                        color: _selectedDate != null
                            ? const Color(0xFF393C3C)
                            : const Color(0xFFA6A5A5),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.calendar_today,
                    color: Color(0xFFA6A5A5),
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Heure de rendez-vous',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.4,
            color: Color(0xFF393C3C),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F9),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xFFA6A5A5)),
          ),
          child: InkWell(
            onTap: _selectTime,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedTime != null
                          ? _formatTime(_selectedTime!)
                          : 'Veuillez sélectionner l\'heure de rendez-vous',
                      style: TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.4,
                        color: _selectedTime != null
                            ? const Color(0xFF393C3C)
                            : const Color(0xFFA6A5A5),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.access_time,
                    color: Color(0xFFA6A5A5),
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusField() {
    // Only show statuses that are supported by the backend
    final supportedStatuses = [
      AppointmentStatus.enAttente,
      AppointmentStatus.annule,
      AppointmentStatus.complete,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Status',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.4,
            color: Color(0xFF393C3C),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8F9),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xFFA6A5A5)),
          ),
          child: DropdownButtonFormField<AppointmentStatus>(
            value: supportedStatuses.contains(_selectedStatus)
                ? _selectedStatus
                : AppointmentStatus.enAttente,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            items: supportedStatuses.map((status) {
              return DropdownMenuItem<AppointmentStatus>(
                value: status,
                child: Text(
                  _getStatusDisplayText(status),
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF393C3C),
                  ),
                ),
              );
            }).toList(),
            onChanged: (AppointmentStatus? value) {
              if (value != null) {
                setState(() {
                  _selectedStatus = value;
                  _errorMessage = null;
                });
              }
            },
            icon: Container(
              padding: const EdgeInsets.all(3),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF393C3C),
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isSubmitting ? null : _submitForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A85AB),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
        child: _isSubmitting
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Text(
                'Mettre à jour',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  height: 1.2,
                ),
              ),
      ),
    );
  }

  void _findPatientByCinCnam(String cinCnam) {
    if (cinCnam.trim().isEmpty) {
      setState(() {
        _selectedPatient = null;
      });
      return;
    }

    final patientsState = ref.read(patientsProvider);
    final patients = patientsState.patients;

    try {
      final cinCnamInt = int.parse(cinCnam);
      final patient = patients.firstWhere(
        (p) => p.cinCnam == cinCnamInt,
        orElse: () => throw StateError('Patient not found'),
      );

      setState(() {
        _selectedPatient = patient;
      });
    } catch (e) {
      setState(() {
        _selectedPatient = null;
      });
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1A85AB),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF393C3C),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _errorMessage = null;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1A85AB),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color(0xFF393C3C),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _errorMessage = null;
      });
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Additional validations
    if (_selectedDoctor == null) {
      setState(() {
        _errorMessage = 'Veuillez sélectionner un docteur';
      });
      return;
    }

    if (_selectedPatient == null) {
      setState(() {
        _errorMessage = 'Patient non trouvé. Veuillez vérifier le CIN/CNAM';
      });
      return;
    }

    if (_selectedDate == null) {
      setState(() {
        _errorMessage = 'Veuillez sélectionner une date';
      });
      return;
    }

    if (_selectedTime == null) {
      setState(() {
        _errorMessage = 'Veuillez sélectionner une heure';
      });
      return;
    }

    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    try {
      final request = UpdateAppointmentRequest(
        idMed: _selectedDoctor!,
        idNumDossier: _selectedPatient!.id!,
        date: _formatDateForApi(_selectedDate!),
        heure: _formatTimeForApi(_selectedTime!),
        status: _selectedStatus,
      );

      await ref
          .read(provider.appointmentsProvider.notifier)
          .updateAppointment(widget.existingAppointment.id!, request);

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Rendez-vous mis à jour avec succès pour ${_selectedPatient!.prenPatient} ${_selectedPatient!.nomPatient}',
            ),
            backgroundColor: const Color(0xFF4CAF50),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isSubmitting = false;
        _errorMessage = _getErrorMessage(e.toString());
      });
    }
  }

  String _getErrorMessage(String error) {
    if (error.contains('400')) {
      return 'Données invalides. Veuillez vérifier les informations saisies.';
    } else if (error.contains('409')) {
      return 'Conflit d\'horaire. Ce créneau est déjà réservé.';
    } else if (error.contains('403')) {
      return 'Accès non autorisé. Vous n\'avez pas les permissions nécessaires.';
    } else if (error.contains('401')) {
      return 'Session expirée. Veuillez vous reconnecter.';
    } else if (error.contains('404')) {
      return 'Rendez-vous introuvable.';
    } else {
      return 'Erreur lors de la mise à jour du rendez-vous. Veuillez réessayer.';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  String _formatDateForApi(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _formatTimeForApi(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  String _getStatusDisplayText(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.enAttente:
        return 'En attente';
      case AppointmentStatus.reserve:
        return 'Réservé';
      case AppointmentStatus.annule:
        return 'Annulé';
      case AppointmentStatus.termine:
        return 'Terminé';
      case AppointmentStatus.enCours:
        return 'En cours';
      case AppointmentStatus.complete:
        return 'Complété';
    }
  }
}
