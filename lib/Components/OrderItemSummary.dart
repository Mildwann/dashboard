import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:flutter/material.dart';

class Orderitemsummary extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;
  final String total;
  final Color color;
  const Orderitemsummary(
      {super.key,
      required this.title,
      required this.amount,
      required this.icon,
      required this.total,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: ColorApp.white, // Background color
          border: Border.all(color: ColorApp.borderColor),
          borderRadius: BorderRadius.circular(12) // Border color
          ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: color),
                        child: Icon(
                          icon,
                          size: 13,
                          color: Colors.white,
                        )),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Text(
                  "$amount THB",
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$total Item",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
