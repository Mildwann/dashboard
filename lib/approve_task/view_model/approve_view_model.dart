// ignore_for_file: avoid_print

import 'dart:math';

import 'package:dashbord_flutter/api/approve_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/approve_task/model/approve_model.dart';
import 'package:dashbord_flutter/approve_task/model/approve_status.dart';
import 'package:dashbord_flutter/approve_task/model/updateprvlist_model.dart';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

import '../model/searchInquire_model.dart';

class ApproveViewModel with ChangeNotifier {
  bool isLoading = false;
  Items? showData;
  EventBus eventBus = EventBus();
  final ApproveApi approveApi = getIt();
  late Data _data;
  List<Items>? _items;
  List<ItemsSearchInquire>? _itemSearch;

  Data get data => _data;
  List<Items>? get item => _items;
  List<ItemsSearchInquire>? get itemSearch => _itemSearch;
  String? selectedTask;

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

  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  //Search
  Future<void> getSearch2(
      String approvalStatusValue, String taskType, String orderId) async {
    setLoading(true);
    final requestBody = {
      "page": 10,
      "page_size": 10,
      "items": {
        "approval_status_value": "2002",
        "task_type": taskType,
        "order_id": orderId
      }
    };

    try {
      final result = await approveApi.getSearch(requestBody);

      if (result.data.status?.code == 200 && result.data.data != null) {
        _itemSearch = result.data.data?.data?.items;
        print(item);
        notifyListeners();
      } else {
        print("Failed to fetch data");
      }
    } catch (e) {
      print("Error occurred: $e");
    } finally {
      await Future.delayed(const Duration(seconds: 1));
      setLoading(false);
    }
  }

  Future<void> getSearchBase() async {
    final requestBody = {
      "page": 1,
      "page_size": 10,
      "items": {
        "approval_status_value": "2002",
        "task_type": "Provisioning",
        "order_id": ""
      }
    };

    try {
      final result = await approveApi.getSearch(requestBody);

      if (result.data.status?.code == 200 && result.data.data != null) {
        _itemSearch = result.data.data?.data?.items;
        print(item);
        print("${itemSearch?[0].subject} item");
        print("item");
        notifyListeners();
      } else {
        print("Failed to fetch data");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  void setApproveDropdown(Items value) {
    showData = value;
    notifyListeners();
  }

  void setDropdownDefault() {
    showData = null;
    selectedTask = null;
    notifyListeners();
  }

  void setDropDownTaskType(value) {
    selectedTask = value;
    notifyListeners();
  }

  void setSelected(int index, bool value) {
    _itemSearch?[index].isSelected = value;
    notifyListeners();
  }

  late StatusAppoveStatus _statusAppoveStatus;
  late DataAppoveStatus _dataAppoveStatus;
  late ItemsAppoveStatus _itemStatus;

  DataAppoveStatus get dataStatus => _dataAppoveStatus;
  StatusAppoveStatus get status2 => _statusAppoveStatus;
  ItemsAppoveStatus get itemStatus => _itemStatus;

  Future<void> getAppStatus() async {
    final result = await approveApi.getApproveStatus();
    if (result.data.status?.code == 200) {
      result.data.data?.items;
      print(itemStatus);
    } else {
      print("No");
    }
    notifyListeners();
  }

  StatusupdatePrvList? _statusupdatePrvList;
  StatusupdatePrvList? get statusupdate => _statusupdatePrvList;
  String? description;

  Future<void> getupdateList(String descp, String date) async {
    List<ItemsSearchInquire>? checkid =
        itemSearch?.where((e) => e.isSelected == true).toList();

    List<String> checkidstring = [];

    for (var e in (checkid ?? [])) {
      checkidstring.add(e.approvalTaskId ?? "");
    }

    final requestBody = {
      "data_list": checkidstring, //["240125005602"],
      "param": {
        "status": "3004",
        "descp": descp,
        "closeDate": date,
      }
    };

    try {
      final result = await approveApi.getUpdate(requestBody);

      if (result.data.status?.code == 200) {
        description = result.data.status?.description ?? "";
        _statusupdatePrvList = result.data.data;
        eventBus.fire(ApproveSuccess());
      } else {
        print("Failed to fetch data");
      }
    } catch (e) {
      eventBus.fire(ApproveError(e));

      print("Error occurred: $e");
    }
    notifyListeners();
  }
}

class ApproveError {
  Object error;
  ApproveError(this.error);
}

class ApproveSuccess {
  ApproveSuccess();
}
