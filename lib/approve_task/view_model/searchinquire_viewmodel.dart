// ignore_for_file: avoid_print

import 'package:dashbord_flutter/approve_task/model/searchInquire_model.dart';
import 'package:dashbord_flutter/constants/app_import.dart';

class SearchinquireViewmodel with ChangeNotifier {
  EventBus eventBus = EventBus();
  final ApproveApi approveApi = getIt<ApproveApi>();

  late Status _status;
  late Data _data;
  List<Items>? _item;

  Data get data => _data;
  Status get status => _status;
  List<Items>? get item => _item;

  Future<void> getSearch2(
      String approvalStatusValue, String taskType, String orderId) async {
    final requestBody = {
      "page": 10,
      "page_size": 10,
      "items": {
        "approval_status_value": "2002",
        "task_type": taskType,
        "order_id": orderId
      }
    };

    try {
      final result = await approveApi.getSearch(requestBody);

      if (result.data.status?.code == 200 && result.data.data != null) {
        _item = result.data.data?.data?.items;
        print(item);
        notifyListeners();
      } else {
        print("Failed to fetch data");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  Future<void> getSearchBase() async {
    final requestBody = {
      "page": 1,
      "page_size": 10,
      "items": {
        "approval_status_value": "2002",
        "task_type": "Provisioning",
        "order_id": ""
      }
    };

    try {
      final result = await approveApi.getSearch(requestBody);

      if (result.data.status?.code == 200 && result.data.data != null) {
        _item = result.data.data?.data?.items;
        print(item);
        print("${item?[0].subject} item");
        print("item");
        notifyListeners();
      } else {
        print("Failed to fetch data");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }
}
