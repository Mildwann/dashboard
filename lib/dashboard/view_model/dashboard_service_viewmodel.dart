// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable, avoid_print, empty_catches

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

  bool isLoading = false;

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  Future<void> getService() async {
    final requestBody = {
      "user_id": "",
      "billing_acct_number": "",
      "month": "7",
      "year": "2019"
    };
    try {
      final result = await dashboardApi.getDashboardService(requestBody);
      if (result.data.status?.code == 200) {
        _orderType = result.data.data!.orderType!;
        _approveTask = result.data.data!.approveTask!;

        print(approveTask.toJson());
        print(orderType.toJson());
      } else {
        print("No");
      }
    } catch (e) {}

    notifyListeners();
  }

  Future<void> getServiceBySearch(
      String month, String year, String user, String billing) async {
    setLoading(true);

    final requestBody = {
      "user_id": user,
      "billing_acct_number": billing,
      "month": month,
      "year": year
    };
    try {
      final result = await dashboardApi.getDashboardService(requestBody);
      if (result.data.status?.code == 200) {
        _orderType = result.data.data!.orderType!;
        _approveTask = result.data.data!.approveTask!;

        print(approveTask.toJson());
        print(orderType.toJson());
      } else {
        print("No");
      }
    } catch (e) {
    } finally {
      await Future.delayed(const Duration(milliseconds: 200));
      setLoading(false);
    }

    notifyListeners();
  }
}
