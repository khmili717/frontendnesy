import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/patient_details/presentation/providers/patient_details_provider.dart';
import 'package:foresight_care/features/patient_details/presentation/widgets/patient_info_section.dart';
import 'package:foresight_care/features/patient_details/presentation/widgets/patient_appointments_section.dart';
import 'package:foresight_care/features/patient_details/presentation/widgets/patient_consultations_section.dart';
import 'package:foresight_care/features/patient_details/presentation/widgets/smooth_loading_widget.dart';

class PatientDetailsScreen extends ConsumerStatefulWidget {
  final String patientId;
  final String patientName;

  const PatientDetailsScreen({
    super.key,
    required this.patientId,
    required this.patientName,
  });

  @override
  ConsumerState<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends ConsumerState<PatientDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    
    // Load patient data when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(patientDetailsProvider.notifier).loadAllPatientData(widget.patientId);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    // Note: Don't clear Riverpod state in dispose as ref is no longer valid
    // Riverpod will handle state cleanup automatically
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final patientDetailsState = ref.watch(patientDetailsProvider);
    final isLoading = ref.watch(patientDetailsLoadingProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF103459),
          ),
        ),
        title: Text(
          widget.patientName,
          style: const TextStyle(
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF103459),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: const Color(0xFFE9ECEF),
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: SmoothLoadingWidget(
                message: 'Chargement des informations patient...',
                size: 60,
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Patient Information Section
                  if (patientDetailsState.patientDetails != null)
                    PatientInfoSection(
                      patientDetails: patientDetailsState.patientDetails!,
                    ),
                  
                  if (patientDetailsState.detailsError != null)
                    SmoothErrorWidget(
                      title: 'Erreur de chargement',
                      message: patientDetailsState.detailsError!,
                      onRetry: () => ref.read(patientDetailsProvider.notifier)
                          .loadPatientDetails(widget.patientId),
                      icon: Icons.person_off,
                    ),

                  const SizedBox(height: 24),

                  // Tabbed Section for Appointments and Consultations
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
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
                        // Tab bar
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFE9ECEF),
                                width: 1,
                              ),
                            ),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(
                                color: Color(0xFF13A4AB),
                                width: 3,
                              ),
                            ),
                            labelColor: const Color(0xFF13A4AB),
                            unselectedLabelColor: const Color(0xFF6C757D),
                            labelStyle: const TextStyle(
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            tabs: [
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.calendar_today_outlined, size: 18),
                                    const SizedBox(width: 8),
                                    Text('Rendez-vous (${ref.watch(patientAppointmentsCountProvider)})'),
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.medical_services_outlined, size: 18),
                                    const SizedBox(width: 8),
                                    Text('Consultations (${ref.watch(patientConsultationsCountProvider)})'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Tab content
                        SizedBox(
                          height: 400, // Fixed height for tab content
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              // Appointments tab
                              PatientAppointmentsSection(
                                appointments: patientDetailsState.appointments,
                                isLoading: patientDetailsState.isLoadingAppointments,
                                error: patientDetailsState.appointmentsError,
                                onRetry: () => ref.read(patientDetailsProvider.notifier)
                                    .loadPatientAppointments(widget.patientId),
                              ),

                              // Consultations tab
                              PatientConsultationsSection(
                                consultations: patientDetailsState.consultations,
                                isLoading: patientDetailsState.isLoadingConsultations,
                                error: patientDetailsState.consultationsError,
                                onRetry: () => ref.read(patientDetailsProvider.notifier)
                                    .loadPatientConsultations(widget.patientId),
                              ),
                            ],
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
} 