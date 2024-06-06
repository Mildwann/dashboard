// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Inprogress extends StatelessWidget {
  const Inprogress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Over Due : 50 Item"),
          CombinedValueBarChart(
            dataMap: {
              "Flutter": 20,
              "React": 15,
              "Xamarin": 25,
            },
          ),
          Text("All Risk : 20 Item"),
          CombinedValueBarChart(
            dataMap: {
              "Flutter": 10,
              "React": 10,
            },
          ),
          Text("Due this week : 9 Item"),
          CombinedValueBarChart(
            dataMap: {
              "Flutter": 20,
              "React": 15,
              "Xamarin": 25,
            },
          ),
          Text("Due Thi month : 120 Item"),
          CombinedValueBarChart(
            dataMap: {
              "Flutter": 20,
              "React": 15,
              "Xamarin": 25,
            },
          ),
        ],
      ),
    );
  }
}

class CombinedValueBarChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colors = [
    Color.fromARGB(255, 228, 212, 104),
    Color.fromARGB(255, 151, 102, 214),
    Color.fromARGB(255, 79, 162, 218)
  ];

  CombinedValueBarChart({super.key, required this.dataMap});

  @override
  Widget build(BuildContext context) {
    dataMap.values.reduce((a, b) => a + b);

    return Column(
      children: [
        Row(
          children: dataMap.keys.map((key) {
            int index = dataMap.keys.toList().indexOf(key);
            return Expanded(
              flex: dataMap[key]!.toInt(),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.horizontal(
                    left: index == 0 ? Radius.circular(40) : Radius.zero,
                    right: index == dataMap.keys.length - 1
                        ? Radius.circular(40)
                        : Radius.zero,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${dataMap[key]}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
