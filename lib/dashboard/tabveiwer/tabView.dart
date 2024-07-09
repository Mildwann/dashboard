import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/dashboard/tabveiwer/Inprogress.dart';
import 'package:flutter/material.dart';
import 'complete.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              decoration: const BoxDecoration(),
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.only(right: 41),
                indicatorWeight: 5,
                indicatorColor: buttonColor.yellow,
                labelColor: buttonColor.yellow,
                unselectedLabelColor: Colors.grey.shade900,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                tabs: const [
                  Tab(
                    text: 'Inprogress',
                  ),
                  Tab(
                    text: 'Complete',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Inprogress(),
                  Complete(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
