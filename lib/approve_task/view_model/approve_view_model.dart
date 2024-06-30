import 'package:dashbord_flutter/api/approve_api.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/approve_task/model/approve_model.dart';
import 'package:flutter/material.dart';

class ApproveViewModel with ChangeNotifier {
  final ApproveApi approveApi = getIt();
  late Data _data;
  Data get data => _data;

  Future<ApproveModel> getApprove2() async {
    final result = await approveApi.getApprove();
    if (result.data.status?.code == 200) {
      _data = (result.data.data?.items ?? []) as Data;
      print(data);
    } else {
      print("No");
    }
    notifyListeners();
    return approveApi.getApprove().then((value) => value.data);
  }
}
