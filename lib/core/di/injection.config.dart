// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:foresight_care/core/di/injection.dart' as _i208;
import 'package:foresight_care/core/network/api_client.dart' as _i1019;
import 'package:foresight_care/core/network/dio_client.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i558.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i457.DioClient>(
        () => registerModule.dioClient(gh<_i558.FlutterSecureStorage>()));
    gh.singleton<_i1019.ApiClient>(
        () => registerModule.apiClient(gh<_i457.DioClient>()));
    return this;
  }
}

class _$RegisterModule extends _i208.RegisterModule {}
