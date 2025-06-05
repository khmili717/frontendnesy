import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/core/network/dio_client.dart';
import 'package:foresight_care/core/network/api_client.dart';
import 'package:foresight_care/domain/repositories/patient_details_repository.dart';
import 'package:foresight_care/data/repositories/patient_details_repository_impl.dart';
import 'package:foresight_care/domain/usecases/get_patient_details_usecase.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
  
  // Register patient details dependencies manually
  getIt.registerLazySingleton<PatientDetailsRepository>(
    () => PatientDetailsRepositoryImpl(getIt<ApiClient>()),
  );
  
  getIt.registerLazySingleton<GetPatientDetailsUseCase>(
    () => GetPatientDetailsUseCase(getIt<PatientDetailsRepository>()),
  );
  
  getIt.registerLazySingleton<GetPatientAppointmentsUseCase>(
    () => GetPatientAppointmentsUseCase(getIt<PatientDetailsRepository>()),
  );
  
  getIt.registerLazySingleton<GetPatientConsultationsUseCase>(
    () => GetPatientConsultationsUseCase(getIt<PatientDetailsRepository>()),
  );
}

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();

  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  @singleton
  DioClient dioClient(FlutterSecureStorage secureStorage) => DioClient(secureStorage);

  @singleton
  ApiClient apiClient(DioClient dioClient) => ApiClient(dioClient.dio);
} 