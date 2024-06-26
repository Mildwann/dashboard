// ignore_for_file: no_logic_in_create_state

import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/dashboard/components/orderItemsummary.dart';
import 'package:dashbord_flutter/dashboard/components/standardsearch.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_viewmodel.dart';
import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/dashboard/components/ordertype.dart';
import 'package:dashbord_flutter/dashboard/tabveiwer/tabView.dart';
import 'package:dashbord_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class MyDashBord extends StatefulWidget {
  const MyDashBord({super.key});

  @override
  State<MyDashBord> createState() => _MyDashBordState();
}

class _MyDashBordState extends State<MyDashBord> {
  final DashboardViewmodel viewModel = getIt();

  TextEditingController employeeController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  @override
  void initState() {
    viewModel.getDashboard();
    viewModel.fetchUser();
    super.initState();
  }

  @override
  void dispose() {
    employeeController.dispose();
    fullnameController.dispose();
    departmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    String convertNumber(double number) {
      if (number >= 1000) {
        return NumberFormat('#,###0.00').format(number);
      } else {
        return number.toString();
      }
    }

    String convertNodouble(int number) {
      if (number >= 1000) {
        return NumberFormat('#,###').format(number);
      } else {
        return number.toString();
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 40),
              child: const Text(
                "Dashbord",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    fontFamily: 'NT',
                    color: frontColor.black),
              ),
            ),

            // StandardSearch
            Container(
              decoration: BoxDecoration(
                color: ColorApp.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(41, 72, 152, 0.06),
                    offset: Offset(0, 0),
                    blurRadius: 50,
                    spreadRadius: 0,
                  ),
                ],
              ),
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(32, 32, 20, 32),
                    child: const Text(
                      "Standard search",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: "NT"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Standardsearch(
                          head: "User ID ",
                          hintText: "search",
                          icon: Icons.search,
                          controller: employeeController,
                        ),
                        Standardsearch(
                          head: "Billing Account (BA) ",
                          hintText: "search",
                          icon: Icons.search,
                          controller: fullnameController,
                        ),
                        Standardsearch(
                          head: "Calendar ",
                          hintText: "search",
                          icon: Icons.calendar_today_outlined,
                          controller: departmentController,
                        ),
                      ],
                    ),
                  ),

                  // //Clear button / Search Button
                  Container(
                    padding: const EdgeInsets.only(right: 32, bottom: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Clear button
                        Container(
                          width: 180,
                          height: 42,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 241, 213, 85))),
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                              child: Text(
                                'Clear',
                                style: TextStyle(
                                    color: buttonColor.yellow,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        // Search Button
                        Container(
                          width: 180,
                          height: 42,
                          child: ElevatedButton(
                            onPressed: () {
                              // _viewmodel.search(orderid: employeeController);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor.yellow,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                              child: Text(
                                'Search',
                                style: TextStyle(
                                    color: ColorApp.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            //Order Item Summary
            Container(
              margin: const EdgeInsets.fromLTRB(30, 40, 30, 40),
              height: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: ColorApp.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(41, 72, 152, 0.06),
                            offset: Offset(0, 0),
                            blurRadius: 50,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Order Item Summary",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 32),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Orderitemsummary(
                                  title: "New",
                                  amount: convertNumber(280000),
                                  image: Assets.images.icNew.image(),
                                  total: convertNumber((viewModel.respond.data!
                                              .items![0].totalItems ??
                                          0)
                                      .toDouble()),
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: Orderitemsummary(
                                  title: "Provisioning",
                                  amount: convertNumber(90000),
                                  image: Assets.images.provisoning.image(),
                                  total: convertNumber(9),
                                )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Orderitemsummary(
                                  title: "Billing",
                                  amount: convertNumber(590000),
                                  image: Assets.images.billing.image(),
                                  total: convertNumber(59),
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: Orderitemsummary(
                                  title: "Complete",
                                  amount: convertNumber(1280000),
                                  image: Assets.images.complete.image(),
                                  total: convertNumber(128),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),

                  //OrderType
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(41, 72, 152, 0.06),
                            offset: Offset(0, 0),
                            blurRadius: 50,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Order Type",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 32),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                              child: Ordertype(
                            title: "New",
                            amount: convertNumber(1090000),
                            order: convertNodouble(2099),
                            color: ColorOrderType.yellow,
                            image: 'assets/images/newnoback.png',
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Ordertype(
                            title: "Modify",
                            amount: convertNumber(88000),
                            order: convertNodouble(890),
                            color: ColorOrderType.orange,
                            image: 'assets/images/edit.png',
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Order Item
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              height: 850,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(41, 72, 152, 0.06),
                            offset: Offset(0, 0),
                            blurRadius: 50,
                            spreadRadius: 0,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      width: (width - 60) * 0.59,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Item",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 36),
                          ),
                          Expanded(
                            child: TabView(), //TabVeiw
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),

                  // Approve
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 750,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(41, 72, 152, 0.06),
                            offset: Offset(0, 0),
                            blurRadius: 50,
                            spreadRadius: 0,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 30, top: 30),
                            child: const Text(
                              "Approve Task",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 32),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 25),
                            height: 150,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 30, top: 30),
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Provisioning",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Color.fromARGB(
                                                  255, 151, 102, 214),
                                              size: 10,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Text(
                                                "200 Task",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 30, top: 30),
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Package/component",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Color.fromARGB(
                                                  255, 232, 143, 173),
                                              size: 10,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Text(
                                                "60 Task",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 30, top: 30),
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Backdate",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: Color.fromARGB(
                                                    255, 79, 162, 218),
                                                size: 10,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  "80 Task",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 344,
                            child: Expanded(
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                  const Text(
                                    "340 Task",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32),
                                  ),
                                  PieChart(PieChartData(sections: [
                                    PieChartSectionData(
                                        radius: 60,
                                        value: 80,
                                        color: approveColor.blue),
                                    PieChartSectionData(
                                        radius: 60,
                                        value: 60,
                                        color: approveColor.pink),
                                    PieChartSectionData(
                                        radius: 60,
                                        value: 200,
                                        color: approveColor.purple)
                                  ])),
                                ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
