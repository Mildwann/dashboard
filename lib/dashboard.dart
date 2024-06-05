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
      body: Column(
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
            color: Colors.white,
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: const Text("Standard search"),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: (width - 100) / 3,
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          child: TextField(
                            controller: userId3Controller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal)),
                                hintText: 'Search',
                                suffixIcon: Icon(Icons.search)),
                          ),
                        ),
                      ),
                      Container(
                        width: (width - 100) / 3,
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          child: TextField(
                            controller: userId3Controller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal)),
                                hintText: 'Search',
                                suffixIcon: Icon(Icons.search)),
                          ),
                        ),
                      ),
                      Container(
                        width: (width - 100) / 3,
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          child: TextField(
                            controller: userId3Controller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal)),
                                hintText: 'Search',
                                suffixIcon: Icon(Icons.search)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {}, child: Text("Clear")),
                      TextButton(onPressed: () {}, child: Text("Search")),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 50, 30, 20),
            height: height * 0.3,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  width: (width - 60) * 0.59,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order"),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.black45,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.black45,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  width: (width - 60) * 0.39,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("data"),
                      Expanded(
                        child: Container(
                          height: 50,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          color: Colors.deepPurple,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
