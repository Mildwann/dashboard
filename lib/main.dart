import 'package:dashbord_flutter/transfer_approve/TransferApprove.dart';
import 'package:dashbord_flutter/approve_task/app_injector.dart';
import 'package:dashbord_flutter/approve_task/approve_task_page.dart';
import 'package:dashbord_flutter/close_task/closeTask.dart';
import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/DashBord/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  setupInjector();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDashBord(),
      theme: new ThemeData(scaffoldBackgroundColor: ColorApp.backgroundColor),
      debugShowCheckedModeBanner: false,
    );
  }
}
