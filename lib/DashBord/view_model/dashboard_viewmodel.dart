// ignore_for_file: unused_field

import 'package:dashbord_flutter/DashBord/model/dashboard_respond.dart';
import 'package:flutter/material.dart';

class DashboardViewmodel with ChangeNotifier {
  late dasboardRespond _respond;
  late Status _status;
  late Data _data;
  late Items _item;

  dasboardRespond get respond => _respond;
  Status get status => _status;
  Data get data => _data;
  Items get item => _item;

  void fetchUser() {
    _status = Status(code: 200, description: "Success");
    _item = Items(
      id: '1',
      orderTypeLkp: 'orderTypeLkp',
      orderTypeLkpName: 'Order Type',
      orderSubTypeLkp: 'orderSubTypeLkp',
      orderSubTypeLkpName: 'Order Sub Type',
      customerFullName: 'John Doe',
      customerId: 'customerId',
      baId: 'baId',
      newStatus: 1,
      provisioning: 1,
      billing: 1,
      complete: 1,
      totalItems: 10,
      newStatusPer: 50.0,
      provisioningPer: 50.0,
      billingPer: 50,
      completePer: 50.0,
    );

    _data = Data(
      totalRecord: 5,
      currentPage: 1,
      pageSize: 10,
      items: [_item, _item],
    );

    _respond = dasboardRespond(status: _status, data: _data);
    notifyListeners();
  }
}
