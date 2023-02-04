// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_app/api/weather_api_client.dart' as _i6;
import 'package:weather_app/cubit/city_cubit/city_cubit.dart' as _i8;
import 'package:weather_app/cubit/home_cubit/home_cubit.dart' as _i9;
import 'package:weather_app/cubit/splash_cubit/splash_cubit.dart' as _i5;
import 'package:weather_app/service/api_service.dart' as _i7;
import 'package:weather_app/service/preferences_service.dart' as _i4;

import 'api_module.dart' as _i10;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final apiModule = _$ApiModule();
  gh.lazySingleton<_i3.Dio>(() => apiModule.dio());
  await gh.factoryAsync<_i4.PreferencesService>(
    () => _i4.PreferencesService.getInstance(),
    preResolve: true,
  );
  gh.factory<_i5.SplashCubit>(
      () => _i5.SplashCubit(gh<_i4.PreferencesService>()));
  gh.lazySingleton<_i6.WeatherApiClient>(
      () => apiModule.apiClient(gh<_i3.Dio>()));
  gh.factory<_i7.ApiService>(() => _i7.ApiService(gh<_i6.WeatherApiClient>()));
  gh.factory<_i8.CityCubit>(() => _i8.CityCubit(gh<_i4.PreferencesService>()));
  gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(
        gh<_i7.ApiService>(),
        gh<_i4.PreferencesService>(),
      ));
  return getIt;
}

class _$ApiModule extends _i10.ApiModule {}
