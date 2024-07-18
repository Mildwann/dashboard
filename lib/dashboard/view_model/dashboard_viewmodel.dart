// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:dashbord_flutter/api/dashboard_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_model.dart';
import 'package:flutter/material.dart';

class DashboardViewmodel with ChangeNotifier {
  final DashboardApi dashboardApi = getIt();
  late dasboardRespond _respond;
  late Status _status;
  late Data _data;
  List<Items>? _item;

  dasboardRespond get respond => _respond;
  Status get status => _status;
  Data get data => _data;
  List<Items>? get item => _item;

  bool isLoadingOrderItem = true;
  bool isLoading = false;
  void setLoading(bool loading) {
    isLoading = loading;
    isLoadingOrderItem = loading;
    notifyListeners();
  }

  Future<void> getDashboard() async {
    final requestBody = {
      "user_id": "",
      "billing_acc_id": "9200264443",
      "date": "",
      "status_order": "0001",
      "page": 1,
      "page_size": 10
    };

    final result = await dashboardApi.getDashboardStatus(requestBody);

    if (result.data.status?.code == 200) {
      _item = result.data.data?.items ?? [];
      print(item);
    } else {
      print("No");
    }
    notifyListeners();
  }
}
