// ignore_for_file: avoid_print

import 'package:dashbord_flutter/api/approve_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/approve_task/model/approve_status.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

class ApproveStatusViewModel with ChangeNotifier {
  EventBus eventBus = EventBus();
  final ApproveApi approveApi = getIt();
  late Status _status;
  late Data _data;
  late Items _items;

  Data get data => _data;
  Status get status => _status;
  Items get item => _items;

  Future<void> getAppStatus() async {
    final result = await approveApi.getApproveStatus();
    if (result.data.status?.code == 200) {
      result.data.data?.items;
      print(item);
    } else {
      print("No");
    }
    notifyListeners();
  }
}
