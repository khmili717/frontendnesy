import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/domain/entities/appointment.dart';
import 'package:foresight_care/features/secretary/presentation/providers/patient_details_provider.dart';
import 'package:foresight_care/features/secretary/presentation/providers/patients_provider.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/create_patient_dialog.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/create_appointment_dialog.dart';

class PatientDetailsScreen extends ConsumerStatefulWidget {
  final Patient patient;
  
  const PatientDetailsScreen({
    super.key,
    required this.patient,
  });

  @override
  ConsumerState<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends ConsumerState<PatientDetailsScreen> {
  @override
  void initState() {
    super.initState();
    
    // ALIEN DEBUG: Log the patient data being passed
    print('[PATIENT_DETAILS_SCREEN] 🛸 ALIEN INIT');
    print('[PATIENT_DETAILS_SCREEN] Patient ID: ${widget.patient.id}');
    print('[PATIENT_DETAILS_SCREEN] Patient Name: ${widget.patient.prenPatient} ${widget.patient.nomPatient}');
    print('[PATIENT_DETAILS_SCREEN] Patient full data: ${widget.patient}');
    
    // Load patient details and appointments when screen initializes
    if (widget.patient.id != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(patientDetailsProvider.notifier).loadPatientDetails(widget.patient.id!);
      });
    } else {
      print('[PATIENT_DETAILS_SCREEN] ⚠️ No patient ID available!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailsState = ref.watch(patientDetailsProvider);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F9),
      appBar: _buildAppBar(context),
      body: _buildBody(detailsState),
    );
  }

