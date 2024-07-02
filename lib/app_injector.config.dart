// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app_injector.dart' as _i5;
import 'approve_task/view_model/searchinquire_viewmodel.dart' as _i4;
import 'constants/app_import.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final viewModelModule = _$ViewModelModule();
  final interceptorModule = _$InterceptorModule();
  final thirdPartyModule = _$ThirdPartyModule();
  final apiModule = _$ApiModule();
  gh.factory<_i3.DashboardViewmodel>(
      () => viewModelModule.dashboardViewModel());
  gh.factory<_i3.ApproveViewModel>(() => viewModelModule.approveViewModel());
  gh.factory<_i4.SearchinquireViewmodel>(
      () => viewModelModule.searchinquireViewmodel());
  gh.singleton<_i3.Interceptor>(
    () => interceptorModule.prettyLoggerInterceptor(),
    instanceName: 'prettyLogger',
  );
  gh.singleton<_i3.Interceptor>(
    () => interceptorModule.curlInterceptor(),
    instanceName: 'curl',
  );
  gh.singleton<_i3.Dio>(() => thirdPartyModule.dio(
        gh<_i3.Interceptor>(instanceName: 'curl'),
        gh<_i3.Interceptor>(instanceName: 'prettyLogger'),
      ));
  gh.singleton<_i3.DashboardApi>(() => apiModule.dashboardapi(gh<_i3.Dio>()));
  gh.factory<_i3.ApproveApi>(() => apiModule.approveapi(gh<_i3.Dio>()));
  return getIt;
}

class _$ViewModelModule extends _i5.ViewModelModule {}

class _$InterceptorModule extends _i5.InterceptorModule {}

class _$ThirdPartyModule extends _i5.ThirdPartyModule {}

class _$ApiModule extends _i5.ApiModule {}
