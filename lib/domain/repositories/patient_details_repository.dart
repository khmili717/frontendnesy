import 'package:foresight_care/domain/entities/patient_details.dart';

abstract class PatientDetailsRepository {
  Future<PatientDetails> getPatientDetails(String patientId);
  Future<List<PatientAppointment>> getPatientAppointments(String patientId);
  Future<List<PatientConsultation>> getPatientConsultations(String patientId);
} 