import 'dart:math';

import 'package:dashbord_flutter/Components/Transfer/MyTable.dart';
import 'package:dashbord_flutter/Components/Transfer/Search.dart';
import 'package:dashbord_flutter/constants/ColorApp.dart';

import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class TransferApprove extends StatefulWidget {
  const TransferApprove({super.key});

  @override
  State<TransferApprove> createState() => _TransferApproveState();
}

class _TransferApproveState extends State<TransferApprove> {
  bool _isEmployeeChecked = false;
  bool _isApprovalGroupChecked = false;
  int numberPages = 10;
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var pages = List.generate(
        numberPages,
        (index) => Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(40, 5, 40, 20),
                height: 984,
                width: (width - 80),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(248, 207, 24, 1))),
                child: MyTable(),
              ),
            ));

    Widget buildCustomCheckbox(
        String label, bool isChecked, Function(bool?) onChanged) {
      return GestureDetector(
        onTap: () {
          onChanged(!isChecked);
        },
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isChecked
                      ? const Color.fromARGB(255, 252, 181, 0)
                      : Colors.grey, // Border color
                  width: 1,
                ),
              ),
              child: isChecked
                  ? Center(
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 252, 181, 0),
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: width * 0.35),
              child: Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis, // Add overflow property
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Text(
            "Transfer Approval Task",
            style: TextStyle(
                color: Color.fromARGB(255, 252, 181, 0),
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: const Color.fromRGBO(254, 206, 0, 0.10),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 40, top: 20),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: buildCustomCheckbox(
                    "Search by employee",
                    _isEmployeeChecked,
                    (bool? value) {
                      setState(() {
                        _isEmployeeChecked = value!;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40, top: 20),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: buildCustomCheckbox(
                    "Search by approval group",
                    _isApprovalGroupChecked,
                    (bool? value) {
                      setState(() {
                        _isApprovalGroupChecked = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, top: 20, right: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Search(
                      head: "Employee ID",
                      hintText: "search",
                      icon: Icons.search),
                  Search(
                      head: "Full Name",
                      hintText: "search",
                      icon: Icons.search),
                  Search(
                      head: "Department",
                      hintText: "search",
                      icon: Icons.search),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 125,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {},
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
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Divider(color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  child: const Text(
                    "Select Transfer Approve Task",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Container(child: pages[currentpage]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 40),
                  width: 400,
                  child: NumberPaginator(
                    config: NumberPaginatorUIConfig(
                      buttonTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      buttonSelectedBackgroundColor: Colors.transparent,
                      buttonUnselectedBackgroundColor: Colors.transparent,
                      buttonShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Optional: Adjust border radius
                      ),
                      buttonUnselectedForegroundColor: Colors.black,
                      buttonSelectedForegroundColor: Colors.yellow,
                    ),
                    numberPages: numberPages,
                    onPageChange: (index) {
                      setState(() {
                        currentpage = index;
                      });
                      debugPrint("$index");
                    },
                  ),
                ),
              ],
            ),
            //button
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Cancel button
                  Container(
                    width: 160,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 241, 213, 85))),
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: buttonColor.yellow,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // Search Button
                  Container(
                    width: 160,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
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
                          'Submit',
                          style: TextStyle(
                              color: ColorApp.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
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
    );
  }
}
