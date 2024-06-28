// ignore_for_file: unused_field, non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:dashbord_flutter/api/dashboard_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/dashboard/model/dashboard_respond.dart';
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

  // void fetchUser() {
  //   _status = Status(code: 200, description: "Success");
  //   _item = Items(
  //     id: '1',
  //     orderTypeLkp: 'orderTypeLkp',
  //     orderTypeLkpName: 'Order Type',
  //     orderSubTypeLkp: 'orderSubTypeLkp',
  //     orderSubTypeLkpName: 'Order Sub Type',
  //     customerFullName: 'John Doe',
  //     customerId: 'customerId',
  //     baId: 'baId',
  //     newStatus: 1,
  //     provisioning: 1,
  //     billing: 1,
  //     complete: 1,
  //     totalItems: 10,
  //     newStatusPer: 50.0,
  //     provisioningPer: 50.0,
  //     billingPer: 50,
  //     completePer: 50.0,
  //   );

  //   _data = Data(
  //     totalRecord: 5,
  //     currentPage: 1,
  //     pageSize: 10,
  //     items: [_item, _item],
  //   );

  //   _respond = dasboardRespond(status: _status, data: _data);
  //   notifyListeners();
  // }

  Future<void> getDashboard() async {
    final requestBody = {
      "user_id": "",
      "billing_acc_id": "9200264443",
      "date": "",
      "status_order": "0001",
      "page": 1,
      "page_size": 10
    };

    final result = await dashboardApi.getDashboardOrder(requestBody);

    if (result.data.status?.code == 200) {
      _item = result.data.data?.items ?? [];
      print(item);
    } else {
      print("No");
    }
    notifyListeners();
  }
}
