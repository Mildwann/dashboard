import 'package:dashbord_flutter/approve_task/view_model/searchinquire_viewmodel.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_complete_viewmodel.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_order_viewmodel.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_service_viewmodel.dart';

import 'app_injector.config.dart';
import 'constants/app_import.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
GetIt configureDependencies() => $initGetIt(getIt);

@module
abstract class ThirdPartyModule {
  @singleton
  Dio dio(
    @Named("curl") Interceptor curl,
    @Named("prettyLogger") Interceptor prettyLogger,
  ) {
    final dio = Dio();
    dio.interceptors.add(curl);
    dio.interceptors.add(prettyLogger);
    dio.options.headers.addAll({"Content-Type": "application/json"});
    return dio;
  }
}

@module
abstract class InterceptorModule {
  @Named("curl")
  @singleton
  Interceptor curlInterceptor() => CurlLoggerDioInterceptor();

  @Named("prettyLogger")
  @singleton
  Interceptor prettyLoggerInterceptor() => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      );
}

@module
abstract class ApiModule {
  @singleton
  DashboardApi dashboardapi(Dio dio) =>
      DashboardApi(dio, baseUrl: "https://ntom-api.intense.co.th/OMNewAPI");
  ApproveApi approveapi(Dio dio) =>
      ApproveApi(dio, baseUrl: "https://ntom-api.intense.co.th/OMNewAPI");
}

@module
abstract class ViewModelModule {
  DashboardViewmodel dashboardViewModel() => DashboardViewmodel();
  ApproveViewModel approveViewModel() => ApproveViewModel();
  SearchinquireViewmodel searchinquireViewmodel() => SearchinquireViewmodel();
  DashboardServiceViewmodel dashboardServiceViewmodel() =>
      DashboardServiceViewmodel();
  DashboardOrderViewmodel dashboardOrderViewmodel() =>
      DashboardOrderViewmodel();
  DashboardCompleteViewmodel dashboardCompleteViewmodel() =>
      DashboardCompleteViewmodel();
}
