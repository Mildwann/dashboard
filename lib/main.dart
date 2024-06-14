import 'package:dashbord_flutter/TransferApprove.dart';
import 'package:dashbord_flutter/closeTask.dart';
import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: closeTask(),
      theme: new ThemeData(scaffoldBackgroundColor: ColorApp.BackgroundColor),
      debugShowCheckedModeBanner: false,
    );
  }
}
