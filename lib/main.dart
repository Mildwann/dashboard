import 'constants/app_import.dart';

void main() {
  configureDependencies();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final DashboardViewmodel dashboardViewmodel = DashboardViewmodel();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDashBord(),
      theme: ThemeData(scaffoldBackgroundColor: ColorApp.backgroundColor),
      debugShowCheckedModeBanner: false,
    );
  }
}
