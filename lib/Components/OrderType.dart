import 'package:flutter/material.dart';

class Ordertype extends StatelessWidget {
  final String title;
  final String amount;
  final String order;
  final Color color;
  final IconData icon;
  const Ordertype(
      {super.key,
      required this.title,
      required this.amount,
      required this.order,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: Text(
              "$amount THB",
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    "$order Order",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
