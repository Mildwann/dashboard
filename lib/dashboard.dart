import 'package:dashbord_flutter/Components/OrderItemSummary.dart';
import 'package:dashbord_flutter/Components/OrderType.dart';
import 'package:dashbord_flutter/Components/StandardSearch.dart';
import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/constants/MyIcons.dart';
import 'package:dashbord_flutter/tabveiwer/TabView.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class MyDashBord extends StatefulWidget {
  const MyDashBord({Key? key}) : super(key: key);

  @override
  State<MyDashBord> createState() => _MyDashBordState();
}

class _MyDashBordState extends State<MyDashBord> {
  TextEditingController userId1Controller = TextEditingController();
  TextEditingController userId2Controller = TextEditingController();
  TextEditingController userId3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 20),
              child: const Text(
                "Dashbord",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),

            // StandardSearch
            Container(
              decoration: BoxDecoration(
                  color: ColorApp.white,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: const Text(
                      "Standard search",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Standardsearch(
                            head: "User ID ",
                            hintText: "search",
                            icon: Icons.search),
                        Standardsearch(
                            head: "Billing Account (BA) ",
                            hintText: "search",
                            icon: Icons.search),
                        Standardsearch(
                            head: "Calender ",
                            hintText: "search",
                            icon: Icons.calendar_today_outlined),
                      ],
                    ),
                  ),

                  // //Clear button / Search Button
                  Container(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Clear button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 241, 213, 85))),
                            textStyle: const TextStyle(fontSize: 14),
                          ),
                          child: const Text(
                            'Clear',
                            style: TextStyle(color: buttonColor.yellow),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        // Search Button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            backgroundColor: buttonColor.yellow,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          child: const Text(
                            'Search',
                            style: TextStyle(color: ColorApp.white),
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
              margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: ColorApp.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: (width - 60) * 0.59,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              "Order Item Summary",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Orderitemsummary(
                                  title: "New",
                                  amount: convertNumber(2800000),
                                  icon: Myicons.NewIcon,
                                  total: convertNumber(28),
                                  color: iconColor.yellow,
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Orderitemsummary(
                                        title: "Provisioning",
                                        amount: convertNumber(90000),
                                        icon: Myicons.ProvisioningIcon,
                                        total: convertNumber(9),
                                        color: iconColor.purple)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Orderitemsummary(
                                        title: "Billing",
                                        amount: convertNumber(590000),
                                        icon: Myicons.BillingIcon,
                                        total: convertNumber(59),
                                        color: iconColor.blue)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Orderitemsummary(
                                        title: "Complete",
                                        amount: convertNumber(1280000),
                                        icon: Myicons.CompleteIcon,
                                        total: convertNumber(128),
                                        color: iconColor.green)),
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
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: (width - 60) * 0.39,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Order Type",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Ordertype(
                            title: "New",
                            amount: convertNumber(1090000),
                            order: convertNodouble(2099),
                            color: ColorOrderType.yellow,
                            icon: Myicons.NewIcon,
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Ordertype(
                            title: "Modify",
                            amount: convertNumber(88000),
                            order: convertNodouble(890),
                            color: ColorOrderType.Orange,
                            icon: Icons.edit_calendar_outlined,
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              height: 600,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: (width - 60) * 0.59,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Item",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                  // Box 2
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 500,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: (width - 60) * 0.39,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Approve Task",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 25),
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Provisioning",
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
                                  child: Container(
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Package/component",
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
                                  child: Container(
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Backdate",
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
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                              child:
                                  Stack(alignment: Alignment.center, children: [
                            const Text(
                              "340 Task",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            PieChart(PieChartData(sections: [
                              PieChartSectionData(
                                  radius: 60,
                                  value: 80,
                                  color:
                                      const Color.fromARGB(255, 79, 162, 218)),
                              PieChartSectionData(
                                  radius: 60,
                                  value: 60,
                                  color:
                                      const Color.fromARGB(255, 232, 143, 173)),
                              PieChartSectionData(
                                  radius: 60,
                                  value: 200,
                                  color:
                                      const Color.fromARGB(255, 151, 102, 214))
                            ])),
                          ]))
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
