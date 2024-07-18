// // ignore_for_file: avoid_print

// import 'package:dashbord_flutter/api/approve_api.dart';
// import 'package:dashbord_flutter/app_injector.dart';
// import 'package:dashbord_flutter/approve_task/model/approve_status.dart';
// import 'package:flutter/material.dart';
// import 'package:event_bus/event_bus.dart';

// class ApproveStatusViewModel with ChangeNotifier {
//   final ApproveApi approveApi = getIt();
//   EventBus eventBus = EventBus();

//   late StatusAppoveStatus _statusAppoveStatus;
//   late DataAppoveStatus _dataAppoveStatus;
//   late ItemsAppoveStatus _itemStatus;

//   DataAppoveStatus get dataStatus => _dataAppoveStatus;
//   StatusAppoveStatus get status2 => _statusAppoveStatus;
//   ItemsAppoveStatus get itemStatus => _itemStatus;

//   Future<void> getAppStatus() async {
//     final result = await approveApi.getApproveStatus();
//     if (result.data.status?.code == 200) {
//       result.data.data?.items;
//       print(itemStatus);
//     } else {
//       print("No");
//     }
//     notifyListeners();
//   }
// }
