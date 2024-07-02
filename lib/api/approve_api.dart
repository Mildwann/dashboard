import 'package:dashbord_flutter/approve_task/model/approve_model.dart';
import 'package:dashbord_flutter/approve_task/model/searchInquire_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'approve_api.g.dart';

@RestApi()
abstract class ApproveApi {
  factory ApproveApi(Dio dio, {String? baseUrl}) = _ApproveApi;

  @GET('/dropdown/approval_task_status')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<ApproveModel>> getApprove();

  @POST('/inquire_tasks/searchInquireApprovalTask')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<SearchInquireModel>> getSearch(
    @Body() Map<String, dynamic> body,
  );
}
