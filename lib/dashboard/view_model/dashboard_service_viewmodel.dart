// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable, avoid_print, empty_catches

import 'package:dashbord_flutter/api/dashboard_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_complete.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_order.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_service.dart';
import 'package:flutter/material.dart';

class DashboardServiceViewmodel with ChangeNotifier {
  final DashboardApi dashboardApi = getIt();

  //service
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
  bool isLoadingOrderItem = true;
  bool isLoading = false;
  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  void setLoadingOrderItem(bool loading) {
    isLoadingOrderItem = loading;
    notifyListeners();
  }

  Future<void> getService() async {
    setLoadingOrderItem(true);
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
    } catch (e) {
    } finally {
      await Future.delayed(const Duration(milliseconds: 200));
      setLoadingOrderItem(false);
    }

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

  //Order
  late StatusOrderDashboard _statusOrderDashboard;
  late DataOrderDashboard _dataOrderDashboard;
  late Summary1OrderDashboard _summary;
  late NewSumOrderDashboard _newSum;
  late InprogressOrderDashboard _inprogress;
  late OverDueOrderDashboard _overDue;

  StatusOrderDashboard get statusOrderDashboard => _statusOrderDashboard;
  DataOrderDashboard get dataOrderDashboard => _dataOrderDashboard;
  Summary1OrderDashboard get summary => _summary;
  NewSumOrderDashboard get newsum => _newSum;
  InprogressOrderDashboard get inprogress => _inprogress;
  OverDueOrderDashboard get overDue => _overDue;

  Future<void> getOrder() async {
    setLoadingOrderItem(true);
    final requestBody = {
      "user_id": "wom112",
      "billing_acct_number": "1208108003",
      "month": "12",
      "year": "2022"
    };

    try {
      final result = await dashboardApi.getDashboardOrder(requestBody);
      if (result.data.status?.code == 200) {
        _inprogress = result.data.data!.inprogress!;
        _summary = result.data.data!.summary!;
      } else {
        print("No");
      }
    } catch (e) {
    } finally {
      setLoadingOrderItem(false);
    }

    notifyListeners();
  }

  // complete
  late StatusCompleteDashboard _statusCompleteDashboard;
  late DataCompleteDashboard _dataCompleteDashboard;
  late OrderComplete _orderComplete;

  StatusCompleteDashboard get statusComplete => _statusCompleteDashboard;
  DataCompleteDashboard get dataConplete => _dataCompleteDashboard;
  OrderComplete get orderComplete => _orderComplete;

  Future<void> getComplete2() async {
    setLoadingOrderItem(true);
    final requestBody = {
      "user_id": "wom112",
      "billing_acct_number": "1206451003",
      "year": "2024"
    };
    try {
      final result = await dashboardApi.getComplete(requestBody);
      if (result.data.status?.code == 200) {
        // result.data.data?.orderComplete =  orderComplete;

        _orderComplete = result.data.data!.orderComplete!;
        print(orderComplete.toJson());
      } else {
        print("No");
      }
    } catch (e) {
    } finally {
      setLoadingOrderItem(false);
    }

    notifyListeners();
  }

  Future<void> getCompleteByYear(String year) async {
    setLoadingOrderItem(true);
    final requestBody = {
      "user_id": "wom112",
      "billing_acct_number": "1206451003",
      "year": year
    };

    try {
      final result = await dashboardApi.getComplete(requestBody);
      if (result.data.status?.code == 200) {
        // result.data.data?.orderComplete = orderComplete;

        _orderComplete = result.data.data!.orderComplete!;
        print(orderComplete.toJson());
      } else {
        print("No");
      }
    } catch (e) {
    } finally {
      await Future.delayed(const Duration(milliseconds: 200));
      setLoadingOrderItem(false);
    }

    notifyListeners();
  }
}
