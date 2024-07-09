// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:dashbord_flutter/api/dashboard_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_service.dart';

import 'package:flutter/material.dart';

class DashboardServiceViewmodel with ChangeNotifier {
  final DashboardApi dashboardApi = getIt();
  late DashboardServiceViewmodel _serviceViewmodel;
  late Status _status;
  late Data _data;
  late ApproveTask _approveTask;
  late OrderType _orderType;
  late NewOrder _newOrder;

  DashboardServiceViewmodel get respond => _serviceViewmodel;
  Status get status => _status;
  Data get data => _data;
  ApproveTask get approveTask => _approveTask;
  OrderType get orderType => _orderType;
  NewOrder get newOrder => _newOrder;

  Future<void> getService() async {
    final requestBody = {
      "user_id": "",
      "billing_acct_number": "",
      "month": "01",
      "year": "2019"
    };

    final result = await dashboardApi.getDashboardService(requestBody);
    if (result.data.status?.code == 200) {
      result.data.data?.approveTask = approveTask;
      result.data.data?.orderType = orderType;
    } else {
      print("No");
    }
    notifyListeners();
  }
}
