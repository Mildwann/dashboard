// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:flutter/material.dart';

class Inprogress extends StatelessWidget {
  const Inprogress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSection("Over Due :", " 50 Item",
              {"Flutter": 10, "React": 15, "Xamarin": 25}),
          buildSection("Over Due :", " 20 Item", {"React": 10, "Xamarin": 10}),
          buildSection("Over Due :", " 9 Item", {
            "Flutter": 6,
            "React": 3,
          }),
          buildSection("Over Due :", " 120 Item",
              {"Flutter": 40, "React": 40, "Xamarin": 40}),
        ],
      ),
    );
  }

  Widget buildSection(String title, String item, Map<String, double> dataMap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                item,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 10),
          CombinedValueBarChart(dataMap: dataMap, colorMap: {
            "Flutter": orderItem.yellow,
            "React": orderItem.purple,
            "Xamarin": orderItem.blue,
          }),
        ],
      ),
    );
  }
}

class CombinedValueBarChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final Map<String, Color> colorMap;

  CombinedValueBarChart(
      {super.key, required this.dataMap, required this.colorMap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: dataMap.entries.map((entry) {
            return Expanded(
              flex: entry.value.toInt(),
              child: Container(
                height: 22,
                decoration: BoxDecoration(
                  color: colorMap[entry.key],
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(
                        dataMap.keys.first == entry.key ? 40 : 0),
                    right: Radius.circular(
                        dataMap.keys.last == entry.key ? 40 : 0),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${entry.value}',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
