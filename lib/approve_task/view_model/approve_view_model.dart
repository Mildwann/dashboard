// ignore_for_file: avoid_print

import 'package:dashbord_flutter/api/approve_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/approve_task/model/approve_model.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

class ApproveViewModel with ChangeNotifier {
  EventBus eventBus = EventBus();
  final ApproveApi approveApi = getIt();
  late Data _data;
  List<Items>? _items;

  Data get data => _data;
  List<Items>? get item => _items;

  Future<ApproveModel> getApprove2() async {
    try {
      final result = await approveApi.getApprove();
      if (result.data.status?.code == 200) {
        _items = result.data.data?.items ?? [];
        print(_items);
      } else {
        print("No");
      }
    } catch (e) {
      print("An error occurred: $e");
      eventBus.fire(ApproveError(e));
    }

    notifyListeners();
    return approveApi.getApprove().then((value) => value.data);
  }

  void setDropdown() {
    _items = [
      Items(key: "1", value: "20"),
      Items(key: "2", value: "100"),
      Items(key: "3", value: "150"),
    ];
    notifyListeners();
  }
}

class ApproveError {
  Object error;
  ApproveError(this.error);
}

class ApproveSuccess {
  Object sucess;
  ApproveSuccess(this.sucess);
}
