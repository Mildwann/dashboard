import 'package:dashbord_flutter/tabveiwer/TabView.dart';
import 'package:flutter/material.dart';

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
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                        Container(
                          width: ((width - 100) / 3) - 10,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(bottom: height * 0.005),
                                  child: const Text(
                                    "User ID",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextField(
                                    controller: userId3Controller,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.teal),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: 'Search',
                                        hintStyle:
                                            const TextStyle(fontSize: 13),
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.search,
                                            size: 16,
                                          ),
                                          onPressed: () {},
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: ((width - 100) / 3) - 10,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(bottom: height * 0.005),
                                  child: const Text(
                                    "Billing Account (BA)",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextField(
                                    controller: userId3Controller,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.teal),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: 'Search',
                                        hintStyle:
                                            const TextStyle(fontSize: 13),
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.search,
                                            size: 16,
                                          ),
                                          onPressed: () {},
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: ((width - 100) / 3) - 10,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(bottom: height * 0.005),
                                  child: const Text(
                                    "Calender",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextField(
                                    controller: userId3Controller,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.teal),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: 'Search',
                                        hintStyle:
                                            const TextStyle(fontSize: 13),
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.calendar_today_outlined,
                                            size: 16,
                                          ),
                                          onPressed: () {},
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Clear button
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Clear',
                            style: TextStyle(
                                color: Color.fromARGB(255, 241, 213, 85)),
                          ),
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
                        ),
                        const SizedBox(
                          width: 15,
                        ),

                        // Search Button
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            backgroundColor:
                                const Color.fromARGB(255, 241, 213, 85),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // row 2
            Container(
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 20),
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(115, 255,
                                            255, 255), // Background color
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                238, 231, 227, 227)),
                                        borderRadius: BorderRadius.circular(
                                            12) // Border color
                                        ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 210, 207, 28),
                                                      ),
                                                      child: const Icon(
                                                        Icons
                                                            .difference_outlined,
                                                        size: 13,
                                                        color: Colors.white,
                                                      )),
                                                  Flexible(
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: const Text(
                                                        "New",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Flexible(
                                              child: Text(
                                                "280,000 THB",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 13),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "28 Item",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(115, 255,
                                            255, 255), // Background color
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                238, 231, 227, 227)),
                                        borderRadius: BorderRadius.circular(
                                            12) // Border color
                                        ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color:
                                                          const Color.fromARGB(
                                                              222,
                                                              129,
                                                              73,
                                                              169),
                                                    ),
                                                    child: const Icon(
                                                      Icons
                                                          .edit_calendar_outlined,
                                                      size: 13,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: const Text(
                                                        "Provisioning",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Flexible(
                                              child: Text(
                                                "90,000.00 THB",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 13),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "9 Item",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
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
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(115, 255,
                                            255, 255), // Background color
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                238, 231, 227, 227)),
                                        borderRadius: BorderRadius.circular(
                                            12) // Border color
                                        ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color:
                                                          const Color.fromARGB(
                                                              222,
                                                              78,
                                                              154,
                                                              220),
                                                    ),
                                                    child: const Icon(
                                                      Icons
                                                          .description_outlined,
                                                      size: 13,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: const Text(
                                                        "Billing",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Flexible(
                                              child: Text(
                                                "590,000.00 THB",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 13),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "59 Item",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(115, 255,
                                            255, 255), // Background color
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              238, 231, 227, 227),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            12) // Border color
                                        ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: const Color
                                                            .fromARGB(
                                                            222, 91, 187, 91),
                                                      ),
                                                      child: const Icon(
                                                        Icons
                                                            .check_circle_outline_rounded,
                                                        size: 13,
                                                        color: Colors.white,
                                                      )),
                                                  Flexible(
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: const Text(
                                                        "Complete",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Flexible(
                                              child: Text(
                                                "1,280,000.00 THB",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 13),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "128 Item",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
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
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 228, 193, 55),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Flexible(
                                    child: Text(
                                      "New",
                                      style: TextStyle(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Flexible(
                                    child: Text(
                                      "1,090,000.00",
                                      style: TextStyle(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.difference_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Flexible(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          child: const Text(
                                            "2,099 Order",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 223, 142, 2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Flexible(
                                    child: Text(
                                      "Modify",
                                      style: TextStyle(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Flexible(
                                    child: Text(
                                      "88,000.00",
                                      style: TextStyle(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.edit_calendar_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Flexible(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          child: const Text(
                                            "890 Order",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                          const Text("data"),
                          Container(
                            height: 50,
                            color: Colors.deepPurple,
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
