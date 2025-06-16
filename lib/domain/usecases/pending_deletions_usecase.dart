import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/domain/repositories/pending_deletions_repository.dart';

class GetPendingDeletionsUseCase {
  final PendingDeletionsRepository _repository;

  GetPendingDeletionsUseCase(this._repository);

  Future<List<Patient>> call() async {
    return await _repository.getPendingDeletions();
  }
}

class CancelDeletionUseCase {
  final PendingDeletionsRepository _repository;

  CancelDeletionUseCase(this._repository);

  Future<void> call(String patientId) async {
    await _repository.cancelPatientDeletion(patientId);
  }
}

class ConfirmDeletionUseCase {
  final PendingDeletionsRepository _repository;

  ConfirmDeletionUseCase(this._repository);

  Future<void> call(String patientId) async {
    await _repository.confirmPatientDeletion(patientId);
  }
} 