// ignore_for_file: avoid_print

import 'package:dashbord_flutter/approve_task/model/searchInquire_model.dart';
import 'package:dashbord_flutter/constants/app_import.dart';

class SearchinquireViewmodel with ChangeNotifier {
  EventBus eventBus = EventBus();
  final ApproveApi approveApi = getIt<ApproveApi>();

  late Status _status;
  late Data _data;

  Data get data => _data;
  Status get status => _status;

  Future<void> getSearch2() async {
    final requestBody = {
      "page": 1,
      "page_size": 100,
      "items": {
        "approval_task_id": "string",
        "approval_status_value": "string", //
        "subject": "string",
        "service_item_id": "string",
        "task_status_value": "string",
        "approver_user_id": "string",
        "due_date": "string",
        "task_type": "string", //
        "order_id": "string" //
      }
    };

    try {
      final result = await approveApi.getSearch(requestBody);

      // Ensure that result.status and result.data are not null
      if (result.data?.status?.code == 200 && result.data?.data != null) {
        _data = result.data.data!; // Assign result.data.data to _data
        print(data);
        notifyListeners(); // Notify listeners about the change
      } else {
        // Handle the case when the status code is not 200 or data is null
        print("Failed to fetch data");
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      print("Error occurred: $e");
    }
  }
}
