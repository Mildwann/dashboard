import 'package:dashbord_flutter/dashboard/model/dashboard_respond.dart';
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
  Future<HttpResponse<dasboardRespond>> getDashboardOrder(
    @Body() Map<String, dynamic> body,
  );
}
