// ignore_for_file: avoid_print

import 'package:dashbord_flutter/api/approve_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/approve_task/model/approve_model.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

class ApproveViewModel with ChangeNotifier {
  Items? showData;
  EventBus eventBus = EventBus();
  final ApproveApi approveApi = getIt();
  late Data _data;
  List<Items>? _items;

  Data get data => _data;
  List<Items>? get item => _items;

  Future<void> getApprove2() async {
    try {
      final result = await approveApi.getApprove();
      if (result.data.status?.code == 200) {
        _items = result.data.data?.items ?? [];
        print(item);
      } else {
        print("No");
      }
    } catch (e) {
      print("An error occurred: $e");
      eventBus.fire(ApproveError(e));
    }

    notifyListeners();
  }

  void setApproveDropdown(Items value) {
    showData = value;
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

// listItem: รายการของข้อมูลที่ใช้สำหรับ Dropdown จาก ViewModel.
// selectedValue: ค่าที่ถูกเลือกปัจจุบันใน Dropdown.
// callback: ฟังก์ชันที่ถูกเรียกเมื่อมีการเลือกค่าใน Dropdown.