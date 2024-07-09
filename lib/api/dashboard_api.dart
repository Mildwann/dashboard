import 'package:dashbord_flutter/dashboard/model/dashboard_complete.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_model.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_order.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_service.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'dashboard_api.g.dart';

@RestApi()
abstract class DashboardApi {
  factory DashboardApi(Dio dio, {String? baseUrl}) = _DashboardApi;

  @POST('/dashboard/order/status')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<dasboardRespond>> getDashboardStatus(
    @Body() Map<String, dynamic> body,
  );

  @POST('/dashboard/service')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<ServiceDashboard>> getDashboardService(
    @Body() Map<String, dynamic> body,
  );

  @POST('/dashboard/order')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<OrderDashboard>> getDashboardOrder(
    @Body() Map<String, dynamic> body,
  );

  @POST('dashboard/order/complete')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<CompleteDashboard>> getComplete(
    @Body() Map<String, dynamic> body,
  );
}