  Widget _buildBody(PatientDetailsState state) {
    if (state.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Color(0xFF13A4AB)),
            SizedBox(height: 16),
            Text(
              'Chargement des détails du patient...',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 16,
                color: Color(0xFF717171),
              ),
            ),
          ],
        ),
      );
    }

    if (state.error != null) {
      // Show error but still allow fallback to original patient data
      return LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Error banner
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.08),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.warning_amber, color: Colors.orange[600], size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Données partiellement disponibles',
                                style: TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFF393C3C),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Affichage des données locales disponibles.',
                                style: TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontSize: 12,
                                  color: Colors.orange[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (widget.patient.id != null) {
                              ref.read(patientDetailsProvider.notifier).loadPatientDetails(widget.patient.id!);
                            }
                          },
                          child: const Text(
                            'Réessayer',
                            style: TextStyle(
                              fontFamily: 'League Spartan',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Continue with patient data using original patient
                  _buildPatientInfoSection(widget.patient, constraints),
                  const SizedBox(height: 30),
                  _buildAppointmentsSection(state.appointments, constraints),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        },
      );
    }

    // Use the fetched patient data if available, otherwise fallback to passed patient
    final currentPatient = state.patient ?? widget.patient;
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Show data source indicator if using fallback
                if (state.patient == null) 
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.08),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue[600], size: 16),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Affichage des données locales (patient non trouvé sur le serveur)',
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
                
                const SizedBox(height: 30),
                _buildPatientInfoSection(currentPatient, constraints),
                const SizedBox(height: 30),
                _buildAppointmentsSection(state.appointments, constraints),
                const SizedBox(height: 100), // Extra space for navigation
              ],
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      elevation: 1,
      shadowColor: const Color(0xFFADADAD).withOpacity(0.1),
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 1,
                color: const Color(0xFFADADAD).withOpacity(0.1),
              ),
              BoxShadow(
                offset: const Offset(0, -2),
                blurRadius: 2,
                color: const Color(0xFFADADAD).withOpacity(0.09),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF13A4AB),
            size: 16,
          ),
        ),
      ),
      title: const Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: Color(0xFF393C3C),
            size: 14,
          ),
          SizedBox(width: 10),
          Text(
            'Liste des patients',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF393C3C),
            ),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  Widget _buildPatientInfoSection(Patient patient, BoxConstraints constraints) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.08),
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Color(0xFFD4F1F2),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          _buildPatientHeader(patient, constraints),
          const SizedBox(height: 20),
          _buildPatientDetails(patient),
          const SizedBox(height: 15),
          _buildActionButtons(patient, constraints),
        ],
      ),
    );
  }

  Widget _buildPatientHeader(Patient patient, BoxConstraints constraints) {
    return Column(
      children: [
        Text(
          _getSafeDisplayName(patient),
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
            fontSize: 25,
            height: 1.2,
            color: Color(0xFF13A4AB),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        _buildPatientInfoGrid(patient, constraints),
      ],
    );
  }

  Widget _buildPatientInfoGrid(Patient patient, BoxConstraints constraints) {
    return Column(
      children: [
        // Row 1: Location & Last Appointment
        LayoutBuilder(
          builder: (context, rowConstraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildInfoItem(Icons.location_on, _getLocationDisplay(patient))),
                const SizedBox(width: 10),
                Expanded(child: _buildLastAppointmentInfo()),
              ],
            );
          },
        ),
        const SizedBox(height: 15),
        // Row 2: Phone & Next Appointment  
        LayoutBuilder(
          builder: (context, rowConstraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildInfoItem(Icons.phone, _getPhoneDisplay(patient))),
                const SizedBox(width: 10),
                Expanded(child: _buildNextAppointmentInfo()),
              ],
            );
          },
        ),
        const SizedBox(height: 15),
        // Row 3: Gender (single item)
        Row(
          children: [
            Expanded(
              flex: 1,
              child: _buildInfoItem(Icons.person, _getGenderDisplay(patient)),
            ),
            const Expanded(flex: 1, child: SizedBox()), // Spacer to match grid
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 14,
              color: const Color(0xFF1C8EB4),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.4,
                  color: Color(0xFF1C8EB4),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLastAppointmentInfo() {
    final detailsState = ref.watch(patientDetailsProvider);
    final appointments = detailsState.appointments;
    
    return LayoutBuilder(
      builder: (context, constraints) {
        String lastAppointmentText = 'Dernier RDV: Aucun';
        
        if (appointments.isNotEmpty) {
          // Find the most recent completed appointment
          final completedAppointments = appointments.where((apt) => 
            apt.status == AppointmentStatus.complete || 
            apt.status == AppointmentStatus.termine
          ).toList();
          
          if (completedAppointments.isNotEmpty) {
            // Sort by date and get the most recent
            completedAppointments.sort((a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));
            final lastAppointment = completedAppointments.last;
            lastAppointmentText = 'Dernier RDV: ${_formatDate(lastAppointment.date)}';
          }
        }
        
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.access_time,
              size: 14,
              color: Color(0xFF1C8EB4),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                lastAppointmentText,
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.4,
                  color: Color(0xFF1C8EB4),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNextAppointmentInfo() {
    final detailsState = ref.watch(patientDetailsProvider);
    final appointments = detailsState.appointments;
    
    return LayoutBuilder(
      builder: (context, constraints) {
        String nextAppointmentText = 'Prochain RDV: Aucun';
        
        if (appointments.isNotEmpty) {
          // Find the next upcoming appointment
          final upcomingAppointments = appointments.where((apt) => 
            apt.status == AppointmentStatus.enAttente || 
            apt.status == AppointmentStatus.reserve
          ).toList();
          
          if (upcomingAppointments.isNotEmpty) {
            // Sort by date and get the next one
            upcomingAppointments.sort((a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));
            final nextAppointment = upcomingAppointments.first;
            nextAppointmentText = 'Prochain RDV: ${_formatDate(nextAppointment.date)}';
          }
        }
        
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.schedule,
              size: 14,
              color: Color(0xFF1C8EB4),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                nextAppointmentText,
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.4,
                  color: Color(0xFF1C8EB4),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPatientDetails(Patient patient) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF1C8EB4).withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informations détaillées:',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFF1C8EB4),
            ),
          ),
          const SizedBox(height: 12),
          _buildDetailGrid(patient),
        ],
      ),
    );
  }

  Widget _buildDetailGrid(Patient patient) {
    return Column(
      children: [
        // Row 1: Age and Civil Status
        Row(
          children: [
            Expanded(child: _buildDetailItem('Âge', _getAgeDisplay(patient))),
            const SizedBox(width: 16),
            Expanded(child: _buildDetailItem('État civil', _getMaritalStatusDisplay(patient))),
          ],
        ),
        const SizedBox(height: 8),
        // Row 2: Education and Profession
        Row(
          children: [
            Expanded(child: _buildDetailItem('Éducation', _getEducationDisplay(patient))),
            const SizedBox(width: 16),
            Expanded(child: _buildDetailItem('Profession', _getProfessionDisplay(patient))),
          ],
        ),
        const SizedBox(height: 8),
        // Row 3: Living situation and Socioeconomic level
        Row(
          children: [
            Expanded(child: _buildDetailItem('Résidence', _getLivingSituationDisplay(patient))),
            const SizedBox(width: 16),
            Expanded(child: _buildDetailItem('Niveau socioeconomique.', _getSocioeconomicDisplay(patient))),
          ],
        ),
        Row(
          children: [
            Expanded(child: _buildDetailItem('Cin Cnam', _getCinCnamDisplay(patient))),
            const SizedBox(width: 16),
            Expanded(child: _buildDetailItem('Date Naissance', _getDateNaissanceDisplay(patient))),
          ],
        ),
        if (patient.numDossier != null) ...[
          const SizedBox(height: 8),
          _buildDetailItem('N° Dossier', patient.numDossier!),
        ],
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFF1C8EB4),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xFF393C3C),
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  // Helper methods - ALIEN-LEVEL SAFE IMPLEMENTATIONS
  String _getSafeDisplayName(Patient patient) {
    try {
      final safeName = (patient.nomPatient).trim();
      final safePrenom = (patient.prenPatient).trim();
      
      if (safePrenom.isNotEmpty && safeName.isNotEmpty) {
        return '$safePrenom $safeName';
      } else if (safeName.isNotEmpty) {
        return safeName;
      } else if (safePrenom.isNotEmpty) {
        return safePrenom;
      } else {
        return 'Patient sans nom';
      }
    } catch (e) {
      return 'Patient sans nom';
    }
  }

  String _getSafePatientDisplayName(PatientInfo patientInfo) {
    try {
      final safeName = (patientInfo.nomPatient?.trim()) ?? '';
      final safePrenom = (patientInfo.prenPatient?.trim()) ?? '';
      
      if (safePrenom.isNotEmpty && safeName.isNotEmpty) {
        return '$safePrenom $safeName';
      } else if (safeName.isNotEmpty) {
        return safeName;
      } else if (safePrenom.isNotEmpty) {
        return safePrenom;
      } else {
        return 'Patient sans nom';
      }
    } catch (e) {
      return 'Patient sans nom';
    }
  }

  String _getLocationDisplay(Patient patient) {
    try {
      final ville = patient.villederesidence.name;
      final origine = patient.origine.name;
      return '${ville.toUpperCase()} - ${origine.toUpperCase()}';
    } catch (e) {
      return 'Localisation non disponible';
    }
  }

  String _getPhoneDisplay(Patient patient) {
    try {
      if (patient.telephone != null && patient.telephone! > 0) {
        final phoneStr = patient.telephone.toString();
        if (phoneStr.length == 8) {
          return '+216 ${phoneStr.substring(0, 2)} ${phoneStr.substring(2, 4)} ${phoneStr.substring(4, 6)} ${phoneStr.substring(6, 8)}';
        }
        return '+216 ${patient.telephone}';
      }
      return 'Téléphone non disponible';
    } catch (e) {
      return 'Téléphone non disponible';
    }
  }

  String _getGenderDisplay(Patient patient) {
    try {
      switch (patient.sexe) {
        case PatientGender.masculin:
          return 'Homme';
        case PatientGender.feminin:
          return 'Femme';
        default:
          return 'Non spécifié';
      }
    } catch (e) {
      return 'Non spécifié';
    }
  }

  String _getStatusDisplay(AppointmentStatus status) {
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
      default:
        return 'Inconnu';
    }
  }

  // Helper methods for patient details
  String _getAgeDisplay(Patient patient) {
    try {
      switch (patient.ageInt) {
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
        default:
          return 'N/A';
      }
    } catch (e) {
      return 'N/A';
    }
  }

  String _getMaritalStatusDisplay(Patient patient) {
    try {
      switch (patient.etatcivil) {
        case MaritalStatus.marie:
          return 'Marié(e)';
        case MaritalStatus.celibataire:
          return 'Célibataire';
        case MaritalStatus.divorce:
          return 'Divorcé(e)';
        case MaritalStatus.voeuf:
          return 'Veuf(ve)';
        default:
          return 'N/A';
      }
    } catch (e) {
      return 'N/A';
    }
  }

  String _getEducationDisplay(Patient patient) {
    try {
      switch (patient.nvscolaire) {
        case EducationLevel.universitaire:
          return 'Universitaire';
        case EducationLevel.secondaire:
          return 'Secondaire';
        case EducationLevel.primaire:
          return 'Primaire';
        case EducationLevel.analphabete:
          return 'Analphabète';
        default:
          return 'N/A';
      }
    } catch (e) {
      return 'N/A';
    }
  }

  String _getProfessionDisplay(Patient patient) {
    try {
      switch (patient.typeProf) {
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
        default:
          return 'N/A';
      }
    } catch (e) {
      return 'N/A';
    }
  }

  String _getLivingSituationDisplay(Patient patient) {
    try {
      switch (patient.lieuderesidence) {
        case LivingSituation.enFamille:
          return 'En famille';
        case LivingSituation.seule:
          return 'Seule';
        default:
          return 'N/A';
      }
    } catch (e) {
      return 'N/A';
    }
  }


  String _getDateNaissanceDisplay(Patient patient) {
    try {
      
      final dateNaiss = patient.dateNaiss;
      return _formatDate(dateNaiss!) != null ? _formatDate(dateNaiss!) : 'N/A' ;
    } catch (e) {
      return 'N/A';
    }
  }
  String _getCinCnamDisplay(Patient patient) {
    try {
      final cinCnam = patient.cinCnam;
      return cinCnam != null ? cinCnam.toString() : 'N/A' ;
    } catch (e) {
      return 'N/A';
    }
  }
  String _getSocioeconomicDisplay(Patient patient) {
    try {
      switch (patient.nvSocioeconomique) {
        case SocioeconomicLevel.moyen:
          return 'Moyen';
        case SocioeconomicLevel.bas:
          return 'Bas';
        default:
          return 'N/A';
      }
    } catch (e) {
      return 'N/A';
    }
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (e) {
      return dateStr;
    }
  }

  // Action methods
  void _editPatientDetails(Patient patient) {
    showDialog(
      context: context,
      builder: (context) => CreatePatientDialog(
        isEditMode: true,
        existingPatient: patient,
      ),
    );
  }

  void _viewPatientFile(Patient patient) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Consultation de la fiche patient'),
        backgroundColor: Color(0xFF13A4AB),
      ),
    );
  }

  void _deletePatient(Patient patient) {
    final TextEditingController reasonController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    bool isLoading = false;

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing while loading
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            'Demander la suppression du patient',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: Color(0xFF393C3C),
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 14,
                        color: Color(0xFF393C3C),
                      ),
                      children: [
                        const TextSpan(text: 'Êtes-vous sûr de vouloir demander la suppression de '),
                        TextSpan(
                          text: _getSafeDisplayName(patient),
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                        const TextSpan(text: ' ?'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Raison de la suppression:',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF393C3C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: reasonController,
                    enabled: !isLoading,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 14,
                      color: Color(0xFF393C3C),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Veuillez expliquer la raison de cette demande de suppression...',
                      hintStyle: TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF13A4AB), width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'La raison est obligatoire';
                      }
                      if (value.trim().length < 10) {
                        return 'La raison doit contenir au moins 10 caractères';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.amber[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.warning_amber, color: Colors.amber[700], size: 20),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Cette action créera une demande de suppression qui devra être validée par un medecin.',
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
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: isLoading ? null : () => Navigator.of(dialogContext).pop(),
              child: const Text(
                'Annuler',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  color: Color(0xFF717171),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: isLoading ? null : () async {
                if (formKey.currentState!.validate()) {
                  setState(() => isLoading = true);
                  
                  try {
                    await ref.read(patientsProvider.notifier).requestPatientDeletion(
                      patient.id!,
                      reasonController.text.trim(),
                    );
                    
                    if (mounted && Navigator.of(dialogContext).canPop()) {
                      Navigator.of(dialogContext).pop(); // Close dialog
                      Navigator.of(context).pop(); // Return to patients list
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Demande de suppression créée pour ${_getSafeDisplayName(patient)}',
                          ),
                          backgroundColor: Colors.green[600],
                          duration: const Duration(seconds: 4),
                        ),
                      );
                    }
                  } catch (e) {
                    setState(() => isLoading = false);
                    
                    if (mounted) {
                      String errorMessage = 'Erreur lors de la demande de suppression';
                      
                      final errorStr = e.toString().toLowerCase();
                      if (errorStr.contains('404') || errorStr.contains('not found')) {
                        errorMessage = 'Patient introuvable';
                      } else if (errorStr.contains('409') || errorStr.contains('conflict')) {
                        errorMessage = 'Une demande de suppression existe déjà pour ce patient';
                      } else if (errorStr.contains('401') || errorStr.contains('unauthorized')) {
                        errorMessage = 'Accès non autorisé';
                      } else if (errorStr.contains('403') || errorStr.contains('forbidden')) {
                        errorMessage = 'Permission insuffisante pour effectuer cette action';
                      }
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMessage),
                          backgroundColor: Colors.red[600],
                          duration: const Duration(seconds: 4),
                        ),
                      );
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey[300],
                disabledForegroundColor: Colors.grey[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: isLoading
                ? const SizedBox(
                    width: 7,
                    height: 7,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Confirmer la suppression',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _createAppointment() {
    final detailsState = ref.read(patientDetailsProvider);
    final patient = detailsState.patient;
    
    showDialog(
      context: context,
      builder: (context) => CreateAppointmentDialog(
        preSelectedPatient: patient,
      ),
    );
  }

  void _modifyAppointment(Appointment appointment) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Modification du rendez-vous'),
        backgroundColor: Color(0xFF13A4AB),
      ),
    );
  }

  void _cancelAppointment(Appointment appointment) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Annulation du rendez-vous'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _viewPatientFromAppointment(Appointment appointment) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Voir patient depuis le rendez-vous'),
        backgroundColor: Color(0xFF13A4AB),
      ),
    );
  }

  Widget _buildActionButtons(Patient patient, BoxConstraints constraints) {
    final buttonWidth = constraints.maxWidth - 60; // Account for container padding
    
    return Column(
      children: [
        SizedBox(
          width: buttonWidth,
          height: 57,
          child: ElevatedButton.icon(
            onPressed: () => _editPatientDetails(patient),
            icon: const Icon(Icons.edit, size: 15),
            label: const Text(
              'Modifier les détails du patient',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1C8EB4),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
      
        SizedBox(
          width: buttonWidth,
          height: 57,
          child: OutlinedButton.icon(
            onPressed: () => _deletePatient(patient),
            icon: const Icon(Icons.delete, size: 12),
            label: const Text(
              'Supprimer Patient',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xFFE9F6FA),
              foregroundColor: const Color(0xFF1C8EB4),
              side: const BorderSide(color: Color(0xFF1C8EB4), width: 1),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentsSection(List<Appointment> appointments, BoxConstraints constraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rendez-vous:',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
              fontSize: 25,
              height: 1.2,
              color: Color(0xFF13A4AB),
            ),
          ),
          const SizedBox(height: 15),
          _buildCreateAppointmentButton(constraints),
          const SizedBox(height: 15),
          _buildAppointmentsList(appointments, constraints),
        ],
      ),
    );
  }

  Widget _buildCreateAppointmentButton(BoxConstraints constraints) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        onPressed: () => _createAppointment(),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E96BE),
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Créer un rendez-vous',
          style: TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildAppointmentsList(List<Appointment> appointments, BoxConstraints constraints) {
    if (appointments.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(40),
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
        child: Column(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Aucun rendez-vous trouvé',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ce patient n\'a pas encore de rendez-vous programmés.',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 14,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Column(
      children: List.generate(appointments.length, (index) => 
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: _buildAppointmentCard(appointments[index], constraints),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(Appointment appointment, BoxConstraints constraints) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getSafePatientDisplayName(appointment.patient),
            style: const TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 1.4,
              color: Color(0xFF103459),
            ),
          ),
          const SizedBox(height: 15),
          _buildAppointmentDetails(appointment, constraints),
          const SizedBox(height: 15),
          _buildAppointmentActions(appointment),
        ],
      ),
    );
  }

  Widget _buildAppointmentDetails(Appointment appointment, BoxConstraints constraints) {
    return LayoutBuilder(
      builder: (context, detailsConstraints) {
        return Column(
          children: [
            // Doctor info (full width)
            _buildDetailRow(Icons.person, 'Docteur: Dr. ${appointment.doctor.prenom} ${appointment.doctor.nom}'),
            const SizedBox(height: 5),
            
            // Date and Time row
            Row(
              children: [
                Expanded(
                  child: _buildDetailRow(Icons.calendar_today, 'Date: ${_formatDate(appointment.date)}'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildDetailRow(Icons.access_time, 'Heure: ${appointment.heure}'),
                ),
              ],
            ),
            const SizedBox(height: 5),
            
            // Status and Consultation row
            Row(
              children: [
                Expanded(
                  child: _buildDetailRow(Icons.info, 'Status: ${_getStatusDisplay(appointment.status)}'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildDetailRow(
                    Icons.note, 
                    'Consultation: ${appointment.linkedConsultation != null ? 'Créée' : 'Non-créée'}'
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 11,
              color: const Color(0xFF13A4AB),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.4,
                  color: Color(0xFF393C3C),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        );
      },
    );
  }

Widget _buildAppointmentActions(Appointment appointment) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSmallButton('Modifier', () => _modifyAppointment(appointment)),
        SizedBox(width: 4), // Adjust spacing as needed
        _buildSmallButton('Annuler', () => _cancelAppointment(appointment)),
        SizedBox(width: 4),
        _buildSmallButton('Voir patient', () => _viewPatientFromAppointment(appointment)),
      ],
    ),
  );
}


  Widget _buildSmallButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 80,
      height: 29,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF13A4AB),
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
} 