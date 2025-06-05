import 'package:foresight_care/domain/entities/patient_details.dart';
import 'package:foresight_care/domain/repositories/patient_details_repository.dart';

class GetPatientDetailsUseCase {
  final PatientDetailsRepository _repository;

  GetPatientDetailsUseCase(this._repository);

  Future<PatientDetails> call(String patientId) async {
    return await _repository.getPatientDetails(patientId);
  }
}

class GetPatientAppointmentsUseCase {
  final PatientDetailsRepository _repository;

  GetPatientAppointmentsUseCase(this._repository);

  Future<List<PatientAppointment>> call(String patientId) async {
    return await _repository.getPatientAppointments(patientId);
  }
}

class GetPatientConsultationsUseCase {
  final PatientDetailsRepository _repository;

  GetPatientConsultationsUseCase(this._repository);

  Future<List<PatientConsultation>> call(String patientId) async {
    return await _repository.getPatientConsultations(patientId);
  }
} 