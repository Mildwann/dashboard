// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:dashbord_flutter/api/dashboard_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_complete.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashboardCompleteViewmodel with ChangeNotifier {
  final DashboardApi dashboardApi = getIt();
  late DashboardCompleteViewmodel _dashboardCompleteViewmodel;
  late Status _status;
  late Data _data;
  late OrderComplete _orderComplete;

  DashboardCompleteViewmodel get respond => _dashboardCompleteViewmodel;
  Status get status => _status;
  Data get data => _data;
  OrderComplete get orderComplete => _orderComplete;

  Future<void> getComplete2() async {
    final requestBody = {
      "user_id": "wom112",
      "billing_acct_number": "1206451003",
      "year": "2024"
    };

    final result = await dashboardApi.getComplete(requestBody);
    if (result.data.status?.code == 200) {
      // result.data.data?.orderComplete = orderComplete;

      _orderComplete = result.data.data!.orderComplete!;
      print(orderComplete.toJson());
    } else {
      print("No");
    }
    notifyListeners();
  }

  Future<void> getCompleteByYear(String year) async {
    final requestBody = {
      "user_id": "wom112",
      "billing_acct_number": "1206451003",
      "year": year
    };

    final result = await dashboardApi.getComplete(requestBody);
    if (result.data.status?.code == 200) {
      // result.data.data?.orderComplete = orderComplete;

      _orderComplete = result.data.data!.orderComplete!;
      print(orderComplete.toJson());
    } else {
      print("No");
    }
    notifyListeners();
  }
}
