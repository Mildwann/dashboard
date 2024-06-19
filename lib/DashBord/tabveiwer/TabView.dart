import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:flutter/material.dart';
import './complete.dart';
import './inprogress.dart';

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
              margin: const EdgeInsets.only(top: 20),
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
                  fontSize: 24,
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
                  const Inprogress(),
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
