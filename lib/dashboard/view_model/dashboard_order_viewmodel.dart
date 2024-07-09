// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:dashbord_flutter/api/dashboard_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_order.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashboardOrderViewmodel with ChangeNotifier {
  final DashboardApi dashboardApi = getIt();
  late DashboardOrderViewmodel _dashboardOrderViewmodel;
  late Status _status;
  late Data _data;
  late Summary1 _summary;
  late NewSum _newSum;
  late Inprogress _inprogress;
  late OverDue _overDue;

  DashboardOrderViewmodel get respond => _dashboardOrderViewmodel;
  Status get status => _status;
  Data get data => _data;
  Summary1 get summary => _summary;
  NewSum get newsum => _newSum;
  Inprogress get inprogress => _inprogress;
  OverDue get overDue => _overDue;

  Future<void> getOrder() async {
    final requestBody = {
      "user_id": "wom112",
      "billing_acct_number": "1208108003",
      "month": "12",
      "year": "2022"
    };

    final result = await dashboardApi.getDashboardOrder(requestBody);
    if (result.data.status?.code == 200) {
      _inprogress = result.data.data!.inprogress!;
      _summary = result.data.data!.summary!;
    } else {
      print("No");
    }
    notifyListeners();
  }
}
