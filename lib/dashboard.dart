import 'package:flutter/material.dart';

class MyDashBord extends StatelessWidget {
  const MyDashBord({super.key});
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(30),
              child: const Text(
                "Dashboard",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(0.3)),
            margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: const Text(
                  "Standard search",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                )),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: const Column(
                          children: [
                            Text(
                              "User ID",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
