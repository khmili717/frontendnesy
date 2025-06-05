import 'package:foresight_care/domain/entities/patient.dart';

abstract class PendingDeletionsRepository {
  Future<List<Patient>> getPendingDeletions();
  Future<void> cancelPatientDeletion(String patientId);
} 